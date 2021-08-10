# Biz 사용자 초대 목록 조회

현재 진행중인 초대 건의 목록을 제공합니다.

## 1. URL <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;&#xBAA9;&#xB85D;&#xC870;&#xD68C;v1-1.URL"></a>

```text
[GET] https://biz-api.nugu.co.kr/api/v1/invitation
```

## 2. Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;&#xBAA9;&#xB85D;&#xC870;&#xD68C;v1-2.Request"></a>

| 이름 | 유형 | 속성 | 필수 | 설명 |
| :--- | :--- | :--- | :--- | :--- |
| Publisher-Token | Header | string | Y | 퍼블리셔가 보유한 토큰 |

## 3. Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;&#xBAA9;&#xB85D;&#xC870;&#xD68C;v1-3.Response"></a>

### 3.1 HTTP Status <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;&#xBAA9;&#xB85D;&#xC870;&#xD68C;v1-3.1HTTPStatus"></a>

| HTTP Status | 설명 |
| :--- | :--- |
| 200 | 조회/수정시 정상적인 응답 |
| 403 | 퍼블리셔 API Token이 유효하지 않을 경우의 응답 |
|  |  |

### 3.2 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;&#xBAA9;&#xB85D;&#xC870;&#xD68C;v1-3.2Body"></a>

```text
{
    "invitations": [
        {
            "id": 333,
            "cause": "서비스 사용을 위한 초대",
            "createdDate": "2017-11-06T06:00:00.000Z",
            "targetPlayServiceIds": ["aaa.bbb.ccc", "ddd.eee.fff"],
            "targetGroupId": "XXX",
            "users": [
                {
                    "email": "XXX",
                    "name": "XXX"
                    "alias": "XXX",
                    "status": "ENABLE"
                }
            ]
        }
    ]
}
```

### 3.3 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;&#xBAA9;&#xB85D;&#xC870;&#xD68C;v1-3.3&#xC124;&#xBA85;"></a>

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
      <td style="text-align:left">invitations</td>
      <td style="text-align:left">array of object</td>
      <td style="text-align:left">&#xD604;&#xC7AC; &#xC9C4;&#xD589;&#xC911;&#xC778; &#xCD08;&#xB300; &#xBAA9;&#xB85D;</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].id</td>
      <td style="text-align:left">int</td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xC5D0; &#xB300;&#xD55C; &#xC2DD;&#xBCC4;&#xC790;</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].cause</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xCD08;&#xB300; &#xC0AC;&#xC720;</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].createdDate</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">ISO8601</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].targetPlayServiceIds</td>
      <td style="text-align:left">array of string</td>
      <td style="text-align:left">&#xCD08;&#xB300; &#xB300;&#xC0C1; play&#xC758; playServiceId
        <br />targetGroupApiToken &#xACFC; &#xC911;&#xBCF5;&#xD574;&#xC11C; &#xC694;&#xCCAD;&#xD560;
        &#xC218; &#xC5C6;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].targetGroupApiToken</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>&#xCD08;&#xB300; &#xB300;&#xC0C1; &#xADF8;&#xB8F9;</p>
        <p>targetPlayServiceIds &#xACFC; &#xC911;&#xBCF5;&#xD574;&#xC11C; &#xC694;&#xCCAD;&#xD560;
          &#xC218; &#xC5C6;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].users</td>
      <td style="text-align:left">array of object</td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].users[].email</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC774;&#xBA54;&#xC77C;</p>
        <p>&#xD37C;&#xBE14;&#xB9AC;&#xC154;&#xB0B4; &#xB3D9;&#xC77C;&#xD55C; &#xC774;&#xBA54;&#xC77C;&#xC744;
          &#xCD08;&#xB300;&#xBC1B;&#xC740; &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC788;&#xC744;
          &#xC218; &#xC5C6;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].users[].name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC774;&#xB984;</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].users[].token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; API &#xD1A0;&#xD070;</p>
        <p>&#xC2E0;&#xADDC; &#xCD08;&#xB300;&#xC2DC; &#xC874;&#xC7AC;&#xD558;&#xC9C0;
          &#xC54A;&#xB294;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].users[].alias</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; Alias</td>
    </tr>
    <tr>
      <td style="text-align:left">invitations[].users[].status</td>
      <td style="text-align:left">enum</td>
      <td style="text-align:left">
        <p>ENABLE, DISABLE</p>
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xC5D0; &#xB300;&#xD55C; &#xCD08;&#xB300;&#xC7A5;
          &#xC720;&#xD6A8; &#xC5EC;&#xBD80;</p>
      </td>
    </tr>
  </tbody>
</table>

