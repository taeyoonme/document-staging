---
description: 디바이스의 전원 및 네트워크 연결 상태를 관리하기 위한 규격
---

# System

## Version

최신 버전은 1.3 입니다.

| Version | Date | Description |
| :--- | :--- | :--- |
| 1.0 | 2019.12.05 | 규격 추가 |
| 1.1 | 2020.03.20 | System.Revoke, System.Noop directive 추가 |
| 1.2 | 2020.06.05 | System.Revoke directive 에 WITHDRAWN\_USER 추가 |
| 1.3 | 2020.08.27 | System.ResetConnection 추가 |

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
auto system_handler(std::shared_ptr<ISystemHandler>(
            CapabilityFactory::makeCapability<SystemAgent, ISystemHandler>()));

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
auto system_listener(std::make_shared<MySystemListener>());
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

    void onException(SystemException exception, const std::string &dialog_id) override
    {
        ...
    }

    ...
};
auto system_listener(std::make_shared<MySystemListener>());
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

    onRevoke(RevokeReason reason) override
    {
        ...
    }

    ...
};
auto system_listener(std::make_shared<MySystemListener>());
CapabilityFactory::makeCapability<SystemAgent, ISystemHandler>(system_listener.get());
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "System": {
    "version": "1.3"
  }
}
```

## Directive

### ResetUserInactivity

{% hint style="info" %}
Connection-oriented 디바이스에서만 사용
{% endhint %}

* UserInactivityReport 이벤트의 inactivity timer를 리셋시키기 위해 전송
* 사용자 인터렉션은 없지만 서비스를 사용하는 경우에 보내야 함

```text
{
  "header": {
    "namespace": "System",
    "name": "ResetUserInactivity",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {}
}
```

### HandoffConnection

{% hint style="info" %}
Connection-oriented 디바이스에서만 사용
{% endhint %}

* NUGU Platform과 TCP  connection을 맺고 유지하는 디바이스에게 연결을 끊고 다시 접속하라는 명령
* 장시간 사용하지 않는 경우 NUGU Platform에서 TCP connection을 관리하는 서버의 rebalancing을 위해 사용
* NUGU Platform은 UserInactivityReport에서 inactivity 시간을 보고 장시간 사용하지 않은 디바이스를 대상으로 RevokeConnection 디렉티브를 전송할 수 있음

```text
{
  "header": {
    "namespace": "System",
    "name": "HandoffConnection",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "protocol": "{{STRING}}",
    "hostName": "{{STRING}}",
    "port": {{LONG}},
    "retryCountLimit": {{LONG}},
    "connectionTimeout": {{LONG}},
    "charge": "{{STRING}}"
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
      <td style="text-align:left">protocol</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>H2_GRPC : grpc over http2</li>
          <li>H2 : http2</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">hostname</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">domain</td>
    </tr>
    <tr>
      <td style="text-align:left">address</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">deprecated ip or domain</td>
    </tr>
    <tr>
      <td style="text-align:left">port</td>
      <td style="text-align:left">Int</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">port</td>
    </tr>
    <tr>
      <td style="text-align:left">retryCountLimit</td>
      <td style="text-align:left">Int</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">retry_count_limit&#xAE4C;&#xC9C0; &#xC694;&#xCCAD; &#xD55C; &#xD6C4; &#xB2E4;&#xC74C;
        server&#xB85C; &#xC811;&#xC18D; &#xC2DC;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">connectionTimeout</td>
      <td style="text-align:left">Int</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">milliseconds</td>
    </tr>
    <tr>
      <td style="text-align:left">charge</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li>NORMAL : &#xC77C;&#xBC18;&#xC801;&#xC778; &#xD1B5;&#xC2E0; &#xC694;&#xAE08;
            &#xACFC;&#xAE08; (default)</li>
          <li>FREE : &#xBB34;&#xACFC;&#xAE08; &#xD3EC;&#xD2B8;&#xB97C; &#xC774;&#xC6A9;&#xD558;&#xC5EC;
            device gateway&#xC5D0; &#xC811;&#xC18D;&#xD574;&#xC11C; TTS.SpeechPlay
            Event&#xB97C; &#xD1B5;&#xD574; &#xC74C;&#xC131; &#xD569;&#xC131;</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### TurnOff

* 디바이스 전원 끄기 요청입니다.

```text
{
  "header": {
    "namespace": "System",
    "name": "TurnOff",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {}
}
```

### UpdateState

* 디바이스의 모든 상태 정보 전달 요청

```text
{
  "header": {
    "namespace": "System",
    "name": "UpdateState",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {}
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

<table>
  <thead>
    <tr>
      <th style="text-align:left">code</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">UNAUTHORIZED_REQUEST_EXCEPTION</td>
      <td style="text-align:left">
        <p>&#xC811;&#xC18D;&#xC2DC; &#xC778;&#xC99D; &#xC5D0;&#xB7EC;</p>
        <ul>
          <li>jwt &#xD1A0;&#xD070;&#xC774; &#xC720;&#xD6A8;&#xD558;&#xC9C0; &#xC54A;&#xAC70;&#xB098;
            header&#xC5D0; &#xD1A0;&#xD070;&#xC774; &#xC5C6;&#xB294; &#xACBD;&#xC6B0;
            <br
            />- grpc : System.Exception(UNAUTHORIZED_REQUEST_EXCEPTION)&#xC744; &#xB0B4;&#xB9AC;&#xACE0;
            &#xC5F0;&#xACB0; &#xB04A;&#xC74C;
            <br />- h2 : 403 &#xC5D0;&#xB7EC;</li>
          <li>play router&#xC5D0;&#xC11C; &#xD1A0;&#xD070;&#xC774; &#xC720;&#xD6A8;&#xD558;&#xC9C0;
            &#xC54A;&#xC544;&#xC11C; &#xC2E4;&#xD328;</li>
          <li>jwt &#xD1A0;&#xD070;&#xC740; &#xC720;&#xD6A8;&#xD558;&#xC9C0;&#xB9CC;
            &#xB514;&#xBC14;&#xC774;&#xC2A4; &#xC5F0;&#xACB0; &#xC9C1;&#xD6C4; habilis&#xB97C;
            &#xC870;&#xD68C;&#xD574;&#xC11C; &#xD1A0;&#xD070;&#xC774; &#xC720;&#xD6A8;&#xD558;&#xC9C0;
            &#xC54A;&#xC740; &#xAC83;&#xC774; &#xD655;&#xC778;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">ASR_RECOGNIZING_EXCEPTION</td>
      <td style="text-align:left">&#xC74C;&#xC131; &#xC778;&#xC2DD; &#xC5D0;&#xB7EC;</td>
    </tr>
    <tr>
      <td style="text-align:left">PLAY_ROUTER_PROCESSING_EXCEPTION</td>
      <td style="text-align:left">
        <p>Play router &#xC5D0;&#xB7EC;</p>
        <ul>
          <li>Fallback Play &#xC5F0;&#xB3D9; &#xC2E4;&#xD328;</li>
          <li>Client &#xB85C;&#xC9C1; &#xC624;&#xB958;(&#xC798;&#xBABB;&#xB41C; &#xADDC;&#xACA9;&#xC73C;&#xB85C;
            &#xC694;&#xCCAD;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">TTS_SPEAKING_EXCEPTION</td>
      <td style="text-align:left">&#xC74C;&#xC131; &#xD569;&#xC131; &#xC5D0;&#xB7EC;</td>
    </tr>
    <tr>
      <td style="text-align:left">INTERNAL_SERVICE_EXCEPTION</td>
      <td style="text-align:left">&#xAE30;&#xD0C0; &#xC54C; &#xC218; &#xC5C6;&#xB294; &#xC5D0;&#xB7EC;</td>
    </tr>
  </tbody>
</table>

### NoDirectives

* Event에 대한 play router 처리 결과과 없는 경우 발생

```text
{
  "header": {
    "namespace": "System",
    "name": "NoDirectives",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {}
}
```

### Revoke

NUGU 서버에서 디바이스가 등록 해제되면 전달됩니다.

```text
{
  "header": {
    "namespace": "System",
    "name": "Revoke",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
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

### Noop

* http2 response에서 multi part body를 사용하면서 padding으로 사용 
* 클라이언트에서는 Noop은 무시하고 아무런 처리를 하지 않음

```text
{
  "header": {
    "namespace": "System",
    "name": "Noop",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {}
}
```

### ResetConnection

{% hint style="info" %}
Connection-oriented 디바이스에서만 사용
{% endhint %}

* 이 요청을 받으면 클라이언트는 registry에 다시 접속해서 주소를 받아서 접속한다. 

```text
{
  "header": {
    "namespace": "System",
    "name": "ResetConnection",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
      "description": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| description | String | N | 서버에서 정보를 남기기 위한 단순 로깅 용도 |

## Events

### SynchronizeState

* System.UpdateState 에 대한 응답

```text
{
  "header": {
    "namespace": "System",
    "name": "SynchronizeState",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {}
}
```

### UserInactivityReport

{% hint style="info" %}
Connection-oriented 디바이스에서만 사용
{% endhint %}

* 1시간동안 사용자 인터렉션이 없는 경우 보내야 함

```text
{
  "header": {
    "namespace": "System",
    "name": "UserInactivityReport",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "inactiveTimeInSeconds": {{LONG}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| inactiveTimeInSeconds | long | Y |  |

### Disconnect

{% hint style="info" %}
Connection-oriented 디바이스에서만 사용
{% endhint %}

* handoff 가 완료되어 더 이상 받을 directive나 TTS stream이 없는 경우
* 디바이스 종료 등 이슈로 연결을 끊는 경우

```text
{
  "header": {
    "namespace": "System",
    "name": "SynchronizeState",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {}
}
```

### Echo

{% hint style="info" %}
Connection-oriented 디바이스에서만 사용
{% endhint %}

* device-gateway와 연결 상테를 테스트하기 위한 event

```text
{
  "header": {
    "namespace": "System",
    "name": "SynchronizeState",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {}
}
```

