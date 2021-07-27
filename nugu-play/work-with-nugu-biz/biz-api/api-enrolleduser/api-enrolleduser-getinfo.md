# Biz 사용자 그룹 조회

퍼블리셔가 보유한 Biz 사용자\(서비스별/Play별\)를 조회하는 기능입니다.

## 1. URL <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC870;&#xD68C;v1-1.URL"></a>

```text
[GET] {{hostName}}/api/v1/enrolledUser/group
```

## 2. Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC870;&#xD68C;v1-2.Request"></a>

| 이름 | 유형 | 필수 | 설명 |
| :--- | :--- | :--- | :--- |
| Publisher-Token | Header | Y | 퍼블리셔가 보유한 토큰 |

## 3. Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC870;&#xD68C;v1-3.Response"></a>

### 3.1 Http Status <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC870;&#xD68C;v1-3.1HttpStatus"></a>

| HTTP Status | 설명 |
| :--- | :--- |
| 200 | 정상 응답 |
| 403 | 퍼블리셔 API Token이 유효하지 않을 경우의 응답 |

### 3.2 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC870;&#xD68C;v1-3.2Body"></a>

```text
{
    "service": {
        "groups": [
            {
                "name": "XXX",
                "token": "XXX",
                "alias": "XXX",
                "playServiceIds": ["aaa.bbb.ccc", "ddd.eee.fff"],
                "users": [
                    {
                        "email": "XXX",
                        "token": "XXX",
                        "name": "XXX",
                        "alias": "XXX",
                        "agreeYn": "Y",
                        "apiAgreeYn": "Y",
                        "apiAllowedDeviceCount", 3,
                        "invitationId": 33
                    },
                ]
            },
        ],
        "users": [
            {
                "email": "XXX",
                "token": "XXX",
                "name": "XXX",
                "alias": "XXX",
                "playServiceIds": ["aaa.bbb.ccc", "ddd.eee.fff"]
                "agreeYn": "Y",
                "apiAgreeYn": "Y",
                "apiAllowedDeviceCount", 3
                "invitationId": 33
            },
        ]
    },
    "plays": {
        "groups": [
            {
                "name": "XXX",
                "token": "XXX",
                "alias": "XXX",
                "playServiceIds": ["aaa.bbb.ccc", "ddd.eee.fff"],
                "users": [
                    {
                        "email": "XXX",
                        "name": "XXX",
                        "alias": "XXX"
                        "plays": [
                            {"playServiceId": "aaa.bbb.ccc", "token": "XXX", "agreeYn": "Y", "apiAgreeYn": "Y", "apiAllowedDeviceCount": 3},
                            {"playServiceId": "ddd.eee.fff", "token": "XXX", "agreeYn": "Y", "apiAgreeYn": "Y", "apiAllowedDeviceCount": 3}
                        ],
                        "invitationId": 33
                    },
                ]
            },
        ],
        "users": [
            {
                "email": "XXX",
                "name": "XXX",
                "alias": "XXX",
                "plays": [
                    {"playServiceId": "aaa.bbb.ccc", "token": "XXX", "agreeYn": "Y", "apiAgreeYn": "Y", "apiAllowedDeviceCount": 3},
                    {"playServiceId": "ddd.eee.fff", "token": "XXX", "agreeYn": "Y", "apiAgreeYn": "Y", "apiAllowedDeviceCount": 3}
                ],
                "invitationId": 33
            },
        ]
    }
}
```

### 3.3 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC870;&#xD68C;v1-3.3&#xC124;&#xBA85;"></a>

