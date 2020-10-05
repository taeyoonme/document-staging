---
description: 디바이스의 블루투스를 제어하기 위한 규격
---

# Bluetooth

## Version

최신 버전은 1.0 입니다.

## SDK Interface

### Context 구성

디바이스의 블루투스 상태를 [Context](speaker.md#context) 에 포함시켜 주어야 합니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/bluetooth/BluetoothProvider.kt#L21)

### 블루투스 기기 제어

디바이스의 블루투스 기기 제어가 [StartDiscoverableMode](bluetooth.md#startdiscoverablemode)/[FinishDiscoverableMode](bluetooth.md#finishdiscoverablemode) directive 로 요청될 수 있습니다.

디바이스와 연결된 블루투스 기기의 음원 재생이 Play/Stop/Pause/Next/Previous directive 로 요청될 수 있습니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/ㅡmaster/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/bluetooth/BluetoothAgentInterface.kt#L82)

## Context

```text
{
  "Bluetooth": {
    "version": "1.0",
    "device": {
      "name": "{{STRING}}",
      "status": "{{STRING}}"
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
      <td style="text-align:left">device.name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">TTS&#xB85C; &#xC77D;&#xC5B4;&#xC904; &#xB54C; &#xC0AC;&#xC6A9;&#xAC00;&#xB2A5;&#xD55C;
        &#xD544;&#xB4DC; &#xC608;: NUGU_123456</td>
    </tr>
    <tr>
      <td style="text-align:left">device.status</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">ON / OFF</td>
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

