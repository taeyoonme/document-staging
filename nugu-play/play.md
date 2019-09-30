# Pre-built Play Builder로 스마트홈 Play 만들기

NUGU스마트홈을 활용해 SmartHomePlay를 제작하면 NUGU 에이전트가 탑재된 다양한 기기에서 음성 인터페이스를 활용하여 스마트홈 기기들을 제어하고 확인할 수 있습니다. 이 문서에서는 NUGU스마트홈을 통해 서비스를 제공하고 싶은 IoT Service Provider에게 규격 및 개발 가이드와 API 레퍼런스, 샘플코드, NUGU SmartHome Playbuilder 사용 가이드 등을 제공합니다. NUGU스마트홈은 계속 개발되고 있으며, 관련 규격들은 지속적으로 업데이트됩니다.

![](../.gitbook/assets/hestia.png)

## Discovery

SmartHomePlay의 동작을 위해서는 SmartHomeServiceProvider의 SmartHomeDevice 정보를 NUGU스마트홈에 등록해야 합니다. 일반 사용자가 NUGU스마트홈에 SmartHomeDevice를 등록하려면 NUGU App의 스마트홈 메뉴에서 "신규 디바이스 등록하기" 기능을 사용해야 합니다. "신규 디바이스 등록하기"를 선택한 후 SmartHomePlay를 선택하면 해당 SmartHomePlay의 SmartHomeServiceProvider가 제공하는 계정연동\(OAUTH 2.0\) 웹페이지로 이동하고 계정 연동을 통해 SmartHomeServiceProvider에 등록된 SmartHomeDevice 정보를 불러오게 됩니다. 불러온 SmartHomeDevice 정보 중 사용자가 선택해 등록한 SmartHomeDevice는 NUGU스마트홈을 통해 제어할 수 있게 됩니다. 사용자가 NUGU App을 통해 SmartHomePlay의 SmartHomeDevice를 등록하려고 하면 NUGU스마트홈은 SmartHomeServiceProvider에게 Discovey를 요청하고 SmartHomeServiceProvider는 아래 예시와 같이 NUGU스마트홈에 등록할 수 있는 모든 SmartHomeDevice 정보를 응답해야 합니다.

Discovery Request Sample

```text
Discovery Request 예시 (POST, /nugu/v1/devices)
  
{
    "userIdentifier": "t6Pv9PLAEmYZilNiloUUnZbVDjXgvUCzwpWY1tPq" (optional, e.g. hue whitelist identifier),
    "token": "7KOdwPQdJPZf4KYsjtHdqz3e8fKd"
}
```

Discovery Response Sample

```text
Discovery Response 예시
  
  
{
    "devices": [{
        "id": "D1234567",
        "type": "AIR_CONDITIONER",
        "modelName": "휘센",
        "friendlyNameSuggestion": "거실",
        "manufacturer": "LG Electronics",
        "supportedCapabilities": {
            "airflowControl": {
              "supportedAirflowTypes": [ "강", "강풍", "미풍", "수면", "약", "약풍", "자동", "자동풍" ]
            },
            "airQualityCheck": {},
            "endTimeControl": {},
            "modeControl": {
              "supportedModes": ["무풍모드", "냉방모드", "수면모드" ]
            },
            "powerControl": {},
            "temperatureControl": {}
        },
        "customData": {
            ...
        },
        "connectionStatus": true
    }]
}
```

## Control

NUGU스마트홈에 등록된 SmartHomeDevice에 제어 요청이 올 경우 NUGU스마트홈은 HestiaPlay logic에 따라 제어 대상 및 제어 명령을 확정 짓고 Discovery단계에서 등록된 정보를 활용해 SmartHomeServiceProvider에게 제어 명령을 전달합니다. 이때 제어 명령을 실제로 수신하는 것은 SmartHomePlay를 제작할 당시에 입력한 SmartHomePlayBackendProxy입니다. 제어명령은 SmartHomeDeviceType과 SmartHomeCapability, SmartHomeDirective로 정리되어 요청되며, SmartHomeCapability, SmartHomeDirective에 따라 부가 정보가 포함되기도 합니다.

Control Request Sample

```text
Control Request 예시 (POST, /nugu/v1/capabilities/{Capability}/directives/{Directive})
  
  
{
    "version": 1,
    "requestId": "2019071712638a4378649347bdb21643127a0f6d83",
    "action": {
        "command": {
          "smartHomeCapability": "TemperatureControl",
          "smartHomeDirective": "SetTemperature",
          "parameters": {
            "temperatureLevel": 22
          }
        },
        "smartHomeDevices": [
          {
            "id": "D83077224431",
            "type": "에어컨",
            "model": null,
            "friendlyName": "거실",
            "customData" : {}
          }
        ]
    },
    "context": {
        "session": {
            "id": "a5a250af-48f7-4ceb-b099-ea6753afa570",
            "accessToken": "DUMMY_ACCESS_TOKEN",
            "userIdentifier": "SERVICE_PROVIDER_USER_ID (optional, e.g. Hue whitelist Identifier)"
        }
    }
}
```

Control Response Sample

```text
Control Response 예시
  
{
    "resultCode": "OK" <-- 에러일 경우 에러코드 응답,
    "requestId": "2019071712638a4378649347bdb21643127a0f6d83", <-- request로 받은 값을 그대로 응답
    "parameters": {} <-- directive 마다 필요한 property 채워서 응답.
}
```

## 스마트홈 Play 만들기

