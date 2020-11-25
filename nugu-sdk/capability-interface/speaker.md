---
description: 디바이스의 볼륨을 제어하기 위한 규격
---

# Speaker

## Version

최신 버전은 1.2 입니다.

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
      <td style="text-align:left">2020.03.13</td>
      <td style="text-align:left">&#xADDC;&#xACA9; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.1</td>
      <td style="text-align:left">2020.06.22</td>
      <td style="text-align:left">Context &#xC758; volumes.name &#xBAA9;&#xB85D; &#xBCC0;&#xACBD;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.2</td>
      <td style="text-align:left">2020.06.26</td>
      <td style="text-align:left">
        <p>Context &#xC5D0; defaultVolumeLevel &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
        <p>Context &#xC758; volumnes &#xC5D0; group &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
      </td>
    </tr>
  </tbody>
</table>

## SDK Interface

### SpeakerAgent 사용

Speaker interface 규격에 따른 디바이스의 동작 제어는 SpeakerAgent 가 처리합니다.

{% hint style="warning" %}
iOS 는 SpeakerAgent 를 지원하지 않습니다.
{% endhint %}

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 SpeakerAgent instance 에 접근할 수 있습니다.

```text
val speakerAgent = nuguAndroidClient.getAgent(DefaultSpeakerAgent.NAMESPACE)
```

NuguAndroidClient 에 볼륨 제어를 위한 기본 Speaker 구현이 포함되어 있습니다.

Speaker 을 직접 구현하려면 NuguAndroidClient 생성시 SpeakerFactory 를 추가합니다.

```text
class MySpeaker: Speaker {
    ...
}
NuguAndroidClient.Builder(...)
    .speakerFactory(object : SpeakerFactory {
        override fun createNuguSpeaker(): Speaker? = MySpeaker()

        override fun createAlarmSpeaker(): Speaker? = MySpeaker()

        override fun createCallSpeaker(): Speaker? = MySpeaker()

        override fun createExternalSpeaker(): Speaker? = MySpeaker()

        override fun createSpeaker(type: Speaker.Type): Speaker? {
            return when (type) {
                Speaker.Type.NUGU -> MySpeaker()
                Speaker.Type.ALARM -> MySpeaker()
                else -> MySpeaker()
            }
        }
    })
```
{% endtab %}

