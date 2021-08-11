# Biz 사용자 초대

Biz 사용자를 등록하기 위해, 초대 메일을 발송하는 기능입니다. 

* Biz Service 초대장 발송 시에는, Biz Kit 기본 정보 필수값이 미리 입력되어 있어야 합니다. [Biz Kit 기본 정보 입력](../../../manage-enrolled-user/enrolled-user-invitation-biz.md) 참

## 1. URL <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-1URL"></a>

```text
[POST] https://biz-api.sktnugu.com/api/v1/enrolledUser/invitation
```

## 2. Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-2Request"></a>

### 2.1 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-2.1Body"></a>

**body**

```text
{
    "reason": "서비스 사용을 위한 초대",
    "targetPlayServiceIds": ["aaa.bbb.ccc", "ddd.eee.fff"],
    "targetGroupId": "XXX",
    "users": [
        {
            "email": "XXX",
            "name": "XXX",
            "phone": "XXX",
            "alias": "XXX"
        }
    ]
}
```

### 2.2 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-2.2&#xC124;&#xBA85;"></a>

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xC774;&#xB984;</th>
      <th style="text-align:left">&#xC720;&#xD615;</th>
      <th style="text-align:left">&#xC18D;&#xC131;</th>
      <th style="text-align:left">&#xAE38;&#xC774;</th>
      <th style="text-align:left">&#xD544;&#xC218;</th>
      <th style="text-align:left">&#xC124;&#xBA85;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">Publisher-Token</td>
      <td style="text-align:left">Header</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD37C;&#xBE14;&#xB9AC;&#xC154;&#xAC00; &#xBCF4;&#xC720;&#xD55C; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">reason</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">400</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xCD08;&#xB300; &#xC0AC;&#xC720;</td>
    </tr>
    <tr>
      <td style="text-align:left">targetPlayServiceIds</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">array of string</td>
      <td style="text-align:left">&#xAC01;&#xAC01; 100</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xCD08;&#xB300; &#xB300;&#xC0C1; play&#xC758; playServiceId
        <br />targetGroupId &#xACFC; &#xC911;&#xBCF5;&#xD574;&#xC11C; &#xC694;&#xCCAD;&#xD560;
        &#xC218; &#xC5C6;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">targetGroupId</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">100</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xCD08;&#xB300; &#xB300;&#xC0C1; &#xADF8;&#xB8F9; ID</p>
        <p>targetPlayServiceIds &#xACFC; &#xC911;&#xBCF5;&#xD574;&#xC11C; &#xC694;&#xCCAD;&#xD560;
          &#xC218; &#xC5C6;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">users</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">array of object</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].email</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">350</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC774;&#xBA54;&#xC77C;</p>
        <p>&#xB9CC;&#xC77C; &#xCD08;&#xB300;&#xB41C; &#xB9AC;&#xC2A4;&#xD2B8;&#xC5D0;
          &#xB3D9;&#xC77C;&#xD55C; &#xC774;&#xBA54;&#xC77C;&#xC774; &#xC874;&#xC7AC;&#xD560;
          &#xACBD;&#xC6B0; &#xC7AC;&#xCD08;&#xB300;&#xAC00; &#xC774;&#xB904;&#xC9C0;&#xBA70;,
          name, alias&#xAC00; &#xAC31;&#xC2E0;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">users[].name</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">100</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC774;&#xB984;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].phone</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">12</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC804;&#xD654;&#xBC88;&#xD638;</td>
    </tr>
    <tr>
      <td style="text-align:left">users[].alias</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">100</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xCD08;&#xB300;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC758; Alias</td>
    </tr>
  </tbody>
</table>

## 3. Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-3Response"></a>

### 3.1 HTTP Status <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-3.1HTTPStatus"></a>

| HTTP Status | errorCode | 설명 |
| :--- | :--- | :--- |
| 201 |  | 정상 초대 |
| 403 |  | 퍼블리셔 API Token이 유효하지 않거나, 유효하지 않은 자원에 접근할 경우 리턴 |
| 400 | PUB001 | Biz Kit 기본 필수정보 없는 상태 |
| 400 | PLAY001 | 요청한 play의 playServiceId가 없거나 잘못된 경우 |
| 400 | PLAY002 | 요청한 play가 서비스중이 아닌 경우 |
| 400 | PLAY003 | 퍼블리셔의 소유가 아닌 play를 요청한 경우 |
| 400 | GROUP001 | 그룹이 존재하지 않거나, 퍼블리셔의 소유가 아닌 경우 |
| 400 | GROUP004 | targetPlayServiceIds, targetGroupId 중복 요청하는 경우 ![\(star\)](https://tde.sktelecom.com/wiki/s/ko_KR/8100/b0984b7297905b7c7bd946458f753ce0130bfc8c/_/images/icons/emoticons/star_yellow.svg) |
| 400 | GROUP005 | 그룹에 Private Play 설정 없이 초대하는 경우 ![\(star\)](https://tde.sktelecom.com/wiki/s/ko_KR/8100/b0984b7297905b7c7bd946458f753ce0130bfc8c/_/images/icons/emoticons/star_yellow.svg) |
| 400 | USER001 | Biz사용자 초대/수정시 email이 없거나 사이즈를 초과한 경우 |
| 400 | USER002 | Biz사용자 초대/수정시 name이 없거나 사이즈를 초과한 경우 |
| 400 | USER003 | Biz사용자 초대/수정시 alias의사이즈를 초과한 경우 |
| 400 | USER005 | Biz사용자 초대/수정시 phone 정보가 불 충분할 경우 ![\(star\)](https://tde.sktelecom.com/wiki/s/ko_KR/8100/b0984b7297905b7c7bd946458f753ce0130bfc8c/_/images/icons/emoticons/star_yellow.svg) |
| 400 | USER006 | Biz사용자 초대/수정시 초대 사유\(reason\) 정보가 불 충분할 경우 ![\(star\)](https://tde.sktelecom.com/wiki/s/ko_KR/8100/b0984b7297905b7c7bd946458f753ce0130bfc8c/_/images/icons/emoticons/star_yellow.svg) |
| 400 | USER007 | 체험판 회원의 경우 허용 사용자를 초과하는 경우  ![\(star\)](https://tde.sktelecom.com/wiki/s/ko_KR/8100/b0984b7297905b7c7bd946458f753ce0130bfc8c/_/images/icons/emoticons/star_yellow.svg) |

### 3.2 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-3.2Body"></a>

```text
{
    "id": 333
}
```

### 3.3 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xCD08;&#xB300;v1-3.3&#xC124;&#xBA85;"></a>

| 이름 | 속성 | 설명 |
| :--- | :--- | :--- |
| id | int | 생성한 초대에 대한 식별자 |

