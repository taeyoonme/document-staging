---
description: 디바이스의 음원 파일 재생을 위한 규격
---

# Sound

## Version

최신 버전은 1.2 입니다.

## SDK Interface

### SoundAgent 사용

Sound interface 규격에 따른 디바이스의 동작 제어는 SoundAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 SoundAgent instance 에 접근할 수 있습니다.

```text
val soundAgent = nuguAndroidClient.getAgent(DefaultSoundAgent.NAMESPACE)
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 SoundAgent instance 에 접근할 수 있습니다.

```text
let soundAgent = nuguClient.soundAgent
```
{% endtab %}

{% tab title="Linux" %}
[CapabilityFactory::makeCapability](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1CapabilityFactory.html#a46d96b1bc96903f02905c92ba8794bf6) 함수로 [SoundAgent](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ISoundHandler.html) 를 생성하고 [NuguClient](https://nugu-developers.github.io/nugu-linux/classNuguClientKit_1_1NuguClient.html) 에 추가해 주어야합니다.

```text
sound_handler = std::shared_ptr<ISoundHandler>(
        CapabilityFactory::makeCapability<SoundAgent, ISoundHandler>());

nugu_client->getCapabilityBuilder()
    ->add(sound_handler.get())
    ->construct();
```
{% endtab %}
{% endtabs %}

### 재생

디바이스 음원 재생이 [Beep](sound.md#beep) directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
디바이스 음원을 재생하려면 NuguAndroidClient 생성시 SoundProvider 를 추가합니다.

```text
NuguAndroidClient.Builder(...)
    .soundProvider(object : SoundProvider {
        override fun getContentUri(name: SoundProvider.BeepName): URI {
            return URI.create(
                Uri.parse(ContentResolver.SCHEME_ANDROID_RESOURCE + "://" + context.packageName + "/" + R.raw.responsefa
                    .toString()
            );
        }
    })
```
{% endtab %}

{% tab title="iOS" %}
디바이스 음원을 재생하려면 SoundAgentDelegate 를 추가합니다.

```text
soundAgent.delegate = self
```
{% endtab %}

{% tab title="Linux" %}
디바이스 음원을 재생하려면 ISoundListener 를 추가합니다.

```text
sound_listener = std::make_shared<SoundListener>();
CapabilityFactory::makeCapability<SoundAgent, ISoundHandler>(sound_listener.get());
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "Sound": {
    "version": "1.0"
  }
}
```

## Directives

### Beep

Beep 유형의 음원 재생 요청입니다.

```text
{
  "header": {
    "namespace": "Sound",
    "name": "Beep",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "beepName": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| beepName | string | Y | RESPONSE\_FAIL: Play 응답 실패 |

