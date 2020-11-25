---
description: 디바이스의 블루투스를 제어하기 위한 규격
---

# Bluetooth

## Version

최신 버전은 1.1 입니다.

| Version | Date | Description |
| :--- | :--- | :--- |
| 1.0 | 2020.03.03 | 규격 추가 |
| 1.1 | 2020.06.22 | Context 의 device 에 profile 필드 추가 |

## SDK Interface

### BluetoothAgent 사용

Bluetooth interface 규격에 따른 디바이스의 동작 제어는 BluetoothAgent 가 처리합니다.

{% hint style="warning" %}
iOS 는 BluetoothAgent 를 지원하지 않습니다.
{% endhint %}

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 BluetoothAgent instance 에 접근할 수 있습니다.

```text
val bluetoothAgent = nuguAndroidClient.bluetoothAgent
```

NuguAndroidClient 생성시 BluetoothProvider 을 추가합니다.

```text
class MyBluetoothProvider: BluetoothProvider {
    ...
}
NuguAndroidClient.Builder(...)
    .bluetoothProvider(MyBluetoothProvider)
```
{% endtab %}
{% endtabs %}

### Context 구성

디바이스의 블루투스 상태를 [Context](speaker.md#context) 에 포함시켜 주어야 합니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/bluetooth/BluetoothProvider.kt#L21)

{% tabs %}
{% tab title="Android" %}
BluetoothProvider 를 구현합니다.

```text
class MyBluetoothProvider: BluetoothProvider {
    override fun device() : BluetoothHost? {
        ...
    }

    override fun activeDevice() : BluetoothDevice? {
        ...
    }

    ...
}
```
{% endtab %}
{% endtabs %}

### 블루투스 기기 제어

디바이스의 블루투스 기기 제어가 [StartDiscoverableMode](bluetooth.md#startdiscoverablemode)/[FinishDiscoverableMode](bluetooth.md#finishdiscoverablemode) directive 로 요청될 수 있습니다.

디바이스와 연결된 블루투스 기기의 음원 재생이 [Play](bluetooth.md#play)/[Stop](bluetooth.md#stop)/[Pause](bluetooth.md#pause)/[Next](bluetooth.md#next)/[Previous](bluetooth.md#previous) directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
제어 기능을 실행하려면 BluetoothAgentInterface.Listener 를 추가합니다.

```text
val listener = object: BluetoothAgentInterface.Listener {
    fun onDiscoverableStart(durationInSeconds: Long = 0) : DiscoverableStartResult {
        ...
    }

    fun onDiscoverableFinish() : Boolean {
        ...
    }

    fun onAVRCPCommand(command: AVRCPCommand) {
        ...
    }
}
bluetoothAgent.setListener(listener)
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "Bluetooth": {
    "version": "1.0",
    "device": {
      "name": "{{STRING}}",
      "status": "{{STRING}}",
      "profiles": [
        {
          "name": "{{STRING}}",
          "enabled": "{{STRING}}"
        }
      ]
    },
    "activeDevice": {
      "id": "{{STRING}}",
      "name": "{{STRING}}",
      "streaming": "{{STRING}}"
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
      <td style="text-align:left">device</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC758; &#xBE14;&#xB8E8;&#xD22C;&#xC2A4;
        &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">device.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">TTS&#xB85C; &#xC77D;&#xC5B4;&#xC904; &#xB54C; &#xC0AC;&#xC6A9;&#xAC00;&#xB2A5;&#xD55C;
        &#xD544;&#xB4DC; &#xC608;: NUGU_123456</td>
    </tr>
    <tr>
      <td style="text-align:left">device.
        <br />status</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">ON / OFF</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>device.</p>
        <p>profile</p>
      </td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Pairing&#xB41C; bluetooth device&#xAC00; &#xC788;&#xC744; &#xACBD;&#xC6B0;
          &#xC9C0;&#xC6D0;&#xD558;&#xB294; profile&#xC758; &#xBAA9;&#xB85D;</p>
        <p>&#xD574;&#xB2F9; &#xBAA9;&#xB85D;&#xC740; &#xC9C0;&#xC6D0;&#xD558;&#xB294;
          profile&#xC774; &#xC788;&#xC744; &#xACBD;&#xC6B0; &#xBA85;&#xC2DC;&#xB428;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>device.</p>
        <p>profile.</p>
        <p>name</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Pairing&#xB41C; bluetooth device&#xAC00; &#xC788;&#xC744; &#xACBD;&#xC6B0;
          &#xD574;&#xB2F9; device&#xC758; &#xC9C0;&#xC6D0; profile&#xC758; &#xC774;&#xB984;&#xC744;
          &#xB098;&#xD0C0;&#xB0C4;</p>
        <p>&#xC544;&#xB798;&#xB294; &#xD604;&#xC7AC; &#xD655;&#xC778;&#xB41C; profile
          list&#xC774;&#xBA70;, &#xD574;&#xB2F9; device&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xD558;&#xB294;
          profile&#xC740; &#xCD94;&#xAC00;&#xB420; &#xC218; &#xC788;&#xC74C;</p>
        <ul>
          <li><b>HSP</b>: Headset Profile(&#xC804;&#xD654; &#xC218;&#xBC1C;&#xC2E0;&#xC744;
            &#xC704;&#xD55C; profile)</li>
          <li><b>A2DP</b>: Advanced Audio Distribution Profile(&#xC624;&#xB514;&#xC624;
            &#xC7AC;&#xC0DD; profile)</li>
          <li><b>PBAP</b>: Phone Book Access Profile(Pairing&#xB41C; device&#xC758;
            &#xC5F0;&#xB77D;&#xCC98;&#xB97C; &#xC218;&#xC9D1;&#xD560; &#xC218; &#xC788;&#xB294;
            profile)</li>
          <li><b>MAP</b>: Message Access Profile(&#xBB38;&#xC790; &#xC218;&#xBC1C;&#xC2E0;&#xC744;
            &#xC704;&#xD55C; profile)</li>
          <li><b>PAN</b>: Personal Area Networking(&#xBE14;&#xB8E8;&#xD22C;&#xC2A4;
            &#xD14C;&#xB354;&#xB9C1; profile)</li>
        </ul>
        <p>Profile &#xC774;&#xB984;&#xC740; <a href="https://www.bluetooth.com/ko-kr/specifications/profiles-overview/">bluetooth.com</a>&#xC5D0;
          &#xBA85;&#xC2DC;&#xB41C; profile&#xC758; &#xC57D;&#xC790;&#xC784;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>device.</p>
        <p>profile.</p>
        <p>enabled</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Pairing&#xB41C; bluetooth device&#xAC00; &#xC788;&#xC744; &#xACBD;&#xC6B0;
          &#xD574;&#xB2F9; device&#xC758; &#xC9C0;&#xC6D0; profile&#xC758; &#xC0AC;&#xC6A9;
          &#xC5EC;&#xBD80;&#xB97C; &#xB098;&#xD0C0;&#xB0C4;</p>
        <ul>
          <li>TRUE</li>
          <li>FALSE</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">activeDevice</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC5F0;&#xACB0;&#xB41C; &#xBE14;&#xB8E8;&#xD22C;&#xC2A4; &#xAE30;&#xAE30;
        &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>activeDevice.</p>
        <p>id</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ID(pairedDevices &#xBAA9;&#xB85D; &#xC911; &#xD558;&#xB098;&#xC774;&#xC5B4;&#xC57C;
        &#xD568;)</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>activeDevice.</p>
        <p>name</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>activeDevice.</p>
        <p>streaming</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>streaming &#xC0C1;&#xD0DC;(INACTIVE / ACTIVE / PAUSED / UNUSABLE)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Directive

### StartDiscoverableMode

Discoverable mode 활성화 요청입니다.

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "StartDiscoverableMode",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "durationInSeconds": "{{LONG}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| durationInSeconds | long | N | Discoverable mode 를 지속할 시간\(필드가 없는 경우 상시 모드\) |

### FinishDiscoverableMode

Discoverable mode 비활성화 요청입니다.

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "FinishDiscoverableMode",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Play

연결된 블루투스 기기의 음원 재생 요청입니다.

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "Play",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Stop

연결된 블루투스 기기의 음원 재생 중지 요청입니다.

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "Play",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Pause

연결된 블루투스 기기의 음원 일시정지 요청입니다.

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "Pause",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Next

연결된 블루투스 기기의 다음 음원 재생 요청입니다.

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "Next",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Previous

연결된 블루투스 기기의 이전 음원 재생 요청입니다.

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "Previous",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

## Event

### StartDiscoverableModeSucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "StartDiscoverableModeSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "hasPairedDevices": "{{BOOLEAN}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| hasPairedDevices | boolean | Y | paired device 유무 |

### StartDiscoverableModeFailed

* Discoverable mode 진입 실패

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "StartDiscoverableModeFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "hasPairedDevices": "{{BOOLEAN}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| hasPairedDevices | boolean | Y | paired device 유무 |

### FinishDiscoverableModeSucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "FinishDiscoverableModeSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### FinishDiscoverableModeFailed

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "FinishDiscoverableModeFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ConnectSucceeded

* paired 이력에서 디바이스 연결이 성공 했을 때 또는 source\(스마트폰 등\)에서 직접 연결 연결 성공 했을 때 발생

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "ConnectSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ConnectFailed

* paired 이력에서 디바이스 연결이 실패 했을 때 발생

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "ConnectFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### DisconnectSucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "DisconnectSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### DisconnectFailed

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "DisconnectFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlPlaySucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlPlaySucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlPlayFailed

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlPlayFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlStopSucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlStopSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlStopFailed

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlStopFaile",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlPauseSucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlPauseSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlPauseFailed

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlPauseFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlNextSucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlNextSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlNextFailed

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlNextFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlPreviousSucceeded

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlPreviousSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### MediaControlPreviousFailed

```text
{
  "header": {
    "namespace": "Bluetooth",
    "name": "MediaControlPreviousFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

