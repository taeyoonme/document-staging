# Backend proxy API Reference

## Request sample

```bash
POST /action_name HTTP/1.1
Accept: application/json, */*
Content-Length: 400
Content-Type: application/json
Host: builder.open.co.kr
Authorization: token TOKEN_STRING


{
    "version": "2.0",
    "action": {
        "actionName": "{{string}}",
        "parameters": {
            KEY: {
                "type": "{{string}}",
                "value": VALUE
            }
        }
    },
    "event": {
        "type": "{{string}}"
    },  
    "context": {
        "session": {
            "accessToken": "{{string}}"
        },
        "device": {
            "type": "{{string}}",
            "state": {
                KEY: VALUE
            }
        },
        "supportedInterfaces": {
            "AudioPlayer": {
                "playerActivity": "PLAYING",
                "token": "string value",
                "offsetInMilliseconds": 100000
            }  
        },
        "privatePlay" : { } // reserved
    }
}
```

## Request header

| Parameter | Location | Mandatory | Description |
| :--- | :--- | :--- | :--- |
| Authorization | header | N | Backend proxy에서 유효한 요청인지 검증\(validation\)하기 위해 사용합니다. |

{% hint style="info" %}
실제 스피커에서 연동할 때 전달하는 값이며, PlayBuider에서 테스트할 때는 포함하지 않습니다.

`NUGU developers` &gt; `내 정보` &gt; `API key` 정보에서 확인할 수 있습니다.
{% endhint %}

## Request body

| Parameter | Type | Mandatory | Description |
| :--- | :--- | :--- | :--- |
| version | string | Y | Backend proxy API 버전을 표시합니다. |
| action | json |  |  |
| action.actionName | string | Y | 현재 요청하는 Action의 이름입니다. |
| action.parameters | string | Y | Action에서 설정된 파라미터로 Play Builder에서 설정한 내용을 포함합니다.  \(단, 값이 null인 경우 요청에서 제외됩니다.   요청에서 생략되었더라도 Backend parameter를 응답 값으로 포함해야 합니다.\)     KEY - Play Builder에서 Action 내에 정의한 parameter 이름    type - 사용자 발화에서 분석된 Entity인 경우 Play Builder에서 설정한 Entity의 타입  value - 파라미터의 값으로 string 타입 |
| event | json | Y |  |
| event.type | string | Y | 디바이스에서 발생한 event의 종류를 나타내며, 이 값에 따라 event의 데이터가 달라집니다. \(Capability Interfaces 참조\) |
| context | json | Y |  |
| context.session | json | Y |  |
| context.session.id | string | Y | 대화가 유지되는 동안의 유효한 키 값입니다. |
| context.session.isNew | boolean | Y | 대화의 처음을 알려주는 값입니다. |
| context.session.accessToken | string | N | OAuth 2에 사용되는 인증 token입니다. |
| context.session.isPlayBuilderRequest | bool | N | Play Builder에서 테스트용으로 전달한 요청임을 의미합니다. \(기본값: false\) |
| context.device | json | Y |  |
| context.device.type | string | Y | 현재 사용 중인 디바이스 종류를 나타냅니다. |
| context.device.state | json | N | 디바이스의 상태를 나타내는 값으로 현재는 정의된 것이 없습니다. |
| context.supportedInterfaces | json | Y | 개발한 Play가 특정 Capability Interface를 지원하는 경우 각 Interface별로 상태 정보를 표시합니다. |
| profile | json | N | Private Play에서만 사용됩니다. |
| profile.privatePlay | json | N | Private Play인 경우 정보를 추가합니다. |
| profile.privatePlay.deviceUniqueId | string | N | Private Play인 경우에만 입력합니다. |
| profile.privatePlay.userKey | string | Y | 해시된 사용자 ID\(hashed user id\)를 나타냅니다. |
| profile.privatePlay.deviceKey | string | Y | 해시된 디바이스 ID\(hashed device id\)를 나타냅니다. |
| profile.privatePlay.enrolledUser | json | N | 초대 사용자\(enrolled user\)인 경우 정보를 추가합니다. |
| profile.privatePlay.enrolledUser.name | string | Y | 초대 사용자 추가 이름을 나타냅니다. |
| profile.privatePlay.enrolledUser.phoneNo | string | Y | 초대 사용자 추가 전화번호를 나타냅니다. |
| profile.privatePlay.enrolledUser.email | string | Y | 초대 사용자 추가 이메일을 나타냅니다. |
| profile.privatePlay.enrolledUser.tag | string | N | 초대 사용자 추가 정보를 나타냅니다. |

