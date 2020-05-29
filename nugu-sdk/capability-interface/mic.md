---
description: 디바이스의 마이크를 제어하기 위한 규격
---

# Mic

## Version

최신 버전은 1.0 입니다.

## SDK Interface





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

