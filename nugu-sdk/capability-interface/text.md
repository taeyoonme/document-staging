---
description: 텍스트 명령을 Play 로 전달하기 위한 규격
---

# Text

## Version

최신 버전은 1.1 입니다.

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
```
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

## Events

### TextInput

```text
{
  "header": {
    "namespace": "Text",
    "name": "TextInput",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
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
      ]
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
      <td style="text-align:left">&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C; &#xC0DD;&#xC131;&#xD55C;
        &#xC784;&#xC758;&#xC758; text</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C; &#xC0DD;&#xC131;&#xD55C;
        token. &#xC784;&#xC758;&#xC758; &#xAC12;&#xC744; &#xAC16;&#xAC70;&#xB098;
        &#xD544;&#xB4DC;&#xB97C; &#xAC16;&#xC9C0; &#xC54A;&#xC544;&#xB3C4; &#xB428;</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech&#xC5D0; &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        ExpectSpeech&#xC5D0;&#xC11C; &#xBC1B;&#xC740; playServiceId&#xB97C; &#xC801;&#xC6A9;</td>
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
  </tbody>
</table>