{% hint style="info" %}
context.device.state와 context.privatePlay는 동일 버전 내에서 하위 호환성을 유지한 상태로 지속적으로 확장될 수 있는 필드이므로 구현 시 주의해야 합니다.
{% endhint %}

## Context for Capability Interfaces\(AudioPlayer Interface\)

AudioPlayer Interface를 사용하도록 설정된 Play에만 전송됩니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Type</th>
      <th style="text-align:left">Mandatory</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">playerActivity</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>&#xC2A4;&#xD53C;&#xCEE4;&#xC758; &#xC624;&#xB514;&#xC624; &#xD50C;&#xB808;&#xC774;&#xC5B4;
            &#xC0C1;&#xD0DC;&#xAC12;&#xC744; &#xB098;&#xD0C0;&#xB0C5;&#xB2C8;&#xB2E4;.</li>
          <li>IDLE, PLAYING, PAUSED, STOPPED, FINISHED, BUFFER_UNDERRUN</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li>&#xD604;&#xC7AC; &#xC7AC;&#xC0DD; &#xC911;&#xC778; &#xACE1;&#xC758; token
            &#xAC12;&#xC785;&#xB2C8;&#xB2E4;.</li>
          <li>AudioPlayer.Play Directive &#xC804;&#xC1A1; &#xC2DC; &#xC2A4;&#xD2B8;&#xB9AC;&#xBC0D;
            URL&#xACFC; &#xD568;&#xAED8; &#xC804;&#xC1A1;&#xB418;&#xB294; token &#xAC12;</li>
          <li>&#xC7AC;&#xC0DD; &#xC911;&#xC778; &#xACE1;&#xC774; &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
            token&#xC774; &#xC874;&#xC7AC;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">offsetInMilliseconds</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>&#xD604;&#xC7AC; &#xC7AC;&#xC0DD; &#xC911;&#xC778; &#xC704;&#xCE58; (msec)&#xB97C;
            &#xB098;&#xD0C0;&#xB0C5;&#xB2C8;&#xB2E4;.</li>
          <li>&#xC7AC;&#xC0DD; &#xC911;&#xC778; &#xACE1;&#xC774; &#xC5C6;&#xC744; &#xACBD;&#xC6B0;
            &#xAE30;&#xBCF8; &#xAC12;&#xC740; 0</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Response Sample

```javascript
{
    "version": "2.0",
    "resultCode": "OK",
    "output": {
      "datetime": "오늘",
      KEY1: VALUE1,
      KEY2: VALUE2,
      ...
    },
    "directives": [
      {
        "type": "AudioPlayer.Play",
        "audioItem": {     
            "stream": {
                "url": "{{STRING}}",
                "offsetInMilliseconds": {{LONG}},
                "progressReport": {
                    "progressReportDelayInMilliseconds": {{LONG}},
                    "progressReportIntervalInMilliseconds": {{LONG}}
                },
                "token": "{{STRING}}",
                "expectedPreviousToken": "{{STRING}}"
            },
            "metadata": { } // reserved
        }
      }
    ]
}
```

