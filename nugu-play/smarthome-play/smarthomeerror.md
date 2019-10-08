# SmartHomeError

NUGU스마트홈에서 지원하고 있는 Error와 Exception에 대한 내용입니다. ServiceProvider는 SmartHomeBackendProxy 구현 시 아래 리스트를 참조하여 SmartHomeDevice 제어 및 상태 조회 시 발생하는 오류 혹은 예외상황에 맞는 error code를 응답해야 합니다.

## Error Response Format

SmartHome의 Error는 SmartHomeBackendProxy에서 모든 처리가 불가한 Global-level error와 SmartHomeDevice 제어 시에 발생하는 다양한 원인의 Error인 Device-level error로 구분됩니다. 아래 Global-level error와 Device-level error의 예시 format을 참조해주세요.

### Global-level error

```scheme
Service Provider에 공통 exception으로 처리하고자 하는 경우 사용합니다.

예1)

{
  "requestId": "2019071712638a4378649347bdb21643127a0f6d83",
  "error": {
    "code": 401, // HTTP status code
    "message": "invalid token"
  }
}

예2)



{
  "requestId": "2019071712638a4378649347bdb21643127a0f6d83",
  "error": {
    "code": 429, // HTTP status code
    "message": "Too many requests, 요청 한도를 넘었니다."
  }
}

예3)

{
  "requestId": "2019071712638a4378649347bdb21643127a0f6d83",
  "error": {
    "code": 503, // HTTP status code
    "message": "Service Unavailable, 소프트웨어 업데이트 중입니다."
  }
}
```

### Device-level error

```scheme
{  
    "requestId": "2019071712638a4378649347bdb21643127a0f6d83",
    "data": [
        {
            "resultCode": "NotSupportBrightnessControl",
            "smartHomeDevice": {
                ...
            },
            "errorProperties": { }
        },
        {
            "resultCode": "OK",
            "smartHomeDevice": {
                ...
            },
            "properties": { }
        }
    }
}
```

## Error List

