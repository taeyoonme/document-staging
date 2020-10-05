---
description: 음성 합성 결과를 전달받기 위한 규격
---

# TTS

## Version

최신 버전은 1.1 입니다.

## SDK Interface

### TTSAgent 사용

TTS interface 규격에 따른 디바이스의 동작 제어는 TTSAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 TTSAgent instance 에 접근할 수 있습니다.

```text
val ttsAgent = nuguAndroidClient.ttsAgent
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 TTSAgent instance 에 접근할 수 있습니다.

```text
let ttsAgent = nuguClient.ttsAgent
```
{% endtab %}

{% tab title="Linux" %}
 [CapabilityFactory::makeCapability](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1CapabilityFactory.html#a46d96b1bc96903f02905c92ba8794bf6) 함수로 [TTSAgent](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ITTSHandler.html) 를 생성하고 [NuguClient](https://nugu-developers.github.io/nugu-linux/classNuguClientKit_1_1NuguClient.html) 에 추가해 주어야합니다.

```text
tts_handler = std::shared_ptr<ITTSHandler>(
        CapabilityFactory::makeCapability<TTSAgent, ITTSHandler>());

nugu_client->getCapabilityBuilder()
    ->add(tts_handler.get())
    ->construct();
```
{% endtab %}
{% endtabs %}

### 재생 상태 정보

[Speak](tts.md#speak) directive 로 전달된 음원에 대한 재생 상태를 모니터링 할 수 있습니다.

{% tabs %}
{% tab title="Android" %}
재생 상태를 모니터링 하려면 TTSAgentInterface.Listener 를 추가합니다.

```text
nuguAndroidClient.ttsAgent?.addListener(this)
```
{% endtab %}

{% tab title="iOS" %}
재생 상태를 모니터링 하려면 TTSAgentDelegate 를 추가합니다.

```text
nuguClient.ttsAgent.add(delegate: self)
```
{% endtab %}

{% tab title="Linux" %}
재생 상태를 모니터링 하려면 [ITTSListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ITTSListener.html) 를 추가합니다.

```text
tts_listener = std::make_shared<TTSListener>();
CapabilityFactory::makeCapability<TTSAgent, ITTSHandler>(tts_listener.get());
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "TTS": {
    "version": "1.1",
    "ttsActivity": "{{STRING}}",
    "engine": "{{STRING}}"
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
      <td style="text-align:left">ttsActivity</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>TTS &#xC7AC;&#xC0DD; &#xC0C1;&#xD0DC;</p>
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
      <td style="text-align:left">engine</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Device &#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xD558;&#xB294; &#xC74C;&#xC131;&#xD569;&#xC131;
          engine &#xC744; &#xBA85;&#xC2DC;</p>
        <p>NUGU &#xC74C;&#xC131;&#xD569;&#xC131; engine &#xC744; &#xC0AC;&#xC6A9;&#xD558;&#xB294;
          &#xACBD;&#xC6B0; &quot;skt&quot;</p>
        <p>(&#xAC12;&#xC744; &#xCC44;&#xC6B0;&#xC9C0; &#xC54A;&#xC73C;&#xBA74; default
          &quot;skt&quot;)</p>
      </td>
    </tr>
  </tbody>
</table>

## Directive

### Speak

새로운 TTS 재생 요청입니다.

```text
{
  "header": {
    "namespace": "TTS",
    "name": "Speak",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "sourceType": "{{STRING}}",
    "format": "{{STRING}}",
    "text": "{{STRING}}",
    "token": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| sourceType | string | N | URL or ATTACHMENT\(default 는 ATTACHMENT\) |
| format | string | Y | **TEXT** or **SKML** |
| text | string | Y | tts text |
| token | string | Y | 현재 TTS를 식별하기 위한 unique string |

### Stop

현재 TTS 중지 요청입니다.

```text
{
  "header": {
    "namespace": "TTS",
    "name": "Stop",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

