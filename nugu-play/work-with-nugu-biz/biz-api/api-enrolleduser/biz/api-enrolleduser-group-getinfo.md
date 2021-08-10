# Biz 사용자 그룹 상세 조회

Biz 사용자 그룹 정보를 상세 확인 할 수 있는 기능입니다.

## 1. URL <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-1.URL"></a>

```text
[GET] https://biz-api.sktnugu.com/api/v1/enrolledUser/group/{groupId}
```

## 2. Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-2.Request"></a>

| 이름 | 유형 | 필수 | 설명 |
| :--- | :--- | :--- | :--- |
| Publisher-Token | Header | Y | 퍼블리셔가 보유한 토큰 |
| groupId | path | Y | 그룹 ID or unmappedUser\(그룹에 속하지 않은 사용자\) |

## 3. Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.Response"></a>

### 3.1 Http Status <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.1HttpStatus"></a>

| HTTP Status | 설명 |
| :--- | :--- |
| 200 | 정상 응답 |
| 403 | 퍼블리셔 API Token이 유효하지 않을 경우의 응답 |
| 404 | 대상 그룹을 찾을 수 없을 때 응답 |
|  |  |

### 3.2 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.2Body"></a>

```text
{
    "id": "XXX",
    "name": "XXX",
    "token": "XXX",
    "alias": "XXX",
    "playServiceIds": ["aaa.bbb.ccc", "a1.b1.c1"],
    "users": [
        {
            "id": "XXX",
            "name": "XXX",
            "email": "XXX",
            "phone": "XXX",
            "alias": "XXX",
            "serviceType": "SERVICE",
            "apiAgreeType": "ALL",
            "authType": "ALL",
            "acceptedDateTime": "2021-0804T16:34:30.388"
        }
    ]
}
```

### 3.3 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xADF8;&#xB8F9;&#xC0C1;&#xC138;&#xC870;&#xD68C;v1-3.3&#xC124;&#xBA85;"></a>

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
      <td style="text-align:left">
        <p>&#xADF8;&#xB8F9; ID</p>
        <p>unmappedUser&#xC77C; &#xACBD;&#xC6B0; null</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>&#xADF8;&#xB8F9; &#xC774;&#xB984;</p>
        <p>unmappedUser&#xC77C; &#xACBD;&#xC6B0; null</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>&#xADF8;&#xB8F9; API &#xD1A0;&#xD070;</p>
        <p>unmappedUser&#xC77C; &#xACBD;&#xC6B0; null</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">alias</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>&#xADF8;&#xB8F9; &#xBD80;&#xAC00; &#xC815;&#xBCF4;</p>
        <p>unmappedUser&#xC77C; &#xACBD;&#xC6B0; null</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceIds</td>
      <td style="text-align:left">array of string</td>
      <td style="text-align:left">
        <p>&#xADF8;&#xB8F9;&#xC5D0; &#xC18D;&#xD55C; private play service id &#xBAA9;&#xB85D;</p>
        <p>unmappedUser&#xC77C; &#xACBD;&#xC6B0; []</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">users</td>
      <td style="text-align:left">array of object</td>
      <td style="text-align:left">&#xADF8;&#xB8F9;&#xC5D0; &#xC18D;&#xD55C; &#xC0AC;&#xC6A9;&#xC790; &#xBAA9;&#xB85D;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].id</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; ID</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; &#xC774;&#xB984;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].email</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; &#xC774;&#xBA54;&#xC77C;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].alias</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; &#xCD94;&#xAC00; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].serviceType</td>
      <td style="text-align:left">enum</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; &#xCD08;&#xB300; &#xC720;&#xD615;
        <br />SERVICE ; &#xC11C;&#xBE44;&#xC2A4;
        <br />PLAY : play</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].apiAgreeType</td>
      <td style="text-align:left">enum</td>
      <td style="text-align:left">Biz API &#xC218;&#xC2E0; &#xB3D9;&#xC758; &#xC720;&#xD615;
        <br />ALL : &#xB3D9;&#xC758;
        <br />SOME : &#xC77C;&#xBD80; &#xB3D9;&#xC758;
        <br />NONE : &#xBBF8;&#xB3D9;&#xC758;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].authType</td>
      <td style="text-align:left">enum</td>
      <td style="text-align:left">&#xC81C;&#xD734;&#xC0AC; &#xC778;&#xC99D; &#xC5EC;&#xBD80; &#xC720;&#xD615;
        <br
        />ALL : &#xC778;&#xC99D;
        <br />SOME : &#xC77C;&#xBD80; &#xC778;&#xC99D;
        <br />NONE : &#xBBF8;&#xC778;&#xC99D;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].acceptedDateTime</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xCD08;&#xB300; &#xC2B9;&#xC778;&#xC77C;(ISO-8601)</td>
    </tr>
  </tbody>
</table>

