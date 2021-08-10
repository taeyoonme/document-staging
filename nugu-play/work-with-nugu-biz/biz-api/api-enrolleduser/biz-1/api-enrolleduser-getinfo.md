# Biz 사용자 상세 조회

초대되어 퍼블리셔에 등록된 Biz 사용자 상세정보를 조회하는 기능입니다.

## 1. URL <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-1.URL"></a>

```text
[GET] https://biz-api.nugu.co.kr/api/v1/enrolledUser/user/{userId}
```

## 2. Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-2.Request"></a>

| 이름 | 유형 | 필수 | 설명 |
| :--- | :--- | :--- | :--- |
| Publisher-Token | Header | Y | 퍼블리셔가 보유한 토큰 |
| userId | path | Y | Biz 사용자 ID |

## 3. Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.Response"></a>

### 3.1 Http Status <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.1HttpStatus"></a>

| HTTP Status | 설명 |
| :--- | :--- |
| 200 | 정상 응답 |
| 403 | 퍼블리셔 API Token이 유효하지 않을 경우의 응답 |
| 404 | 대상 Biz 사용자를 찾을 수 없을 때 응답 |
|  |  |

### 3.2 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.2Body"></a>

```text
{
    "id": "XXX",
    "name": "XXX",
    "token": "XXX",
    "email": "XXX",
    "alias": "XXX",
    "phone": "XXX",
    "group": {
        "id": "XXX"
        "name": "XXX"
    },
    "serviceType": "SERVICE",
    "serviceAgreeYn": "Y",
    "serviceApiAgreeYn": "Y",
    "serviceApiAllowedDeviceCount": 3,
    "serviceAcceptedDateTime": "2021-0804T16:34:30.388",
    "plays": [
        {
            "playServiceId": "a.b.c",
            "token": "XXX",
            "agreeYn": "Y"
            "apiAgreeYn": "Y",
            "apiAllowedDeviceCount": 3,
            "acceptedDateTime": "2021-0804T16:34:30.388",
        }
    ]
}
```

### 3.3 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.3&#xC124;&#xBA85;"></a>

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xC774;&#xB984;</th>
      <th style="text-align:left">&#xC18D;&#xC131;</th>
      <th style="text-align:left">&#xC124;&#xBA85;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">&#xC774;&#xB984;</td>
      <td style="text-align:left">&#xC18D;&#xC131;</td>
      <td style="text-align:left">&#xC124;&#xBA85;</td>
    </tr>
    <tr>
      <td style="text-align:left">id</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Biz &#xC0AC;&#xC6A9;&#xC790; ID</td>
    </tr>
    <tr>
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Biz &#xC0AC;&#xC6A9;&#xC790; &#xC774;&#xB984;</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>Biz &#xC0AC;&#xC6A9;&#xC790; &#xD1A0;&#xD070;</p>
        <p>&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; PLAY&#xC77C;
          &#xACBD;&#xC6B0; null</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">email</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Biz &#xC0AC;&#xC6A9;&#xC790; &#xC774;&#xBA54;&#xC77C;</td>
    </tr>
    <tr>
      <td style="text-align:left">alias</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Biz &#xC0AC;&#xC6A9;&#xC790; &#xBD80;&#xAC00; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">phone</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Biz &#xC0AC;&#xC6A9;&#xC790; &#xD578;&#xB4DC;&#xD3F0; &#xBC88;&#xD638;(-&#xC81C;&#xC678;)</td>
    </tr>
    <tr>
      <td style="text-align:left">group</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">&#xC18D;&#xD55C; &#xADF8;&#xB8F9; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">group.id</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xADF8;&#xB8F9; ID</td>
    </tr>
    <tr>
      <td style="text-align:left">group.name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xADF8;&#xB8F9;&#xBA85;</td>
    </tr>
    <tr>
      <td style="text-align:left">serviceType</td>
      <td style="text-align:left">enum</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;
        <br />SERVICE ; &#xC11C;&#xBE44;&#xC2A4;
        <br />PLAY : play</td>
    </tr>
    <tr>
      <td style="text-align:left">serviceAgreeYn</td>
      <td style="text-align:left">Y/N</td>
      <td style="text-align:left">
        <p>&#xC11C;&#xBE44;&#xC2A4; &#xC774;&#xC6A9;&#xB3D9;&#xC758; &#xC5EC;&#xBD80;</p>
        <p>&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; PLAY&#xC77C;
          &#xACBD;&#xC6B0; N</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">serviceApiAgreeYn</td>
      <td style="text-align:left">Y/N</td>
      <td style="text-align:left">
        <p>&#xC11C;&#xBE44;&#xC2A4; API &#xC218;&#xC2E0;&#xB3D9;&#xC758; &#xC5EC;&#xBD80;</p>
        <p>&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; PLAY&#xC77C;
          &#xACBD;&#xC6B0; N</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">serviceApiAllowedDeviceCount</td>
      <td style="text-align:left">int</td>
      <td style="text-align:left">
        <p>&#xC11C;&#xBE44;&#xC2A4; API &#xC218;&#xC2E0; &#xD5C8;&#xC6A9; &#xAE30;&#xAE30;
          &#xC218;</p>
        <p>&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; PLAY&#xC77C;
          &#xACBD;&#xC6B0; 0</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">serviceAcceptedDateTime</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xCD08;&#xB300; &#xC2B9;&#xC778;&#xC77C;(ISO-8601)</td>
    </tr>
    <tr>
      <td style="text-align:left">plays</td>
      <td style="text-align:left">array of object</td>
      <td style="text-align:left">&#xC2B9;&#xC778;&#xB41C; private play &#xBAA9;&#xB85D;</td>
    </tr>
    <tr>
      <td style="text-align:left">plays[].playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">play service id</td>
    </tr>
    <tr>
      <td style="text-align:left">plays[].token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">play&#xBCC4; &#xD1A0;&#xD070;
        <br />&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; SERVICE&#xC77C;
        &#xACBD;&#xC6B0; token</td>
    </tr>
    <tr>
      <td style="text-align:left">plays[].agreeYn</td>
      <td style="text-align:left">Y/N</td>
      <td style="text-align:left">
        <p>play&#xBCC4; &#xC774;&#xC6A9;&#xB3D9;&#xC758; &#xC5EC;&#xBD80;</p>
        <p>&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; SERVICE&#xC77C;
          &#xACBD;&#xC6B0; Y</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">plays[].apiAgreeYn</td>
      <td style="text-align:left">Y/N</td>
      <td style="text-align:left">play&#xBCC4; API &#xC218;&#xC2E0; &#xB3D9;&#xC758; &#xC5EC;&#xBD80;
        <br
        />&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; SERVICE&#xC77C;
        &#xACBD;&#xC6B0; Y</td>
    </tr>
    <tr>
      <td style="text-align:left">plays[].apiAllowedDeviceCount</td>
      <td style="text-align:left">int</td>
      <td style="text-align:left">play&#xBCC4; API &#xC218;&#xC2E0; &#xD5C8;&#xC6A9; &#xAE30;&#xAE30; &#xC218;
        <br
        />&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; SERVICE&#xC77C;
        &#xACBD;&#xC6B0; serviceApiAllowedDeviceCount</td>
    </tr>
    <tr>
      <td style="text-align:left">plays[].acceptedDateTime</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">play&#xBCC4; &#xCD08;&#xB300; &#xC2B9;&#xC778;&#xC77C;(ISO-8601)
        <br />&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;&#xC774; SERVICE&#xC77C;
        &#xACBD;&#xC6B0; serviceAcceptedDateTime</td>
    </tr>
  </tbody>
</table>