| 이름 | 속성 | 설명 |
| :--- | :--- | :--- |
| 이름 | 속성 | 설명 |
| service | object | 서비스로 초대받은 사용자 목록 |
| service.groups | array of object | 서비스로 초대받은 사용자의 그룹 목록 |
| service.groups\[\].name | string | 그룹 이름 |
| service.groups\[\].token | string | 그룹 API 토큰 |
| service.groups\[\].alias | string | 퍼블리셔가 지정한 그룹의 Alias |
| service.groups\[\].playServiceIds | array of string | 그룹에 할당된 private play의 playServiceId |
| service.groups\[\].users | array of object | 그룹에 속한 사용자 목록 |
| service.groups\[\].users\[\].email | string | 사용자 이메일 |
| service.groups\[\].users\[\].token | string | 사용자 API 토큰 |
| service.groups\[\].users\[\].name | string | 사용자 이름 |
| service.groups\[\].users\[\].alias | string | 퍼블리셔가 지정한 사용자의 Alias |
| service.groups\[\].users\[\].agreeYn | Y/N | 사용자의 서비스 사용 동의 여부 |
| service.groups\[\].users\[\].apiAgreeYn | Y/N | 사용자의 서비스 API 수신 동의 여부 |
| service.groups\[\].users\[\].apiAllowedDeviceCount | int | 사용자의 서비스 API 수신 기기 갯수 |
| service.groups\[\].users\[\].invitationId | int | 사용자의 그룹 변경, 또는 동의여부를 변경하기 위한 재초대가 진행중인 경우 초대의 sequence |
| service.users | array | 그룹에 속하지 않은 사용자 목록 |
| service.users\[\].email | string | 사용자 이메일 |
| service.users\[\].token | string | 사용자 API 토큰 |
| service.users\[\].name | string | 사용자 이름 |
| service.users\[\].alias | string | 퍼블리셔가 지정한 사용자의 Alias |
| service.users\[\].playServiceIds | array of string | 사용자에게 할당된 private play의 playServiceId |
| service.users\[\].agreeYn | Y/N | 사용자의 서비스 사용 동의 여부 |
| service.users\[\].apiAgreeYn | Y/N | 사용자의 서비스 API 수신 동의 여부 |
| service.users\[\].apiAllowedDeviceCount | int | 사용자의 서비스 API 수신 기기 갯수 |
| service.users\[\].invitationId | int | 사용자의 그룹 변경, 또는 동의여부를 변경하기 위한 재초대가 진행중인 경우 초대의 sequence |
| plays | object | play로 초대받은 사용자 목록 |
| plays.groups | array of object | play로 초대받은 사용자의 그룹 목록 |
| plays.groups\[\].name | string | 그룹 이름 |
| plays.groups\[\].token | string | 그룹 API 토큰 |
| plays.groups\[\].alias | string | 퍼블리셔가 지정한 그룹의 Alias |
| plays.groups\[\].playServiceIds | array of string | 그룹에 할당된 private play의 playServiceId |
| plays.groups\[\].users | array of object | 그룹에 속한 사용자 목록 |
| plays.groups\[\].users\[\].email | string | 사용자 이메일 |
| plays.groups\[\].users\[\].name | string | 사용자 이름 |
| plays.groups\[\].users\[\].alias | string | 퍼블리셔가 지정한 사용자의 Alias |
| plays.groups\[\].users\[\].plays | array of object | 사용자의 play별 동의 상태 |
| plays.groups\[\].users\[\].plays\[\].playServiceId | string | 초대된 play의 playServiceId |
| plays.groups\[\].users\[\].plays\[\].token | string | play별 사용자 API 토큰 |
| plays.groups\[\].users\[\].plays\[\].agreeYn | Y/N | 사용자의 초대된 play의 사용 동의 여부 |
| plays.groups\[\].users\[\].plays\[\].apiAgreeYn | Y/N | 사용자의 초대된 play의 API 수신 동의 여부 |
| plays.groups\[\].users\[\].plays\[\].apiAllowedDeviceCount | int | 사용자의 초대된 play의 API 수신 기기 갯수 |
| plays.groups\[\].users\[\].plays\[\].invitationId | int | 사용자의 그룹 변경, 또는 동의여부를 변경하기 위한 재초대가 진행중인 경우 초대의 sequence |
| plays.users | array of object | 그룹에 속하지 않은 사용자 목록 |
| plays.users\[\].email | string | 사용자 이메일 |
| plays.users\[\].name | string | 사용자 이름 |
| plays.users\[\].alias | string | 퍼블리셔가 지정한 사용자의 Alias |
| plays.users\[\].plays | array of object | 사용자의 play별 동의 상태 |
| plays.users\[\].plays\[\].playServiceId | string | 초대된 play의 playServiceId |
| plays.users\[\].plays\[\].token | string | play별 사용자 API 토큰 |
| plays.users\[\].plays\[\].agreeYn | Y/N | 사용자의 초대된 play의 사용 동의 여부 |
| plays.users\[\].plays\[\].apiAgreeYn | Y/N | 사용자의 초대된 play의 API 수신 동의 여부 |
| plays.users\[\].plays\[\].apiAllowedDeviceCount | int | 사용자의 초대된 play의 API 수신 기기 갯수 |
| plays.users\[\].plays\[\].invitationId | int | 사용자의 그룹 변경, 또는 동의여부를 변경하기 위한 재초대가 진행중인 경우 초대의 sequence |

####  <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC870;&#xD68C;v1-3.1.2&#xADF8;&#xB8F9;"></a>

