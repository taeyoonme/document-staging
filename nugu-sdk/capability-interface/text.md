---
description: 텍스트 명령을 Play 로 전달하기 위한 규격
---

# Text

## Version

최신 버전은 1.3 입니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Version</th>
      <th style="text-align:left">Date</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">1.0</td>
      <td style="text-align:left">2019.11.24</td>
      <td style="text-align:left">&#xADDC;&#xACA9; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.1</td>
      <td style="text-align:left">2020.03.23</td>
      <td style="text-align:left">TextInput event &#xC5D0; asrContext &#xD544;&#xB4DC; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.2</td>
      <td style="text-align:left">2020.06.05</td>
      <td style="text-align:left">
        <p>TextInput event &#xC758; sessionId &#xD544;&#xB4DC; &#xC0AD;&#xC81C;</p>
        <p>TextInput event &#xC758; asrContext &#xC5D0; playServiceId &#xD544;&#xB4DC;
          &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.3</td>
      <td style="text-align:left">2020.09.02</td>
      <td style="text-align:left">TextSource &#xC5D0; playServiceId &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.4</td>
      <td style="text-align:left">2020.11.13</td>
      <td style="text-align:left">TextRedirect directive &#xCD94;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.5</td>
      <td style="text-align:left">2020.11.30</td>
      <td style="text-align:left">TextSourceFailed, TextRedirectFailed event &#xCD94;</td>
    </tr>
  </tbody>
</table>

## SDK Interface

### TextAgent 사용

Text interface 규격에 따른 디바이스의 동작 제어는 TextAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 TextAgent instance 에 접근할 수 있습니다.

```text
val textAgent = nuguAndroidClient.textAgent
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 TextAgent instance 에 접근할 수 있습니다.

```text
let textAgent = nuguClient.textAgent
```
{% endtab %}

{% tab title="Linux" %}
[CapabilityFactory::makeCapability](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1CapabilityFactory.html#a46d96b1bc96903f02905c92ba8794bf6) 함수로 [TextAgent](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ITextHandler.html) 를 생성하고 [NuguClient](https://nugu-developers.github.io/nugu-linux/classNuguClientKit_1_1NuguClient.html) 에 추가해 주어야합니다.

```text
auto text_handler(std::shared_ptr<ITextHandler>(
        CapabilityFactory::makeCapability<TextAgent, ITextHandler>()));

nugu_client->getCapabilityBuilder()
    ->add(text_handler.get())
    ->construct();
