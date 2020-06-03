---
description: 디바이스의 마이크를 제어하기 위한 규격
---

# Mic

## Version

최신 버전은 1.0 입니다.

## SDK Interface

### Context 구성

디바이스의 microphone 상태를 [Context](mic.md#context) 에 포함시켜 주어야 합니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/microphone/Microphone.kt#L27)

### Microphone 제어

디바이스의 microphone 제어가 [SetMic](mic.md#setmic) directive 로 요청될 수 있습니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/microphone/Microphone.kt#L33)

[Linux reference](https://github.com/nugu-developers/nugu-linux/blob/master/include/capability/mic_interface.hh#L57)



## Context

```text
{
  "Mic": {
    "version": "1.0",
    "micStatus": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| micStatus | string | Y | ON / OFF |

## Directive

### SetMic

```text
{
  "header": {
    "namespace": "Mic",
    "name": "SetMic",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "status": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| status | string | Y | ON / OFF |