{% tab title="Linux" %}
[CapabilityFactory::makeCapability](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1CapabilityFactory.html#a46d96b1bc96903f02905c92ba8794bf6) 함수로 [SpeakerAgent](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ISpeakerHandler.html) 를 생성하고 [NuguClient](https://nugu-developers.github.io/nugu-linux/classNuguClientKit_1_1NuguClient.html) 에 추가해 주어야합니다.

```text
auto speaker_handler(std::shared_ptr<ISpeakerHandler>(
        CapabilityFactory::makeCapability<SpeakerAgent, ISpeakerHandler>()));

nugu_client->getCapabilityBuilder()
    ->add(speaker_handler.get())
    ->construct();
```
{% endtab %}
{% endtabs %}

### Context 구성

Play 에서 디바이스의 볼륨을 제어하기 위해서는 디바이스의 볼륨 정보를 [Context](location.md#context) 에 포함시켜 주어야 합니다.

{% tabs %}
{% tab title="Android" %}
각 Speaker.Type 의 Speaker 를 구현합니다.

```text
class MySpeaker: Speaker {
    override fun getSpeakerSettings(): Speaker.SpeakerSettings? {
        ...
    }
}
```
{% endtab %}

{% tab title="Linux" %}
[SpeakerType](https://nugu-developers.github.io/nugu-linux/group__SpeakerInterface.html#ga8601f6be80368c9d1a7c7b346c99a698) 의 [SpeakerInfo](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1SpeakerInfo.html) 를 설정합니다.

```text
speaker_handler->setSpeakerInfo(speakers)
```
{% endtab %}
{% endtabs %}

### 볼륨 제어

디바이스의 볼륨 제어가 [SetVolume](speaker.md#setvolume) directive 로 요청될 수 있습니다.

디바이스의 볼륨 음소거 제어가 [SetMute](speaker.md#setmute) directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
Speaker 를 구현합니다.

```text
class MySpeaker: Speaker {
    override fun setVolume(volume: Int, rate: Rate = Rate.FAST): Boolean {
        ...
    }

    override fun setMute(mute: Boolean): Boolean {
        ...
    }

    ...
}
```
{% endtab %}

{% tab title="Linux" %}
[ISpeakerListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ISpeakerListener.html) 를 추가합니다.

```text
class MySpeakerListener : public ISpeakerListener {
public:
    ...

    void requestSetMute(const std::string &ps_id, SpeakerType type, bool mute) override
    {
        ...
    }

    void requestSetVolume(const std::string &ps_id, SpeakerType type, int volume, bool linear) override
    {
        ...
    }
};
auto speaker_listener(std::make_shared<MySpeakerListener>());
CapabilityFactory::makeCapability<SpeakerAgent, ISpeakerHandler>(speaker_listener.get());
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "Speaker": {
    "version": "1.0",
    "volumes": [
      {
        "name": "{{STRING}}",
        "group": "{{STRING}}",
        "volume": {{LONG}},
        "minVolume": {{LONG}},
        "maxVolume": {{LONG}},
        "defaultVolumeStep": {{LONG}},
        "defaultVolumeLevel": {{LONG}},
        "muted": {{BOOLEAN}}
      }
    ]
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
      <td style="text-align:left">volumes</td>
      <td style="text-align:left">object array</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>NUGU(MUSIC+VOICE_COMMAND), MUSIC, RINGTONE, CALL, NOTIFICATION, ALARM,
          VOICE_COMMAND, NAVIGATION, SYSTEM_SOUND</p>
        <p>Reference: <a href="https://source.android.com/devices/audio/attributes#contexts">https://source.android.com/devices/audio/attributes#contexts</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>volumes.</p>
        <p>group</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. volume&#xC758; group &#xAC12;&#xC73C;&#xB85C; &#xC601;&#xBB38;&#xC790;&#xC640;
        &#xC22B;&#xC790;&#xB97C; &#xC774;&#xC6A9;&#xD558;&#xC5EC; &#xAD6C;&#xC131;&#xD560;
        &#xC218; &#xC788;&#xC74C;.
        <br />(Play&#xC5D0;&#xC11C;&#xB294; group &#xAC12;&#xC744; mapping&#xD558;&#xC5EC;
        TTS&#xB97C; &#xB9CC;&#xB4E4; &#xB54C; &#xC0AC;&#xC6A9;&#xD560; &#xC218;
        &#xC788;&#xC74C;)
        <br />-. grouping &#xB418;&#xC5B4; &#xC788;&#xC9C0; &#xC54A;&#xC740; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;
        <br />Reference: <a href="https://source.android.com/devices/automotive/audio#volume-and-groups">https://source.android.com/devices/automotive/audio#volume-and-groups</a>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />volume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xD604;&#xC7AC; &#xC124;&#xC815;&#xB41C; &#xBCFC;&#xB968;
        <br />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />minVolume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xC124;&#xC815; &#xAC00;&#xB2A5;&#xD55C; &#xCD5C;&#xB300; &#xBCFC;&#xB968;
        <br
        />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />maxVolume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xC124;&#xC815; &#xAC00;&#xB2A5;&#xD55C; &#xCD5C;&#xC18C; &#xBCFC;&#xB968;
        <br
        />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />defaultVolumeStep</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xAE30;&#xBCF8; &#xBCFC;&#xB968; &#xB2E8;&#xACC4;
        <br />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>volumnes.</p>
        <p>defaultVolumeLevel</p>
      </td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xAE30;&#xBCF8; &#xBCFC;&#xB968; &#xAC12; -. &#xBCFC;&#xB968; &#xC870;&#xC808;
        &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294; &#xC804;&#xB2EC;&#xD558;&#xC9C0;
        &#xC54A;&#xC74C; -. version 1.2 &#xC774;&#xC804;&#xC5D0;&#xC11C;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />muted</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xC74C;&#xC18C;&#xAC70; &#xC0C1;&#xD0DC;
        <br />-. &#xC74C;&#xC18C;&#xAC70; &#xC124;&#xC815;&#xC774; &#xBD88;&#xAC00;&#xD55C;
        &#xACBD;&#xC6B0;&#xB294; &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
  </tbody>
</table>

## Directive

### SetVolume

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetVolume",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "rate": "{{STRING}}",
    "volumes": [
      {
        "name": "{{STRING}}",
        "volume": {{LONG}}
      }
    ]
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
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Context &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">rate</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SLOW, FAST</b>
        </p>
        <ul>
          <li>SLOW - &#xC810;&#xC9C4;&#xC801;&#xC73C;&#xB85C; &#xBCC0;&#xACBD; (max
            &#xAC12;&#xC73C;&#xB85C; &#xC124;&#xC815;&#xD558;&#xB294; &#xC2DC;&#xB098;&#xB9AC;&#xC624;&#xC5D0;&#xC11C;
            &#xC0AC;&#xC6A9;)</li>
          <li>FAST - &#xBC14;&#xB85C; &#xBCC0;&#xACBD;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">volume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC124;&#xC815;&#xD560; volume</td>
    </tr>
  </tbody>
</table>

### SetMute

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetVolume",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "rate": "{{STRING}}",
    "volumes": [
      {
        "name": "{{STRING}}",
        "mute": {{BOOLEAN}}
      }
    ]
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| name | string | Y | Context 참조 |
| mute | boolean | Y | true / false |

## Event

### SetVolumeSucceeded

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetVolumeSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### SetVolumeFailed

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetVolumeFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### SetMuteSucceeded

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetMuteSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### SetMuteFailed

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetMuteFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