```
{% endtab %}
{% endtabs %}

### 텍스트 명령

임의의 텍스트 명령을 [TextInput](text.md#textinput) event 로 요청할 수 있습니다.

{% tabs %}
{% tab title="Android" %}
```text
textAgent.requestTextInput(text)
```
{% endtab %}

{% tab title="iOS" %}
```text
textAgent.requestTextInput(text: textInput, requestType: .normal)
```
{% endtab %}

{% tab title="Linux" %}
```text
text_handler->requestTextInput(text)
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "Text": {
    "version": "1.1"
  }
}
```

## Directive

### TextSource

* 외부 시스템에서 Device Gateway를 사용하여 직접 연동하는 경우에만 사용

```text
{
  "header": {
    "namespace": "Text",
    "name": "TextSource",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.3"
  },
  "payload": {
    "text": "{{STRING}}",
    "token": "{{STRING}}",
    "playServiceId": "{{STRING}}"
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
      <td style="text-align:left">text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xB85C; &#xC804;&#xB2EC;&#xD55C; &#xB4A4;
        context&#xB97C; &#xCD94;&#xAC00;&#xD558;&#xC5EC; &#xB2E4;&#xC2DC; Device
        Gateway&#xB85C; &#xC804;&#xC1A1;&#xD574;&#xC57C; &#xD558;&#xB294; text</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC804;&#xC1A1;&#xD558;&#xB294; text&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
        &#xC704;&#xD55C; unique string</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xAC12;&#xC774; &#xC874;&#xC7AC;&#xD558;&#xBA74; TextInput&#xC758; playServiceId
          &#xAC12;&#xC744; &#xC124;&#xC815;&#xD558;&#xB294;&#xB370; &#xC0AC;&#xC6A9;</p>
        <p>ASR.ExpectSpeech &#xBCF4;&#xB2E4; &#xC6B0;&#xC120;&#xD558;&#xC5EC; &#xB3D9;&#xC791;
          &#xD568;.</p>
        <p>(TextSource &#xC5D0; playServiceId &#xAC00; &#xC788;&#xB294; &#xACBD;&#xC6B0;
          ASR.ExpecSpeech &#xC5D0;&#xC11C; &#xBC1B;&#xC740; playServiceId, domainTypes,
          asrContext &#xB97C; TextInput &#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xC9C0;
          &#xC54A;&#xC74C;)</p>
      </td>
    </tr>
  </tbody>
</table>

### TextRedirect

Play에서 다른 Play로 처리를 넘기는데, 특정 Text를 전달해서 실행하고자 하는 경우에 사용

```text
{
  "header": {
    "namespace": "Text",
    "name": "TextRedirect",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.3"
  },
  "payload": {
    "text": "{{STRING}}",
    "token": "{{STRING}}",
    "playServiceId": "{{STRING}}",
    "targetPlayServiceId": "{{STRING}}"
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
      <td style="text-align:left">text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xB85C; &#xC804;&#xB2EC;&#xD55C; &#xB4A4;
        context&#xB97C; &#xCD94;&#xAC00;&#xD558;&#xC5EC; &#xB2E4;&#xC2DC; Device
        Gateway&#xB85C; &#xC804;&#xC1A1;&#xD574;&#xC57C; &#xD558;&#xB294; text</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC804;&#xC1A1;&#xD558;&#xB294; text&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
        &#xC704;&#xD55C; unique string</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xB514;&#xB809;&#xD2F0;&#xBE0C;&#xB97C; &#xC9C0;&#xC2DC;&#xD55C; PlayServiceId
        (Play&#xC5D0;&#xC11C; NPK &#xD1B5;&#xD55C; &#xC751;&#xB2F5;&#xC77C;&#xB54C;&#xB294;
        &#xB77C;&#xC6B0;&#xD130;&#xAC00; &#xC54C;&#xC544;&#xC11C; &#xCC44;&#xC6CC;&#xC90C;)</td>
    </tr>
    <tr>
      <td style="text-align:left">targetPlayServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xAC12;&#xC774; &#xC874;&#xC7AC;&#xD558;&#xBA74; TextInput&#xC758; playServiceId
          &#xAC12;&#xC744; &#xC124;&#xC815;&#xD558;&#xB294;&#xB370; &#xC0AC;&#xC6A9;</p>
        <p>&#xBA85;&#xD655;&#xD788; &#xB77C;&#xC6B0;&#xD305;&#xB418;&#xC5B4;&#xC57C;
          &#xD558;&#xB294; Play&#xB97C; &#xC9C0;&#xC815;&#xD558;&#xB294; &#xACBD;&#xC6B0;&#xC5D0;
          &#xC0AC;&#xC6A9;&#xB418;&#xACE0;, &#xC9C0;&#xC815;&#xD558;&#xC9C0; &#xC54A;&#xC73C;&#xBA74;
          &#xB77C;&#xC6B0;&#xD305; &#xB85C;&#xC9C1;&#xC5D0; &#xC758;&#xD574; &#xB77C;&#xC6B0;&#xD305;</p>
        <p>ASR.ExpectSpeech &#xBCF4;&#xB2E4; &#xC6B0;&#xC120;&#xD558;&#xC5EC; &#xB3D9;&#xC791;
          &#xD568;.</p>
        <p>(TextRedirect&#xC5D0; targetPlayServiceId&#xAC00; &#xC788;&#xB294; &#xACBD;&#xC6B0;
          ASR.ExpecSpeech &#xC5D0;&#xC11C; &#xBC1B;&#xC740; playServiceId, domainTypes,
          asrContext &#xB97C; TextInput &#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xC9C0;
          &#xC54A;&#xC74C;)</p>
      </td>
    </tr>
  </tbody>
</table>

## Events

### TextInput

```text
{
  "header": {
    "namespace": "Text",
    "name": "TextInput",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "text": "{{STRING}}",
    "token": "{{STRING}}",
    "sessionId": "{{STRING}}",
    "playServiceId": "{{STRING}}",
    "domainTypes": [
      "{{STRING}}"
    ],
    "asrContext": {
      "task": "{{STRING}}",
      "sceneId": "{{STRING}}",
      "sceneText": [
        "{{STRING}}"
      ],
      "playServiceId" : "playServiceId"
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
      <td style="text-align:left">text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>TextSource directive &#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; text</li>
          <li>&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C; &#xC0DD;&#xC131;&#xD55C;
            &#xC784;&#xC758;&#xC758; text</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li>TextSource&#xC5D0; &#xC758;&#xD574; &#xC0DD;&#xC131;&#xB41C; &#xC774;&#xBCA4;&#xD2B8;&#xC778;
            &#xACBD;&#xC6B0; TextSource&#xC758; token&#xC744; &#xADF8;&#xB300;&#xB85C;
            &#xC0AC;&#xC6A9;</li>
          <li>Chips interface, Display interface, Routine interface &#xC5D0; &#xC758;&#xD574;
            &#xC0DD;&#xC131;&#xB41C; &#xC774;&#xBCA4;&#xD2B8;&#xC758; &#xACBD;&#xC6B0;
            &#xD574;&#xB2F9; directive &#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xBC1B;&#xC740;
            token &#xC744; &#xC0AC;&#xC6A9;</li>
          <li>&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C; &#xC0DD;&#xC131;&#xB41C;
            text&#xB294; &#xC784;&#xC758;&#xC758; &#xAC12;&#xC744; &#xAC16;&#xAC70;&#xB098;
            &#xD544;&#xB4DC;&#xB97C; &#xAC16;&#xC9C0; &#xC54A;&#xC544;&#xB3C4; &#xB428;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ASR/Display/Routine/Text interface &#xC5D0; &#xC758;&#xD574; &#xC0DD;&#xC131;&#xB41C;
        &#xC774;&#xBCA4;&#xD2B8;&#xC758; &#xACBD;&#xC6B0; &#xD574;&#xB2F9; directive
        &#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xBC1B;&#xC740; playServiceId &#xB97C;
        &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">domainTypes</td>
      <td style="text-align:left">Array&lt;String&gt;</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech&#xC5D0; &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        ExpectSpeech&#xC5D0;&#xC11C; &#xBC1B;&#xC740; domainTypes&#xB97C; &#xC801;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">asrContext</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech&#xC5D0; &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        ExpectSpeech&#xC5D0;&#xC11C; &#xBC1B;&#xC740; asrContext &#xB97C; &#xC801;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>task</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>sceneId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>sceneText</p>
      </td>
      <td style="text-align:left">Array&lt;String&gt;</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

### TextSourceFailed

```text
{
  "header": {
    "namespace": "Text",
    "name": "TextSourceFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.5"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | TextSource에서 정의한 token |
| errorCode | string | Y | NOT\_SUPPORTED\_STATE |

### TextRedirectFailed

```text
{
  "header": {
    "namespace": "Text",
    "name": "TextRedirectFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.5"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | TextSource에서 정의한 token |
| errorCode | string | Y | NOT\_SUPPORTED\_STATE |

