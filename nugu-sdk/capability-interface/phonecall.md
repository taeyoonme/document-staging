---
description: 전화 수/발신 기능 제어를 위한 규격
---

# PhoneCall

## Version

최신 버전은 1.1 입니다.

## State Diagram

![](../../.gitbook/assets/image%20%2810%29.png)

## SDK Interface

### PhoneCallAgent 사용

PhoneCall interface 규격에 따른 디바이스의 동작 제어는 PhoneCallAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient 생성시 PhoneCallAgent 를 추가합니다.

```text
val phoneCallClient = object : PhoneCallClient {
    ...
}
NuguAndroidClient().Builder()
            .addAgentFactory(PhoneCallAgent.NAMESPACE, object : AgentFactory<PhoneCallAgent> {
                override fun create(container: SdkContainer): PhoneCallAgent = with(container) {
                    PhoneCallAgent(
                        phoneCallClient,
                        getContextManager(),
                        getMessageSender(),
                        getAudioSeamlessFocusManager(),
                        DefaultFocusChannel.COMMUNICATIONS_CHANNEL_NAME,
                        getDirectiveSequencer(),
                        getInteractionControlManager()
                    )
                }
            })
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 PhoneCallAgent instance 에 접근할 수 있습니다.

```text
let phoneCallAgent = nuguClient.phoneCallAgent
```
{% endtab %}
{% endtabs %}

### Context 구성

통화 상태 정보를 [Context](phonecall.md#context) 에 포함시켜 주어야 합니다.

{% tabs %}
{% tab title="Android" %}
PhoneCallClient.getContext\(\) 를 구현하여 통화 상태 정보와 마지막에 검색된 연락처 정보를 전달합니다.
{% endtab %}

{% tab title="iOS" %}
Context 를 전달하려면 PhoneCallAgentDelegate 를 추가합니다.

```text
phoneCallAgent.delegate = self
```

PhoneCallAgentDelegate.phoneCallAgentRequestState 을 구현하여 현재 통화 상태 정보를 전달합니다.

PhoneCallAgentDelegate.phoneCallAgentRequestTemplate 을 구현하여 마지막에 검색된 연락처 정보를 전달합니다.
{% endtab %}
{% endtabs %}

### 발신

전화 발신이 [SendCandidates](phonecall.md#sendcandidates), [MakeCall](phonecall.md#makecall) directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
PhoneCallClient.sendCandidates\(\) 에서 연락처 검색 기능을 구현합니다.

PhoneCallClient.makeCall\(\) 에서 전화 발신 기능을 구현합니다.
{% endtab %}

{% tab title="iOS" %}
발신 기능을 실행하려면 PhoneCallAgentDelegate 를 추가합니다.

```text
phoneCallAgent.delegate = self
```

PhoneCallAgentDelegate.phoneCallAgentDidReceiveSendCandidates\(\) 에서 연락처 검색 기능을 구현합니다.

PhoneCallAgentDelegate.phoneCallAgentDidReceiveMakeCall\(\) 에서 전화 발신 기능을 구현합니다.
{% endtab %}
{% endtabs %}

### 수신

수신 전화에 대한 수락이 [AcceptCall](phonecall.md#acceptcall) directive 로 요청될 수 있습니다.

## Context

```text
{
  "PhoneCall": {
    "version": "1.1",
    "state": "{{STRING}}",
    "template": {
      "intent": "{{STRING}}",
      "callType": "{{STRING}}",
      "recipientIntended": {
        "name": "{{STRING}}",
        "label": "{{STRING}}"
      },
      "candidates": [Person]
    }
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">state</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>IDLE, OUTGOING, INCOMING, ESTABLISHED</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">template</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Play &#xC5D0;&#xC11C; &#xC9C4;&#xD589;&#xC911;&#xC778; intent &#xB97C;
        &#xC54C; &#xC218; &#xC788;&#xB3C4;&#xB85D; SendCandidates event &#xC5D0;&#xC11C;
        &#xC804;&#xB2EC;&#xBC1B;&#xC740; data &#xB97C; &#xC720;&#xC9C0;&#xD574;&#xC57C;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>intent</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>candidates&#xC758; &#xC6A9;&#xB3C4;</p>
        <ul>
          <li><b>CALL</b> - &#xC804;&#xD654;&#xAC78;&#xC5B4;&#xC918;</li>
          <li><b>SEARCH</b> - &#xCC3E;&#xC544;&#xC918;</li>
          <li><b>HISTORY</b> - &#xCD5C;&#xADFC; &#xD1B5;&#xD654; &#xBAA9;&#xB85D;</li>
          <li><b>REDIAL</b> - &#xC7AC;&#xBC1C;&#xC2E0;</li>
          <li><b>MISSED</b> - &#xBD80;&#xC7AC;&#xC911;&#xD1B5;&#xD654;</li>
          <li><b>NONE</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>callType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>NORMAL</b> - &#xC77C;&#xBC18; &#xC804;&#xD654;</li>
          <li><b>SPEAKER</b> - &#xC2A4;&#xD53C;&#xCEE4;&#xD3F0;</li>
          <li><b>VIDEO</b> - &#xBE44;&#xB514;&#xC624;&#xCF5C;</li>
          <li><b>CALLAR</b> - &#xCF5C;&#xB77C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>recipientIntended</p>
      </td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C; recipient &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>recipientIntended.</p>
        <p>name</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xAC80;&#xC0C9;&#xC5D0; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xC0AC;&#xC6A9;&#xB41C;
          &#xC0C1;&#xB300;&#xBC29; &#xC774;&#xB984;</p>
        <p>(NLU &#xBD84;&#xC11D;&#xC73C;&#xB85C; &#xB098;&#xC628; &#xC774;&#xB984;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>recipientIntended.</p>
        <p>label</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>NLU &#xBD84;&#xC11D; &#xACB0;&#xACFC; label (&#xC9D1;, &#xD68C;&#xC0AC;,
          ...)</p>
        <p>&#xC815;&#xADDC;&#xD654;&#xB418;&#xC5B4; &#xC788;&#xC9C0; &#xC54A;&#xACE0;,
          &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C;
          &#xAC12;&#xC744; &#xADF8;&#xB300;&#xB85C; &#xBCF4;&#xB0C4;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>candidates</p>
      </td>
      <td style="text-align:left">array of <a href="phonecall.md#person">Person</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD654;&#xBA74;&#xC5D0; &#xAC80;&#xC0C9; &#xACB0;&#xACFC; &#xB9AC;&#xC2A4;&#xD2B8;&#xB97C;
        &#xB514;&#xC2A4;&#xD50C;&#xB808;&#xC774;&#xD558;&#xB294; &#xC911;&#xC5D0;&#xB9CC;
        context&#xC5D0; &#xCD94;&#xAC00;</td>
    </tr>
  </tbody>
</table>

## Common Objects

### Person

하나의 연락처를 나타내는 포맷

```text
{
  "name": "{{STRING}}",
  "type": "{{STRING}}",
  "profileImgUrl": "{{STRING}}",
  "category": "{{STRING}}",
  "address": {
    "road": "{{STRING}}",
    "jibun": "{{STRING}}"
  },
  "businessHours": {
    "open": "{{STRING}}",
    "close": "{{STRING}}",
    "info": "{{STRING}}"
  },
  "history": {
    "time": "{{STRING}}",
    "type": "{{STRING}}",
    "callType": "{{STRING}}"
  },
  "numInCallHistory": "{{STRING}}",
  "token": "{{STRING}}",
  "score": "{{STRING}}",
  "contacts": [Contact]
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">candidates&#xAC00; &#xC874;&#xC7AC;&#xD558;&#xBA74; &#xAC01; candidate&#xB294;
        &#xCD5C;&#xC18C;&#xD55C; &#xC774;&#xB984;&#xC740; &#xD3EC;&#xD568;&#xD574;&#xC57C;
        &#xD568;</td>
    </tr>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>recipient candidates&#xC758; &#xD0C0;&#xC785;</p>
        <ul>
          <li><b>CONTACT</b> - &#xC5F0;&#xB77D;&#xCC98; &#xAC80;&#xC0C9;</li>
          <li><b>EXCHANGE</b> - exchange &#xAC80;&#xC0C9;</li>
          <li><b>T114</b> - T114 &#xAC80;&#xC0C9;</li>
          <li><b>NONE</b> - &#xD2B9;&#xC815; &#xCE74;&#xD14C;&#xACE0;&#xB9AC;&#xC5D0;
            &#xC18D;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">profileImgUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">profile image URL</td>
    </tr>
    <tr>
      <td style="text-align:left">category</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC5C5;&#xC885;</td>
    </tr>
    <tr>
      <td style="text-align:left">address</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC8FC;&#xC18C;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>address.</p>
        <p>road</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB3C4;&#xB85C;&#xBA85; &#xC8FC;&#xC18C;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>address.</p>
        <p>jibun</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC9C0;&#xBC88; &#xC8FC;&#xC18C;</td>
    </tr>
    <tr>
      <td style="text-align:left">businessHours</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC601;&#xC5C5;&#xC2DC;&#xAC04;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>businessHours.</p>
        <p>open</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xB0A0;&#xC9DC;, &#xC2DC;&#xAC04; &#xC815;&#xBCF4;&#xB85C; ISO 8601 &#xD3EC;&#xB9F7;
          (2007-12-03T10:15:30)</p>
        <p>HH:mm</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>businessHours.</p>
        <p>close</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xB0A0;&#xC9DC;, &#xC2DC;&#xAC04; &#xC815;&#xBCF4;&#xB85C; ISO 8601 &#xD3EC;&#xB9F7;
          (2007-12-03T10:15:30)</p>
        <p>HH:mm</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>businessHours.</p>
        <p>info</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBD80;&#xAC00;&#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">history</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD1B5;&#xD654; &#xAE30;&#xB85D;&#xC744; &#xC704;&#xD55C; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>history.</p>
        <p>time</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB0A0;&#xC9DC;, &#xC2DC;&#xAC04; &#xC815;&#xBCF4;&#xB85C; ISO 8601 &#xD3EC;&#xB9F7;
        (2007-12-03T10:15:30)</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>history.</p>
        <p>type</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>OUT</b> - &#xBC1C;&#xC2E0; &#xD1B5;&#xD654; (Outgoing call)</li>
          <li><b>OUT_CANCELED</b> - &#xBC1C;&#xC2E0; &#xC5F0;&#xACB0; &#xC548; &#xB428;
            (Outgoing call canceled)</li>
          <li><b>IN</b> - &#xC218;&#xC2E0; &#xD1B5;&#xD654; (Incoming call)</li>
          <li><b>REJECTED</b> - &#xC218;&#xC2E0; &#xAC70;&#xC808; (Rejected call)</li>
          <li><b>MISSED</b> - &#xBD80;&#xC7AC;&#xC911; &#xD1B5;&#xD654; (Missed call)</li>
          <li><b>VOICE_MESSAGE</b> - &#xC74C;&#xC131; &#xBA54;&#xC2DC;&#xC9C0; (Voice
            message)</li>
          <li><b>BLOCKED</b> - &#xC218;&#xC2E0; &#xCC28;&#xB2E8; (Blocked)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>history.</p>
        <p>callType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>NORMAL</b> - &#xC77C;&#xBC18;&#xD1B5;&#xD654;</li>
          <li><b>VIDEO</b> - &#xC601;&#xC0C1;&#xD1B5;&#xD654;</li>
          <li><b>CALLAR</b> - &#xCF5C;&#xB77C; &#xC601;&#xC0C1;&#xD1B5;&#xD654;</li>
          <li><b>GROUP</b> - &#xADF8;&#xB8F9;&#xD1B5;&#xD654;</li>
          <li><b>VOICE_MESSAGE - &#xC74C;&#xC131; &#xBA54;&#xC2DC;&#xC9C0; (Voice message)</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">numInCallHistory</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBC1C;&#xC2E0;&#xAE30;&#xB85D; &#xD788;&#xC2A4;&#xD1A0;&#xB9AC;&#xC5D0;
          &#xC874;&#xC7AC;&#xD558;&#xB294; &#xAC74;&#xC218;</p>
        <p>0, 1, 2, ... &#xAC12;&#xC744; string &#xD615;&#xD0DC;&#xB85C; &#xBC1B;&#xC74C;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790; &#xCD94;&#xAC00; &#xC815;&#xBCF4;&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD574; &#xC784;&#xC758;&#xB85C; &#xC815;&#xC758;&#xD55C; key&#xAC12;&#xC744;
          &#xD3EC;&#xD568;</p>
        <p>unique &#xC5EC;&#xBD80;&#xB294; &#xC0AC;&#xC6A9;&#xB418;&#xB294; &#xC6A9;&#xB3C4;&#xC5D0;
          &#xC758;&#xD574; &#xACB0;&#xC815;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">score</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC80;&#xC0C9; &#xACB0;&#xACFC;&#xC758; &#xC2E0;&#xB8B0;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">contacts</td>
      <td style="text-align:left">array of <a href="phonecall.md#contact">Contact</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

### Contact

하나의 연락처를 나타내는 포맷

```text
{
  "label": "{{STRING}}",
  "number": "{{STRING}}"
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">label</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>MOBILE</b>
          </li>
          <li><b>COMPANY</b>
          </li>
          <li><b>HOME</b>
          </li>
          <li><b>USER_DEFINED</b> - &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC9C0;&#xC815;&#xD55C;
            &#xAC12;&#xB3C4; &#xD544;&#xC694;&#xD560;&#xC9C0; &#xAC80;&#xD1A0; &#xD544;&#xC694;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">number</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC804;&#xD654;&#xBC88;&#xD638;</td>
    </tr>
  </tbody>
</table>

## Directives

### SendCandidates

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "SendCandidates",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "intent": "{{STRING}}",
    "recipientIntended": {
      "name": "{{STRING}}",
      "label": "{{STRING}}"
    },
    "callType": "{{STRING}}",
    "searchTargetList": [array of String],
    "candidates": [array of Person]
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">intent</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li><b>CALL</b> - &#xC804;&#xD654;&#xAC78;&#xC5B4;&#xC918;</li>
          <li><b>SEARCH</b> - &#xCC3E;&#xC544;&#xC918;</li>
          <li><b>HISTORY</b> - &#xCD5C;&#xADFC; &#xD1B5;&#xD654; &#xBAA9;&#xB85D;</li>
          <li><b>REDIAL</b> - &#xC7AC;&#xBC1C;&#xC2E0;</li>
          <li><b>MISSED</b> - &#xBD80;&#xC7AC;&#xC911;&#xD1B5;&#xD654;</li>
          <li><b>NONE</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">recipientIntended</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C; recipient &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC80;&#xC0C9;&#xC5D0; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xC0AC;&#xC6A9;&#xB41C;
        &#xC0C1;&#xB300;&#xBC29; &#xC774;&#xB984; (NLU &#xBD84;&#xC11D;&#xC73C;&#xB85C;
        &#xB098;&#xC628; &#xC774;&#xB984;)</td>
    </tr>
    <tr>
      <td style="text-align:left">label</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>NLU &#xBD84;&#xC11D; &#xACB0;&#xACFC; label (&#xC9D1;, &#xD68C;&#xC0AC;,
          ...)</p>
        <p>&#xC815;&#xADDC;&#xD654;&#xB418;&#xC5B4; &#xC788;&#xC9C0; &#xC54A;&#xACE0;,
          &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C;
          &#xAC12;&#xC744; &#xADF8;&#xB300;&#xB85C; &#xBCF4;&#xB0C4;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">callType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>NORMAL</b> - &#xC77C;&#xBC18; &#xC804;&#xD654;</li>
          <li><b>SPEAKER</b> - &#xC2A4;&#xD53C;&#xCEE4;&#xD3F0;</li>
          <li><b>VIDEO</b> - &#xBE44;&#xB514;&#xC624;&#xCF5C;</li>
          <li><b>CALLAR</b> - &#xCF5C;&#xB77C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">searchTargetList</td>
      <td style="text-align:left">array of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>client&#xC5D0; &#xAC80;&#xC0C9; &#xBC29;&#xC2DD;&#xC744; &#xD2B9;&#xC815;</p>
        <p>&#xC815;&#xC758;&#xB418;&#xC9C0; &#xC54A;&#xC740; &#xAC12;&#xC774; &#xD3EC;&#xD568;&#xB41C;
          &#xACBD;&#xC6B0;, SDK&#xC5D0;&#xC11C; &#xD574;&#xB2F9; &#xAC12;&#xB9CC;
          &#xC81C;&#xC678; &#xCC98;&#xB9AC;&#xD568;</p>
        <ul>
          <li><b>CONTACT</b> - &#xC5F0;&#xB77D;&#xCC98; &#xAC80;&#xC0C9;</li>
          <li><b>EXCHANGE</b> - exchange &#xAC80;&#xC0C9;</li>
          <li><b>T114</b> - T114 &#xAC80;&#xC0C9;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">candidates</td>
      <td style="text-align:left">array of <a href="phonecall.md#person">Person</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">candidates&#xAC00; &#xC5C6;&#xC73C;&#xBA74; &#xC774; &#xD56D;&#xBAA9;&#xC774;
        &#xC5C6;&#xC5B4;&#xC57C; &#xD568;</td>
    </tr>
  </tbody>
</table>

### MakeCall

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "MakeCall",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "recipient": Person,
    "callType": "{{STRING}}"
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">recipient</td>
      <td style="text-align:left"><a href="phonecall.md#person">Person</a>
      </td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">callType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li><b>NORMAL</b> - &#xC77C;&#xBC18; &#xC804;&#xD654;</li>
          <li><b>SPEAKER</b> - &#xC2A4;&#xD53C;&#xCEE4;&#xD3F0;</li>
          <li><b>VIDEO</b> - &#xBE44;&#xB514;&#xC624;&#xCF5C;</li>
          <li><b>CALLAR</b> - &#xCF5C;&#xB77C;</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### EndCall

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "EndCall",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### AcceptCall

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "AcceptCall",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "speakerPhone": {{BOOLEAN}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| speakerPhone | bool | Y | 스피커폰으로 받을지 여부 |

### BlockIncomingCall

현재 수신 중인 전화 수신 차단 설정

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "BlockIncomingCall",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

## Events

### CandidatesListed

검색 결과 리스트가 화면에 보여지는 경우 보내는 Event

Parameter 들은 [Context](phonecall.md#context) 를 통해 전송되며, 검색 결과가 없는 경우에도 empty 로 전송해야 함.

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "CandidatesListed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### CallArrived

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "CallArrived",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "caller": {
      "name": "{{STRING}}",
      "token": "{{STRING}}",
      "isMobile": "{{STRING}}",
      "isRecentMisssed": "{{STRING}}"
    }
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">caller</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC1C;&#xC2E0;&#xC790; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>caller.</p>
        <p>name</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC774;&#xB984;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>caller.</p>
        <p>token</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xD654;&#xB97C; &#xAC74; &#xC0C1;&#xB300;&#xBC29;&#xC778; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique &#xAC12;</p>
        <p>CallArrived Event &#xD6C4;&#xC5D0; &#xC751;&#xB2F5;&#xC744; &#xBCF4;&#xB0BC;&#xB54C;
          &#xD574;&#xB2F9; Event&#xB97C; &#xBC1C;&#xC0DD;&#xC2DC;&#xD0A8; caller&#xB97C;
          unique&#xD558;&#xAC8C; &#xAD6C;&#xBD84;&#xD558;&#xAE30; &#xC704;&#xD574;
          SDK&#xC5D0;&#xC11C; &#xC0DD;&#xC131;&#xD558;&#xB294; token &#xAC12;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>caller.</p>
        <p>isMobile</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xBAA8;&#xBC14;&#xC77C; &#xD3F0;&#xC778;&#xC9C0; &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>TRUE</b>
          </li>
          <li><b>FALSE</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>caller.</p>
        <p>isRecentMissed</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xAC00;&#xC7A5; &#xCD5C;&#xADFC; &#xD1B5;&#xD654;&#xAC00; &#xBD80;&#xC7AC;&#xC911;
          &#xD1B5;&#xD654;&#xC778;&#xC9C0; &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>TRUE </b>- &#xC218;&#xC2E0; &#xC911;&#xC778; &#xC804;&#xD654;&#xBC88;&#xD638;&#xC758;
            &#xAC00;&#xC7A5; &#xCD5C;&#xADFC; &#xC218;&#xC2E0; &#xC774;&#xB825;&#xC774;
            &#xC788;&#xC9C0;&#xB9CC; &#xBABB;&#xBC1B;&#xC740; &#xACBD;&#xC6B0;</li>
          <li><b>FALSE </b>- &#xC218;&#xC2E0; &#xC911;&#xC778; &#xC804;&#xD654;&#xBC88;&#xD638;&#xC758;
            &#xC218;&#xC2E0; &#xC774;&#xB825;&#xC774; &#xC5C6;&#xAC70;&#xB098;, &#xC788;&#xB294;&#xB370;
            &#xBD80;&#xC7AC;&#xC911; &#xD1B5;&#xD654;&#xAC00; &#xC544;&#xB2CC; &#xACBD;&#xC6B0;</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### CallEnded

EndCall로 명시적으로 전화를 끊은 경우

ONGOING인 경우는 상대방이 거절하거나 통화중, 전화를 안받는 경우 등 연결이 안되는 모든 상태

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "CallEnded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### CallEstablished

상대방이 전화를 받은 경우

AcceptCall이 성공해서 연결된 경우

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "CallEstablished",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MakeCallFailed

MakeCall이 실패하는 경우 → 기능 상의 이슈로 전화 연결 시도 자체가 실패하는 경우

```text
{
  "header": {
    "namespace": "PhoneCall",
    "name": "MakeCallFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "errorCode": "{{STRING}}",
    "callType": "{{STRING}}"
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li><b>NO_SYSTEM_PERMISSION </b>- &#xAD8C;&#xD55C;&#xC5C6;&#xC74C;</li>
          <li><b>CALL_TYPE_NOT_SUPPORTED</b> - &#xD574;&#xB2F9; callType &#xC744; &#xC9C0;&#xC6D0;&#xD558;&#xC9C0;
            &#xC54A;&#xC74C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">callType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li><b>NORMAL</b> - &#xC77C;&#xBC18; &#xC804;&#xD654;</li>
          <li><b>SPEAKER</b> - &#xC2A4;&#xD53C;&#xCEE4;&#xD3F0;</li>
          <li><b>VIDEO</b> - &#xBE44;&#xB514;&#xC624;&#xCF5C;</li>
          <li><b>CALLAR</b> - &#xCF5C;&#xB77C;</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>



