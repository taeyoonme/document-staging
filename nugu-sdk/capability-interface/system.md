---
description: 디바이스의 전원 및 네트워크 연결 상태를 관리하기 위한 규격
---

# System

## Version

최신 버전은 1.1 입니다.

## SDK Interface

### SystemAgent 사용

System interface 규격에 따른 디바이스의 동작 제어는 SystemAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 SystemAgent instance 에 접근할 수 있습니다.

```text
val systemAgent = nuguAndroidClient.systemAgent
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 SystemAgent instance 에 접근할 수 있습니다.

```text
let systemAgent = nuguClient.systemAgent
```
{% endtab %}

{% tab title="Linux" %}
[CapabilityFactory::makeCapability](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1CapabilityFactory.html#a46d96b1bc96903f02905c92ba8794bf6) 함수로 [SystemAgent](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ISystemHandler.html) 를 생성하고 [NuguClient](https://nugu-developers.github.io/nugu-linux/classNuguClientKit_1_1NuguClient.html) 에 추가해 주어야합니다.

```text
system_handler = std::shared_ptr<ISystemHandler>(
	        CapabilityFactory::makeCapability<SystemAgent, ISystemHandler>());

nugu_client->getCapabilityBuilder()
    ->add(system_handler.get())
    ->construct();
```
{% endtab %}
{% endtabs %}

### 디바이스 전원 제어

`사용자 발화` 에 따라 [TurnOff](system.md#turnoff) directive 로 디바이스 전원을 제어할 수 있습니다.

{% hint style="warning" %}
iOS 는 지원하지 않습니다
{% endhint %}

{% tabs %}
{% tab title="Android" %}
SystemAgentInterface.Listener 를 추가합니다.

```text
val listener = object: SystemAgentInterface.Listener {
    override fun onTurnOff() {
        ...
    }
}
systemAgent.addListener(listener)
```
{% endtab %}

{% tab title="Linux" %}
[ISystemListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ISystemListener.html) 를 추가합니다.

```text
class MySystemListener : public ISystemListener {
public:
    ...

    void onTurnOff() override
    {
        ...
    }
    
    ...
};
system_listener = std::make_shared<MySystemListener>();
CapabilityFactory::makeCapability<SystemAgent, ISystemHandler>(system_listener.get());
```
{% endtab %}
{% endtabs %}

### 에러처리

NUGU 서버에서 에러가 발생할 경우 [Exception](system.md#exception) directive 로 error code가 전달됩니다.

사용자가 에러 상황을 인지할 수 있도록 Toast, Local TTS 등으로 안내해야합니다.

{% tabs %}
{% tab title="Android" %}
SystemAgentInterface.Listener 를 추가합니다.

```text
val listener = object: SystemAgentInterface.Listener {
    override fun onException(code: ExceptionCode, description: String?) {
        ...
    }
}
systemAgent.addListener(listener)
```
{% endtab %}

{% tab title="iOS" %}
SystemAgentDelegate 를 추가합니다.

```text
class MySystemAgentDelegate: SystemAgentDelegate {
    func systemAgentDidReceiveExceptionFail(code: SystemAgentExceptionCode.Fail, dialogRequestId: String) {
        ...
    }
    
    ...
}
systemAgent.add(systemAgentDelegate: MySystemAgentDelegate())
```
{% endtab %}

{% tab title="Linux" %}
[ISystemListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ISystemListener.html) 를 추가합니다.

```text
class MySystemListener : public ISystemListener {
public:
    ...

    void onException (SystemException exception, const std::string &dialog_id) override
    {
        ...
    }
    
    ...
};
system_listener = std::make_shared<MySystemListener>();
CapabilityFactory::makeCapability<SystemAgent, ISystemHandler>(system_listener.get());
```
{% endtab %}
{% endtabs %}

### 디바이스 등록 해제

누구 서버에서 디바이스가 등록 해제되면 [Revoke](system.md#revoke) directive 로 reason 이 전달됩니다.

Application 의 상황에 따라 NUGU 로그인 화면으로 이동하거나 NUGU Button 을 비활성화 해야합니다.

{% tabs %}
{% tab title="Android" %}
SystemAgentInterface.Listener 를 추가합니다.

```text
val listener = object: SystemAgentInterface.Listener {
    override fun onRevoke(reason: RevokeReason) {
        ...
    }
}
systemAgent.addListener(listener)
```
{% endtab %}

{% tab title="iOS" %}
SystemAgentDelegate 를 추가합니다.

```text
class MySystemAgentDelegate: SystemAgentDelegate {
    func systemAgentDidReceiveRevokeDevice(reason: SystemAgentRevokeReason, dialogRequestId: String) {
        ...
    }
    
    ...
}
systemAgent.add(systemAgentDelegate: MySystemAgentDelegate())
```
{% endtab %}

{% tab title="Linux" %}
[ISystemListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1ISystemListener.html) 를 추가합니다.

```text
class MySystemListener : public ISystemListener {
public:
    ...

    onRevoke (RevokeReason reason) override
    {
        ...
    }
    
    ...
};
system_listener = std::make_shared<MySystemListener>();
CapabilityFactory::makeCapability<SystemAgent, ISystemHandler>(system_listener.get());
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "System": {
    "version": "1.1"
  }
}
```

## Directive

### TurnOff

디바이스 전원 끄기 요청입니다.

```text
{
  "header": {
    "namespace": "System",
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

### Exception

누구 서버에서 에러가 발생하면 전달됩니다.

```text
{
  "header": {
    "namespace": "System",
    "name": "Exception",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "code": "{{STRING}}",
    "description": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| code | string | Y | 서버에서 발생 |
| description | string | N | 에러에 대한 설명 |

| code | description |
| :--- | :--- |
| UNAUTHORIZED\_REQUEST\_EXCEPTION | 접속 시 인증 에러 |
| ASR\_RECOGNIZING\_EXCEPTION | 음성 인식 에러 |
| PLAY\_ROUTER\_PROCESSING\_EXCEPTION | Play router 에러 |
| TTS\_SPEAKING\_EXCEPTION | 음성 합성 에러 |
| INTERNAL\_SERVICE\_EXCEPTION | 기타 알 수 없는 에러 |

### Revoke

NUGU 서버에서 디바이스가 등록 해제되면 전달됩니다.

```text
{
  "header": {
    "namespace": "System",
    "name": "Revoke",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "reson": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| reason | string | Y | 디바이스가 등록 해제된 원인 |

| reason | description |
| :--- | :--- |
| REVOKED\_DEVICE | NUGU 모바일 앱에서 디바이스 연결 해제 |

