---
description: 문자 확인 및 전송 기능 제어를 위한 규격
---

# Message

## Version

최신 버전은 1.2 입니다.

## SDK Interface

### MessageAgent 사용

MessageCall interface 규격에 따른 디바이스의 동작 제어는 MessageAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 MessageAgent instance 에 접근할 수 있습니다.

```text
val messageAgent = nuguAndroidClient.getAgent(MessageAgent.NAMESPACE)
```

NuguAndroidClient 생성시 MessageClient 를 추가합니다.

```text
NuguAndroidClient().Builder()
    .messageClient(object : MessageClient {
        ...
    })
```
{% endtab %}
{% endtabs %}

### Context 구성

문자 기능과 관련된 상태 정보를 [Context](message.md#context) 에 포함시켜 주어야 합니다.

{% tabs %}
{% tab title="Android" %}
MessageClient.getContext\(\) 를 구현하여 재생중인 문자의 재생 상태 정보와 마지막에 검색된 연락처 정보를 전달합니다.
{% endtab %}
{% endtabs %}

### 문자 전송

문자 전송이 [SendCandidates](message.md#sendcandidates), [SendMessage](message.md#sendmessage) directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
MessageClient.sendCandidates\(\) 에서 연락처 검색 기능을 구현합니다.

MessageClient.sendMessage\(\) 에서 문자 전송 기능을 구현합니다.
{% endtab %}
{% endtabs %}

### 문자 읽기

문자 읽기가 [GetMessage](message.md#getmessage), [ReadMessage](message.md#readmessage) directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
MessageClient.getMessageList\(\) 에서 문자 가져오기 기능을 구현합니다.
{% endtab %}
{% endtabs %}

## Context

```text
{
  "Message": {
    "version": "1.2",
    "readActivity": "{{STRING}}",
    "token": "{{STRING}}",
    "template": {
      "info": "{{STRING}}",
      "recipientIntended": {
        "name": "{{STRING}}",
        "label": "{{STRING}}"
      },
      "candidates": [array of Contact]
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
      <th style="text-align:left">Play Builder Precondition</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">readActivity</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xC774;&#xC804; &#xBC1C;&#xD654;&#xAC00; &#xC7AC;&#xC0DD; &#xC0C1;&#xD0DC;&#xB97C;
          &#xC804;&#xB2EC;</p>
        <p><b>IDLE, PLAYING, PAUSED, FINISHED, STOPPED</b>
        </p>
        <ul>
          <li>IDLE&#xC778; &#xACBD;&#xC6B0;&#xB294; &#xCD5C;&#xCD08; &#xC804;&#xC6D0;&#xC744;
            &#xCF30;&#xC744; &#xB54C;&#xB9CC; &#xAC00;&#xB2A5;&#xD558;&#xACE0; &#xC774;&#xD6C4;&#xC5D0;&#xB294;
            &#xB098;&#xC62C; &#xC218; &#xC5C6;&#xC74C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">readActivity&#xC5D0;&#xC11C; &#xC7AC;&#xC0DD; &#xC911;&#xC778; prompt&#xC758;
        token</td>
    </tr>
    <tr>
      <td style="text-align:left">template</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>context &#xC720;&#xC9C0; &#xC815;&#xCC45;&#xACFC; &#xB3D9;&#xC77C;&#xD558;&#xAC8C;
          &#xAD00;&#xB9AC;&#xB418;&#xC5B4;&#xC57C; &#xD568; &#x2192; Play Stack&#xC5D0;
          &#xD604;&#xC7AC; Play&#xAC00; &#xAC00;&#xC7A5; &#xC704;&#xC5D0; &#xC788;&#xB294;
          &#xB3D9;&#xC548;&#xC740; &#xBCF4;&#xB0B4;&#xC8FC;&#xC5B4;&#xC57C; &#xD568;</p>
        <ul>
          <li>&#xD654;&#xBA74;&#xC5D0; template&#xC774; &#xB514;&#xC2A4;&#xD50C;&#xB808;&#xC774;
            &#xB418;&#xB294; &#xB3D9;&#xC548;
            <ul>
              <li>&#xC571;&#xC5D0;&#xC11C; &#xD654;&#xBA74;&#xC744; &#xADF8;&#xB9AC;&#xB294;
                &#xACBD;&#xC6B0; &#xC571;&#xC774; &#xC815;&#xD655;&#xD55C; &#xC2DC;&#xC810;
                &#xD30C;&#xC545; &#xAC00;&#xB2A5;</li>
            </ul>
          </li>
          <li>&#xD654;&#xBA74;&#xC774; &#xC5C6;&#xB294; &#xACBD;&#xC6B0;&#xB294; DM
            &#xBC0F; TTS &#xC885;&#xB8CC; &#xD6C4; 7&#xCD08;
            <ul>
              <li>DM&#xC774; &#xC720;&#xC9C0;&#xB418;&#xB294; &#xB3D9;&#xC548;&#xC740; SDK&#xB85C;&#xBD80;&#xD130;
                &#xB300;&#xD654; &#xC138;&#xC158; &#xC720;&#xC9C0; &#xC0C1;&#xD669;&#xC744;
                &#xD53C;&#xB4DC;&#xBC31; &#xBC1B;&#xC544; &#xC804;&#xB2EC;</li>
            </ul>
          </li>
        </ul>
        <p>&#xB300;&#xD45C;&#xC801;&#xC778; &#xACBD;&#xC6B0;&#xB294; &#xC704;&#xC758;
          &#xB450; &#xACBD;&#xC6B0;&#xC640; &#xAC19;&#xC73C;&#xBA70; &#xC790;&#xC138;&#xD55C;
          &#xAD6C;&#xD604;&#xC740; context &#xAD00;&#xB9AC; &#xC815;&#xCC45; &#xCC38;&#xC870;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>info</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xD604;&#xC7AC; template&#xC5D0; &#xD3EC;&#xD568;&#xB41C; &#xB370;&#xC774;&#xD130;&#xAC00;
          &#xC5B4;&#xB5A4; &#xC815;&#xBCF4;&#xB97C; &#xB2F4;&#xACE0; &#xC788;&#xB294;&#xC9C0;
          &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; &#xAC12;</p>
        <ul>
          <li><b>PHONE_BOOK</b> - &#xC8FC;&#xC18C;&#xB85D; &#xC870;&#xD68C; &#xACB0;&#xACFC;&#xB97C;
            &#xD3EC;&#xD568;</li>
          <li><b>MESSAGE</b> - &#xC218;&#xC2E0;&#xB41C; Message &#xC815;&#xBCF4;&#xB97C;
            &#xD3EC;&#xD568;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />recipientIntended</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C; recipient &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />recipientIntended.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC80;&#xC0C9;&#xC5D0; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xC0AC;&#xC6A9;&#xB41C;
        &#xC0C1;&#xB300;&#xBC29; &#xC774;&#xB984; (NLU &#xBD84;&#xC11D;&#xC73C;&#xB85C;
        &#xB098;&#xC628; &#xC774;&#xB984;)</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />recipientIntended.
        <br />label</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC9D1;, &#xD68C;&#xC0AC; &#xB4F1;&#xC744; &#xAD6C;&#xBD84;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xB77C;&#xBCA8;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />candidates</td>
      <td style="text-align:left">array of <a href="message.md#contact">Contact</a> 
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD654;&#xBA74;&#xC5D0; &#xAC80;&#xC0C9; &#xACB0;&#xACFC; &#xB9AC;&#xC2A4;&#xD2B8;&#xB97C;
        &#xB514;&#xC2A4;&#xD50C;&#xB808;&#xC774;&#xD558;&#xB294; &#xC911;&#xC5D0;&#xB9CC;
        context&#xC5D0; &#xCD94;&#xAC00;</td>
    </tr>
  </tbody>
</table>

## Common Objects

### Contact

```text
{
  "name": "{{STRING}}",
  "type": "{{STRING}}",
  "number": "{{STRING}}",
  "label": "{{STRING}}",
  "profileImgUrl": "{{STRING}}",
  "message": {
    "text": "{{STRING}}",
    "type": "{{STRING}}"
  },
  "time": "{{STRING}}",
  "numInMessageHistory": "{{STRING}}",
  "token": "{{STRING}}",
  "score": "{{STRING}}"
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
      <td style="text-align:left">N</td>
      <td style="text-align:left">candidates&#xAC00; &#xC874;&#xC7AC;&#xD558;&#xBA74; &#xAC01; candidate&#xB294;
        &#xCD5C;&#xC18C;&#xD55C; &#xC774;&#xB984;&#xC740; &#xD3EC;&#xD568;&#xD574;&#xC57C;
        &#xD568;</td>
    </tr>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>recipient candidates&#xC758; &#xD0C0;&#xC785;</p>
        <ul>
          <li><b>CONTACT</b> - &#xC5F0;&#xB77D;&#xCC98; &#xAC80;&#xC0C9;</li>
          <li><b>EXCHANGE</b> - exchange &#xAC80;&#xC0C9;</li>
          <li><b>T114</b> - T114 &#xAC80;&#xC0C9;</li>
          <li><b>NONE</b> - &#xD2B9;&#xC815; &#xCE74;&#xD14C;&#xACE0;&#xB9AC;&#xC5D0;
            &#xC18D;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</li>
          <li><b>EMERGENCY</b> : &#xAE34;&#xAE09; &#xC7AC;&#xB09C;, &#xC548;&#xC804;
            &#xC548;&#xB0B4; &#xBB38;&#xC790;&#xC758; &#xACBD;&#xC6B0; &quot;&#xC548;&#xC804;
            &#xC548;&#xB0B4; &#xBB38;&#xC790;&quot;&#xB85C; TTS &#xB098;&#xAC08; &#xC608;&#xC815;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">number</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
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
          <li><b>USER_DEFINED</b> 
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">profileImgUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">message</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>message.</p>
        <p>text</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBCF4;&#xB0B4;&#xB294; or &#xBC1B;&#xB294; &#xBA54;&#xC138;&#xC9C0;
        &#xB0B4;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>message.</p>
        <p>type</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xBA54;&#xC138;&#xC9C0;&#xC758; &#xD0C0;&#xC785;</p>
        <ul>
          <li><b>SMS</b> 
          </li>
          <li><b>MMS</b> 
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">time</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB0A0;&#xC9DC;, &#xC2DC;&#xAC04; &#xC815;&#xBCF4;&#xB85C; ISO 8601 &#xD3EC;&#xB9F7;
        (2007-12-03T10:15:30)</td>
    </tr>
    <tr>
      <td style="text-align:left">numInMessageHistory</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBB38;&#xC790; &#xC218;&#xC2E0; &#xB0B4;&#xC5ED;&#xC5D0; &#xC874;&#xC7AC;&#xD558;&#xB294;
          &#xAC74;&#xC218;</p>
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
  </tbody>
</table>

## Directives

### SendCandidates

```text
{
  "header": {
    "namespace": "Message",
    "name": "SendCandidates",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "recipientIntended": {
      "name": "{{STRING}}",
      "label": "{{STRING}}"
    },
    "candidates": [array of Contact]
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
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>SEND</b> - &#xBB38;&#xC790;&#xBCF4;&#xB0B4;&#xC918;</li>
          <li><b>READ</b> - &#xBB38;&#xC790;&#xC77D;&#xC5B4;&#xC918;</li>
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
      <td style="text-align:left">recipientIntended.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC80;&#xC0C9;&#xC5D0; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xC0AC;&#xC6A9;&#xB41C;
        &#xC0C1;&#xB300;&#xBC29; &#xC774;&#xB984; (NLU &#xBD84;&#xC11D;&#xC73C;&#xB85C;
        &#xB098;&#xC628; &#xC774;&#xB984;)</td>
    </tr>
    <tr>
      <td style="text-align:left">recipientIntended.
        <br />label</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC9D1;, &#xD68C;&#xC0AC; &#xB4F1;&#xC744; &#xAD6C;&#xBD84;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xB77C;&#xBCA8;</td>
    </tr>
    <tr>
      <td style="text-align:left">candidates</td>
      <td style="text-align:left">array of Contact Object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">candidates&#xAC00; &#xC5C6;&#xC73C;&#xBA74; &#xC774; &#xD56D;&#xBAA9;&#xC774;
        &#xC5C6;&#xC5B4;&#xC57C; &#xD568;</td>
    </tr>
  </tbody>
</table>

### SendMessage

```text
{
  "header": {
    "namespace": "Message",
    "name": "SendMessage",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "recipient": Contact
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| recipient | [Contact](message.md#contact) | Y |  |

### GetMessage

```text
{
  "header": {
    "namespace": "Message",
    "name": "GetMessage",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "recipientIntended": {
      "name": "{{STRING}}",
      "label": "{{STRING}}"
    },
    "candidates": [array of Contact]
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
      <th style="text-align:left"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">recipientIntended</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C; recipient &#xC815;&#xBCF4;</p>
        <p>optional &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xB85C; &#xD3EC;&#xD568;&#xB418;&#xC9C0;
          &#xC54A;&#xC73C;&#xBA74; &#xC804;&#xCCB4; &#xBB38;&#xC790;&#xB97C; &#xBCF4;&#xB0B4;&#xC918;&#xC57C;
          &#xD568;</p>
      </td>
      <td style="text-align:left">
        <p>&#xD56D;&#xBAA9;&#xC774; &#xC874;&#xC7AC;&#xD560; &#xACBD;&#xC6B0; SendCandidates&#xC640;
          &#xB3D9;&#xC77C;&#xD558;&#xAC8C; &#xC870;&#xAC74;&#xC5D0; &#xB9DE;&#xB294;
          &#xB300;&#xC0C1;&#xC790;&#xC758; &#xBB38;&#xC790;&#xB9AC;&#xC2A4;&#xD2B8;&#xB9CC;
          GetMessageSucceeded&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xACE0;</p>
        <p>&#xD56D;&#xBAA9;&#xC774; &#xC5C6;&#xC744; &#xACBD;&#xC6B0; &#xC804;&#xCCB4;
          &#xBB38;&#xC790;&#xB9AC;&#xC2A4;&#xD2B8;&#xB97C; GetMessageSucceeded&#xB85C;
          &#xC804;&#xB2EC;&#xD574;&#xC57C;&#xD568;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">recipientIntended.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC80;&#xC0C9;&#xC5D0; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xC0AC;&#xC6A9;&#xB41C;
        &#xC0C1;&#xB300;&#xBC29; &#xC774;&#xB984; (NLU &#xBD84;&#xC11D;&#xC73C;&#xB85C;
        &#xB098;&#xC628; &#xC774;&#xB984;)</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">recipientIntended.
        <br />label</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC9D1;, &#xD68C;&#xC0AC; &#xB4F1;&#xC744; &#xAD6C;&#xBD84;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xB77C;&#xBCA8;</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">candidates</td>
      <td style="text-align:left">array of <a href="message.md#contact">Contact</a> 
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">candidates&#xAC00; &#xC5C6;&#xC73C;&#xBA74; &#xC774; &#xD56D;&#xBAA9;&#xC774;
        &#xC5C6;&#xC5B4;&#xC57C; &#xD568;</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

### ReadMessage

```text
{
  "header": {
    "namespace": "Message",
    "name": "ReadMessage",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "receivedTime": "{{STRING}}",
    "token": "{{STRING}}"
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
      <td style="text-align:left">receivedTime</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Application&#xC5D0;&#xC11C; &#xC77D;&#xC740; &#xBA54;&#xC2DC;&#xC9C0;&#xB97C;
          &#xCC98;&#xB9AC;&#xD558;&#xAE30; &#xC704;&#xD55C; timeStamp</p>
        <p>timeStamp &#xAC12;&#xC740; &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;
          &#xBB38;&#xC790; &#xBA54;&#xC2DC;&#xC9C0;&#xC758; (&#xC218;&#xC2E0;&#xD55C;)
          &#xC2DC;&#xAC04;&#xAC12;(LONG)&#xC73C;&#xB85C; GetMessageSucceeded &#xC758;
          candidates (&#xBB38;&#xC790; &#xBA54;&#xC2DC;&#xC9C0; &#xB9AC;&#xC2A4;&#xD2B8;)
          &#xC758; time &#xAC12;</p>
        <p>Application&#xC740; &#xD574;&#xB2F9; &#xC2DC;&#xAC04;&#xAC12; &#xC774;&#xD6C4;&#xC5D0;
          &#xC218;&#xC2E0;&#xB41C; &#xBB38;&#xC790; &#xBA54;&#xC2DC;&#xC9C0;&#xB97C;
          GetMessageSucceeded &#xC751;&#xB2F5;&#xB370;&#xC774;&#xD130;&#xB85C; &#xC804;&#xB2EC;&#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD604;&#xC7AC; TTS&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C;
        unique string</td>
    </tr>
  </tbody>
</table>

## Events

### CandidatesListed

검색 결과 리스트가 화면에 보여지는 경우 보내는 Event

list는 context로 전송됨

```text
{
  "header": {
    "namespace": "Message",
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

### SendMessageSucceeded

```text
{
  "header": {
    "namespace": "Message",
    "name": "SendMessageSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "recipient": Contact
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| recipient | [Contact](message.md#contact)  | Y |  |

### SendMessageFailed

```text
{
  "header": {
    "namespace": "Message",
    "name": "SendMessageFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "recipient": Contact,
    "errorCode": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| recipient | Contact Object | Y |  |
| errorCode | string | Y |  |

### GetMessageSucceeded

```text
{
  "header": {
    "namespace": "Message",
    "name": "GetMessageSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "candidates": [array of Contact]
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| candidates | array of Contact Object | N |  |

### GetMessageFailed

```text
{
  "header": {
    "namespace": "Message",
    "name": "GetMessageFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "errorCode": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| errorCode | string | Y |  |

### ReadMessageFinished

```text
{
  "header": {
    "namespace": "Message",
    "name": "ReadMessageFinished",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Message.ReadMessage Directive에서 전달한 token |

