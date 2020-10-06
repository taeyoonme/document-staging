---
description: 디바이스의 디스플레이를 제어하기 위한 규격
---

# Screen

## Version

최신 버전은 1.0 입니다.

## SDK Interface

#### ScreenAgent 사용

### Context 구성

디바이스의 디스플레이 상태를 [Context](screen.md#context) 에 포함시켜 주어야 합니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/screen/Screen.kt#L61)

### 디스플레이 제어

디바이스의 디스플레이 제어가 [TurnOn](screen.md#turnon)/[TurnOff](screen.md#turnoff)/[SetBrightness](screen.md#setbrightness) directive 로 요청될 수 있습니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/screen/Screen.kt#L41)

## Context

```text
{
  "Screen": {
    "version": "1.0",
    "state": "{{STRING}}",
    "brightness": {{LONG}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| state | enum | Y | **ON, OFF** |
| brightness | long | Y | 0 ~ 100 |

## Directive

### TurnOn

```text
{
  "header": {
    "namespace": "Screen",
    "name": "TurnOn",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "brightness": {{LONG}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| brightness | long | Y | 1 ~ 100 |

### TurnOff

```text
{
  "header": {
    "namespace": "Screen",
    "name": "TurnOff",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### SetBrightness

```text
{
  "header": {
    "namespace": "Screen",
    "name": "SetBrightness",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "brightness": {{LONG}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| brightness | long | Y | 1 ~ 100 |