## Response Body

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Type</th>
      <th style="text-align:left">Mandatory</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">version</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Backend proxy API &#xBC84;&#xC804;&#xC744; &#xD45C;&#xC2DC;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">resultCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>&quot;OK&quot; - <b>&#xC131;&#xACF5;&#xC778; &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;&#xD558;&#xB294; &#xAC12;&#xC73C;&#xB85C; &#xB2E4;&#xB978; &#xAC12;&#xC744; &#xC804;&#xC1A1;&#xD558;&#xBA74; &#xC131;&#xACF5;&#xC774; &#xC544;&#xB2CC; &#xAC83;&#xC73C;&#xB85C; &#xCC98;&#xB9AC;&#xD558;&#xAE30; &#xB54C;&#xBB38;&#xC5D0; &#xC8FC;&#xC758;&#xD574;&#xC57C; &#xD569;&#xB2C8;&#xB2E4;.</b>
          </li>
          <li>&#xC131;&#xACF5;&#xC774; &#xC544;&#xB2CC; &#xACBD;&#xC6B0;&#xB294; PlayBuider&#xC758; <code>General</code> &gt; <code>&#xAE30;&#xBCF8;&#xC815;&#xBCF4;</code> &#xD398;&#xC774;&#xC9C0;&#xC758;
            &#xC608;&#xC678; &#xCC98;&#xB9AC; &#xB610;&#xB294; <code>Action</code> &gt; <code>Custom Actions</code> &gt;
            &#xC120;&#xD0DD;&#xD55C; Action&#xC758; &#xC608;&#xC678; &#xCC98;&#xB9AC;&#xC5D0;&#xC11C;
            &#xC124;&#xC815;&#xB41C; Result Code(Exception Code)&#xAC12; &#xC804;&#xC1A1;&#xD569;&#xB2C8;&#xB2E4;.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">output</td>
      <td style="text-align:left">json</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>Request&#xC5D0;&#xC11C; &#xC804;&#xC1A1;&#xD55C; action.parameters&#xC758;
            KEY:VALUE&#xB97C; &#xCC98;&#xB9AC;&#xD55C; &#xACB0;&#xACFC;&#xB97C; &#xC804;&#xC1A1;&#xD569;&#xB2C8;&#xB2E4;.</li>
          <li>Request&#xC758; &#xBAA8;&#xB4E0; KEY:VALUE&#xAC00; &#xB3D9;&#xC77C;&#xD558;&#xAC8C;
            &#xB098;&#xC640;&#xC57C; &#xD569;&#xB2C8;&#xB2E4;.</li>
          <li>VALUE&#xB294; Request&#xC758; &#xAC12;&#xACFC; &#xAC19;&#xAC70;&#xB098;
            &#xB2E4;&#xB97C; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</li>
          <li>&#xBCC0;&#xACBD;&#xB418;&#xC9C0; &#xC54A;&#xC740; VALUE&#xB4E4;&#xC740;
            Request&#xC758; &#xAC12;&#xC744; &#xADF8;&#xB300;&#xB85C; &#xC368;&#xC8FC;&#xC5B4;&#xC57C;
            &#xD569;&#xB2C8;&#xB2E4;.</li>
          <li>KEY - Request&#xC758; action.parameters&#xC5D0; &#xC815;&#xC758;&#xB41C;
            KEY</li>
          <li>VALUE - backend proxy&#xC5D0;&#xC11C; &#xCC98;&#xB9AC;&#xD55C; &#xACB0;&#xACFC;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">directives</td>
      <td style="text-align:left">json</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li>&#xD2B9;&#xC815; Capability Interface&#xB97C; &#xC9C0;&#xC6D0;&#xD558;&#xB294;
            Play&#xC5D0;&#xC11C; Directive&#xB97C; &#xC804;&#xC1A1;&#xD558;&#xB294;
            &#xACBD;&#xC6B0;&#xC5D0; &#xC774; &#xD544;&#xB4DC;&#xB97C; &#xD1B5;&#xD574;
            &#xC804;&#xC1A1;&#xD569;&#xB2C8;&#xB2E4;.</li>
          <li>&#xAC01; Capability Interface&#xC758; Directive &#xD3EC;&#xB9F7;&#xC740;
            &#xD574;&#xB2F9; Capability Interface &#xADDC;&#xACA9;&#xC744; &#xCC38;&#xC870;&#xD569;&#xB2C8;&#xB2E4;.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

## Health check

서비스 정상 여부를 확인하기 위해 다음의 /health url을 다음과 같이 구현해야 합니다. NUGU developers에서는 이 URL을 주기적으로 요청해서 서버의 정상 여부를 판단합니다. 정상적으로 서비스가 가능하면 HTTP Status code를 "200 OK"로 리턴합니다. \(결과 텍스트는 OK 등 아무 문자나 리턴해도 됩니다.\)

만약 서비스에 문제가 있을 경우에는 "500 Internal Server Error" 등 200 이외의 HTTP Status Code를 리턴하면 됩니다.

```bash
GET /health HTTP/1.1
Accept: */*


HTTP/1.1 200 OK
Content-Length: 2
OK
```

{% hint style="danger" %}
심사 요청 시 /health url이 정상 동작해야 하며, /health url에서 200 이외의 상태가 오래 지속되면 서비스가 직권 중지될 수 있으므로 유의해야 합니다.
{% endhint %}