Device-level error 발생 시에는 error 원인에 맞는 error code를 응답해야 합니다. 이 때 error code에 따라 함께 응답해야 하는 부가정보\(error property\)가 있는 경우도 있습니다. 아래 NUGU 스마트홈을 통해 제공할 수 있는 error case별 code와 error property를 참조하시기 바랍니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Error code</th>
      <th style="text-align:left">Error property</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">NotExistDeviceInSmartHomeBackendProxy</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC81C;&#xC5B4; &#xB300;&#xC0C1; SmartHomeDevice&#xAC00; SmartHomdeBackendProxy&#xC5D0;
        &#xC874;&#xC7AC;&#xD558;&#xC9C0; &#xC54A;&#xB294; &#xACBD;&#xC6B0;&#xC5D0;
        &#xB300;&#xD55C; &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;. NUGU &#xC571;&#xC744;
        &#xD1B5;&#xD574; &#xB4F1;&#xB85D;&#xD55C; &#xC774;&#xD6C4; &#xC6D0;&#xB798;
        IoT Service&#xC5D0;&#xC11C; &#xC0AD;&#xC81C;&#xD55C; &#xACBD;&#xC6B0;&#xC5D0;
        &#xBC1C;&#xC0DD;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NoConnectionDevice</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD574;&#xB2F9; SmartHomeDevice&#xC758; &#xB124;&#xD2B8;&#xC6CC;&#xD06C;
        &#xC5F0;&#xACB0; &#xC2E4;&#xD328;&#xC5D0; &#xB300;&#xD55C; &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">DeviceTurnedOff</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC758; &#xC804;&#xC6D0;&#xC774; &#xAEBC;&#xC838; &#xC788;&#xC5B4;
        &#xC81C;&#xC5B4;&#xAC00; &#xBD88;&#xAC00;&#xD55C; &#xC0C1;&#xD0DC;&#xC778;
        &#xACBD;&#xC6B0;&#xC758; &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;. &#xD574;&#xB2F9;
        &#xC81C;&#xC5B4; &#xBA85;&#xB839;&#xC774; &#xC804;&#xC6D0;&#xC744; &#xCF24;
        &#xACBD;&#xC6B0; &#xC218;&#xD589;&#xD560; &#xC218; &#xC788;&#xB2E4;&#xBA74;
        &#xC774; &#xC5D0;&#xB7EC;&#xB85C; &#xC751;&#xB2F5;&#xD574;&#xC57C; &#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyTurnOn</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8; &#xCF1C;&#xC838;
        &#xC788;&#xB294;&#xB370; &#xCF1C;&#xB2EC;&#xB77C;&#xB294; &#xC81C;&#xC5B4;
        &#xC694;&#xCCAD;&#xC744; &#xBC1B;&#xC740; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.
        PowerControl Capability, TurnOn Directive&#xC758; &#xC81C;&#xC5B4; &#xBA85;&#xB839;
        &#xC2DC; &#xBC1C;&#xC0DD; &#xAC00;&#xB2A5;&#xD55C; &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyTurnOff</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8; &#xAEBC;&#xC838;
        &#xC788;&#xB294;&#xB370; &#xAEBC;&#xB2EC;&#xB77C;&#xB294; &#xC81C;&#xC5B4;
        &#xC694;&#xCCAD;&#xC744; &#xBC1B;&#xC740; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.
        PowerControl Capability, TurnOff Directive&#xC758; &#xC81C;&#xC5B4; &#xBA85;&#xB839;
        &#xC2DC; &#xBC1C;&#xC0DD; &#xAC00;&#xB2A5; &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">TemperatureOutofRange</td>
      <td style="text-align:left">
        <p>minTemperature</p>
        <p>maxTemperature</p>
      </td>
      <td style="text-align:left">SmartHomeDevice&#xC5D0; &#xC124;&#xC815;&#xD558;&#xACE0;&#xC790; &#xD558;&#xB294;
        &#xC628;&#xB3C4;&#xAC00; &#xD574;&#xB2F9; SmartHomeDevice&#xC758; &#xC81C;&#xC5B4;
        &#xBC94;&#xC704; &#xBC16;&#xC77C; &#xACBD;&#xC6B0;&#xC5D0; &#xB300;&#xD55C;
        &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;. &#xC81C;&#xC5B4; &#xAC00;&#xB2A5;&#xD55C;
        &#xCD5C;&#xC18C;/&#xCD5C;&#xB300; &#xC628;&#xB3C4; &#xC124;&#xC815; &#xBC94;&#xC704;&#xB97C;
        &#xD568;&#xAED8; &#xC751;&#xB2F5;&#xD574;&#xC57C; &#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyAtMaxTemp</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC758; &#xC124;&#xC815; &#xC628;&#xB3C4;&#xB97C; &#xC62C;&#xB9AC;&#xB824;&#xACE0;
        &#xD588;&#xC744; &#xB54C; &#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8;
        &#xCD5C;&#xACE0; &#xC628;&#xB3C4;&#xB85C; &#xC124;&#xC815;&#xB418;&#xC5B4;
        &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyAtMinTemp</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC758; &#xC124;&#xC815; &#xC628;&#xB3C4;&#xB97C; &#xB0B4;&#xB9AC;&#xB824;&#xACE0;
        &#xD588;&#xC744; &#xB54C; &#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8;
        &#xCD5C;&#xC800; &#xC628;&#xB3C4;&#xB85C; &#xC124;&#xC815;&#xB418;&#xC5B4;
        &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NotAvailableSetAirflow</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xD48D;&#xB7C9; &#xC870;&#xC808;
        &#xBD88;&#xAC00;&#xD55C; &#xBAA8;&#xB378;&#xC77C; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.
        &#xB3D9;&#xC77C;&#xD55C; SmartHomeDeviceType &#xC911; &#xD48D;&#xB7C9;
        &#xC81C;&#xC5B4;&#xAC00; &#xAC00;&#xB2A5;&#xD55C; &#xBAA8;&#xB378;&#xACFC;
        &#xAC00;&#xB2A5;&#xD558;&#xC9C0; &#xC54A;&#xC740; &#xBAA8;&#xB378;&#xC744;
        &#xD568;&#xAED8; &#xC81C;&#xACF5;&#xD558;&#xB294; IoT ServiceProvider&#xC77C;
        &#xACBD;&#xC6B0; &#xD574;&#xB2F9; &#xC751;&#xB2F5;&#xC744; &#xC0AC;&#xC6A9;&#xD560;
        &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">UnsupportedAirflow</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC9C0;&#xC6D0;&#xD558;&#xC9C0;
        &#xC54A;&#xB294; &#xD48D;&#xB7C9;&#xC5D0; &#xB300;&#xD574; &#xC81C;&#xC5B4;
        &#xBC1C;&#xD654;&#xAC00; &#xC778;&#xC785;&#xB418;&#xC5C8;&#xC744; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyAtMaxAirflow</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC758; &#xC124;&#xC815; &#xD48D;&#xB7C9;&#xC744; &#xC62C;&#xB9AC;&#xB824;&#xACE0;
        &#xD588;&#xC744; &#xB54C; &#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8;
        &#xCD5C;&#xACE0; &#xD48D;&#xB7C9;&#xC73C;&#xB85C; &#xC124;&#xC815;&#xB418;&#xC5B4;
        &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyAtMinAirflow</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC758; &#xC124;&#xC815; &#xD48D;&#xB7C9;&#xC744; &#xB0B4;&#xB9AC;&#xB824;&#xACE0;
        &#xD588;&#xC744; &#xB54C; &#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8;
        &#xCD5C;&#xC800; &#xD48D;&#xB7C9;&#xC73C;&#xB85C; &#xC124;&#xC815;&#xB418;&#xC5B4;
        &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">UnsupportedMode</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC9C0;&#xC6D0;&#xD558;&#xC9C0;
        &#xC54A;&#xB294; &#xBAA8;&#xB4DC;&#xC5D0; &#xB300;&#xD574; &#xC81C;&#xC5B4;
        &#xBC1C;&#xD654;&#xAC00; &#xC778;&#xC785;&#xB418;&#xC5C8;&#xC744; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NotInAvailableMode</td>
      <td style="text-align:left">mode</td>
      <td style="text-align:left">SmartHomeDevice&#xAC00; &#xCDE8;&#xC18C;&#xD560; &#xC218; &#xC5C6;&#xB294;
        &#xBAA8;&#xB4DC;&#xB97C; &#xCDE8;&#xC18C;&#xC694;&#xCCAD;&#xD55C; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.
        &#xC5B4;&#xB5A4; SmartHomeDevice&#xC640; &#xD2B9;&#xC815; &#xBAA8;&#xB378;&#xB4E4;&#xC740;
        &#xB2E4;&#xB978; &#xBAA8;&#xB4DC;&#xB97C; &#xC124;&#xC815;&#xD574;&#xC57C;&#xB9CC;
        &#xD604;&#xC7AC; &#xBAA8;&#xB4DC;&#xB97C; &#xD574;&#xC81C;&#xD560; &#xC218;
        &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xAC00; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.
        &#xC774; &#xC5D0;&#xB7EC;&#xB294; &#xADF8;&#xB7F0; &#xBAA8;&#xB4DC;&#xB97C;
        &#xAC16;&#xB294; SmartHomeDevice&#xC5D0; &#xB300;&#xD574; &#xBAA8;&#xB4DC;
        &#xCDE8;&#xC18C; &#xC81C;&#xC5B4;&#xAC00; &#xC778;&#xC785;&#xB420; &#xACBD;&#xC6B0;&#xB97C;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">SetTimeOutofRange</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC5D0; &#xC885;&#xB8CC;&#xC608;&#xC57D; &#xBC1C;&#xD654;&#xC2DC;&#xAC04;&#xC774;
        &#xD574;&#xB2F9; &#xAE30;&#xAE30;&#xC758; &#xC9C0;&#xC6D0;&#xBC94;&#xC704;
        &#xBC16;&#xC77C; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NotExistSetEndTime</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC5D0; &#xC885;&#xB8CC;&#xC608;&#xC57D;&#xCDE8;&#xC18C;
        &#xC694;&#xCCAD;&#xC774; &#xC778;&#xC785;&#xB418;&#xC5C8;&#xC73C;&#xB098;
        &#xD574;&#xB2F9; &#xAE30;&#xAE30;&#xC5D0; &#xC124;&#xC815;&#xB41C; &#xC885;&#xB8CC;&#xC608;&#xC57D;&#xC774;
        &#xC5C6;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">UnsupportedSetEndTime</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC694;&#xCCAD;&#xD55C; &#xC885;&#xB8CC;&#xC608;&#xC57D;&#xC2DC;&#xAC04;&#xC774;
        &#xBBF8;&#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xC2DC;&#xAC04; &#xB2E8;&#xC704;&#xC77C;
        &#xACBD;&#xC6B0;(&#xC2DC;&#xAC04; &#xBD84;&#xB2E8;&#xC704; &#xB4F1;)&#xC785;&#xB2C8;&#xB2E4;.
        &#xC5B4;&#xB5A4; &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30; &#xBC0F;
        &#xBAA8;&#xB378;&#xB4E4;&#xC740; &#xD2B9;&#xC815; &#xC720;&#xD615;&#xC73C;&#xB85C;&#xB9CC;
        &#xC885;&#xB8CC;&#xC608;&#xC57D;&#xC744; &#xC124;&#xC815;&#xD560; &#xC218;
        &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;. &#xC774; &#xC5D0;&#xB7EC;&#xB294; &#xADF8;&#xB7F0;
        &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30; &#xBC0F; &#xBAA8;&#xB378;&#xC744;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyCharging</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xC5D0; &#xCDA9;&#xC804;
        &#xC694;&#xCCAD;&#xC774; &#xC778;&#xC785;&#xB418;&#xC5C8;&#xC73C;&#xB098;
        &#xD574;&#xB2F9; &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xAC00;
        &#xC774;&#xBBF8; &#xCDA9;&#xC804; &#xC911;&#xC778; &#xC0C1;&#xD0DC;&#xC77C;
        &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyStarting</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xC5D0; &#xB3D9;&#xC791;
        &#xBA85;&#xB839;&#xC744; &#xB0B4;&#xB838;&#xC744; &#xACBD;&#xC6B0; &#xD574;&#xB2F9;
        &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xAC00; &#xC774;&#xBBF8;
        &#xB3D9;&#xC791; &#xC0C1;&#xD0DC;&#xC778; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.
        PowerControl Capability&#xC758; TurnOn Directive&#xB97C; &#xB3D9;&#xC791;&#xC73C;&#xB85C;
        &#xC0AC;&#xC6A9;&#xD558;&#xB294; &#xACBD;&#xC6B0;&#xB97C; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyStopped</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xC5D0; &#xB3D9;&#xC791;
        &#xC911;&#xC9C0; &#xBA85;&#xB839;&#xC744; &#xB0B4;&#xB838;&#xC744; &#xACBD;&#xC6B0;
        &#xD574;&#xB2F9; &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xAC00;
        &#xC774;&#xBBF8; &#xC911;&#xC9C0; &#xC0C1;&#xD0DC;&#xC778; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.
        PowerControl Capability&#xC758; TurnOff Directive&#xB97C; &#xB3D9;&#xC791;
        &#xC911;&#xC9C0;&#xB85C; &#xC0AC;&#xC6A9;&#xD558;&#xB294; &#xACBD;&#xC6B0;&#xB97C;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NotExistDailyPowerTarget</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30; &#xBAA9;&#xD45C;&#xC804;&#xB825;&#xC0AC;&#xC6A9;&#xB7C9;
        &#xC870;&#xD68C; &#xC2DC; &#xD574;&#xB2F9; &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;
        &#xAE30;&#xAE30;&#xC5D0; &#xC124;&#xC815;&#xB41C; 1&#xC77C; &#xBAA9;&#xD45C;&#xC804;&#xB825;&#xC0AC;&#xC6A9;&#xB7C9;&#xC774;
        &#xC5C6;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NotSupportBrightnessControl</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xC870;&#xBA85;&#xC774; &#xBC1D;&#xAE30;
        &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xBAA8;&#xB378;&#xC77C; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NotSupportChangeColor</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xC870;&#xBA85;&#xC774; &#xC0C9;&#xC0C1;
        &#xBCC0;&#xACBD; &#xBD88;&#xAC00;&#xD55C; &#xBAA8;&#xB378;&#xC77C; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">UnsupportedColorType</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xC870;&#xBA85;&#xC774; &#xC9C0;&#xC6D0;&#xD558;&#xC9C0;
        &#xC54A;&#xB294; &#xC0C9;&#xC0C1; &#xD0C0;&#xC785;&#xC778; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">HumidityOutofRange</td>
      <td style="text-align:left">
        <p>minHumidity</p>
        <p>maxHumidity</p>
      </td>
      <td style="text-align:left">SmartHomeDevice&#xC5D0; &#xC124;&#xC815;&#xD558;&#xACE0;&#xC790; &#xD558;&#xB294;
        &#xC2B5;&#xB3C4;&#xAC00; &#xD574;&#xB2F9; SmartHomeDevice&#xC758; &#xC81C;&#xC5B4;
        &#xBC94;&#xC704; &#xBC16;&#xC77C; &#xACBD;&#xC6B0;&#xC5D0; &#xB300;&#xD55C;
        &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;. &#xC81C;&#xC5B4; &#xAC00;&#xB2A5;&#xD55C;
        &#xCD5C;&#xC18C;/&#xCD5C;&#xB300; &#xC2B5;&#xB3C4; &#xC124;&#xC815; &#xBC94;&#xC704;&#xB97C;
        &#xD568;&#xAED8; &#xC751;&#xB2F5;&#xD574;&#xC57C; &#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyAtMaxHumidity</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC758; &#xC124;&#xC815; &#xC2B5;&#xB3C4;&#xB97C; &#xC62C;&#xB9AC;&#xB824;&#xACE0;
        &#xD588;&#xC744; &#xB54C; &#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8;
        &#xCD5C;&#xACE0; &#xC2B5;&#xB3C4;&#xB85C; &#xC124;&#xC815;&#xB418;&#xC5B4;
        &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">AlreadyAtMinHumidity</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">SmartHomeDevice&#xC758; &#xC124;&#xC815; &#xC2B5;&#xB3C4;&#xB97C; &#xB0B4;&#xB9AC;&#xB824;&#xACE0;
        &#xD588;&#xC744; &#xB54C; &#xD574;&#xB2F9; SmartHomeDevice&#xAC00; &#xC774;&#xBBF8;
        &#xCD5C;&#xC800; &#xC2B5;&#xB3C4;&#xB85C; &#xC124;&#xC815;&#xB418;&#xC5B4;
        &#xC788;&#xB294; &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NotSupportedInCurrentMode</td>
      <td style="text-align:left">mode</td>
      <td style="text-align:left">&#xD604;&#xC7AC; &#xC124;&#xC815;&#xB41C; &#xBAA8;&#xB4DC;&#xC5D0;&#xC11C;
        &#xC694;&#xCCAD;&#xD55C; &#xAE30;&#xB2A5;&#xC744; &#xC218;&#xD589;&#xD560;
        &#xC218; &#xC5C6;&#xC744; &#xB54C;&#xC5D0; &#xB300;&#xD55C; &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">DeviceInSleepMode</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC81C;&#xC5B4; &#xB300;&#xC0C1;&#xC778; &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;
        &#xAE30;&#xAE30;&#xAC00; &#xC2AC;&#xB7A9;&#xBAA8;&#xB4DC; &#xD639;&#xC740;
        &#xC808;&#xC804; &#xBAA8;&#xB4DC;&#xC5EC;&#xC11C; &#xC81C;&#xC5B4;&#xC5D0;
        &#xC2E4;&#xD328;&#xD55C; &#xACBD;&#xC6B0;&#xC5D0; &#xB300;&#xD55C; &#xC5D0;&#xB7EC;&#xC785;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NoControlAuthority</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">ServiceProvider&#xB85C;&#xBD80;&#xD130; &#xC81C;&#xC5B4;&#xAD8C;&#xC744;
        &#xBC1B;&#xC9C0; &#xBABB;&#xD574; &#xC77C;&#xC2DC;&#xC801;&#xC73C;&#xB85C;
        &#xC74C;&#xC131;&#xC81C;&#xC5B4;&#xAC00; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xACBD;&#xC6B0;&#xC785;&#xB2C8;&#xB2E4;. ServiceProvider&#xBCC4;&#xB85C;
        &#xC81C;&#xC5B4; &#xAC00;&#xB2A5;&#xD55C; &#xC0C1;&#xD0DC;&#xC5D0; &#xB300;&#xD55C;
        &#xAC00;&#xC774;&#xB4DC; &#xC804;&#xB2EC;&#xC774; &#xD544;&#xC694;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
  </tbody>
</table>{% hint style="info" %}
SmartHomeError는 계속해서 업데이트됩니다.
{% endhint %}

