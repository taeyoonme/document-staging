# Biz 사용자 수정

초대 ****완료되어 등록된 사용자의 정보를 수정하는 기능입니다.

## 1. URL <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-1URL"></a>

```text
[PUT] https://biz-api.sktnugu.com/api/v1/enrolledUser/user/{userId}
```

## 2. Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-2Request"></a>

### 2.1 body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-2.1body"></a>

**body**

```text
{
    "name": "XXX",
    "alias": "XXX",
    "targetGroupId": "XXX"
}
```

### 2.2 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-2.2&#xC124;&#xBA85;"></a>

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
      <td style="text-align:left">userId</td>
      <td style="text-align:left">path</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC218;&#xC815;&#xD558;&#xACE0;&#xC790; &#xD558;&#xB294; &#xC0AC;&#xC6A9;&#xC790;&#xC758;
        API &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">name</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">100</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC218;&#xC815;&#xD560; &#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC774;&#xB984;</td>
    </tr>
    <tr>
      <td style="text-align:left">alias</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xAC01;&#xAC01; 100</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC218;&#xC815;&#xD560; &#xC0AC;&#xC6A9;&#xC790;&#xC758; Alias</td>
    </tr>
    <tr>
      <td style="text-align:left">targetGroupId</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xBCC0;&#xACBD;&#xD560; &#xADF8;&#xB8F9; ID
          <br />&#xBBF8;&#xC785;&#xB825;&#xC2DC; &#xBCC0;&#xACBD;&#xB418;&#xC9C0; &#xC54A;&#xC73C;&#xBA70;,
          &#xBCC0;&#xACBD;&#xC2DC; &#xC11C;&#xBE44;&#xC2A4; &#xB3D9;&#xC758; &#xC0AC;&#xC6A9;&#xC790;&#xC758;
          &#xACBD;&#xC6B0; &#xBCC4;&#xB3C4;&#xC758; &#xACFC;&#xC815;&#xC5C6;&#xC774;
          &#xBCC0;&#xACBD;&#xC774; &#xAC00;&#xB2A5;&#xD558;&#xB098;, Play &#xB3D9;&#xC758;
          &#xC0AC;&#xC6A9;&#xC790;&#xC77C; &#xACBD;&#xC6B0; &#xD574;&#xB2F9; &#xADF8;&#xB8F9;&#xC73C;&#xB85C;
          &#xC7AC;&#xCD08;&#xB300;&#xB418;&#xB294; &#xC808;&#xCC28;&#xB97C; &#xAC70;&#xCE5C;&#xB2E4;.</p>
        <p>&#xB610;&#xD55C; Play &#xB3D9;&#xC758; &#xC0AC;&#xC6A9;&#xC790;&#xC77C;
          &#xACBD;&#xC6B0; &#xB3D9;&#xC758;&#xB97C; &#xC644;&#xB8CC;&#xD558;&#xAE30;
          &#xC804;&#xAE4C;&#xC9C0; &#xADF8;&#xB8F9;&#xC774; &#xBCC0;&#xACBD;&#xB418;&#xC9C0;
          &#xC54A;&#xB294;&#xB2E4;.</p>
      </td>
    </tr>
  </tbody>
</table>

## 3. Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-3Response"></a>

### 3.1 HTTP Status <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-3.1HTTPStatus"></a>

| HTTP Status | errorCode | 설명 |
| :--- | :--- | :--- |
| 200 |  | 정상 수정 |
| 403 |  | 퍼블리셔 API Token이 유효하지 않거나, 유효하지 않은 자원에 접근할 경우 리턴 |
| 404 |  | 수정요청한 그룹이 존재하지 않을 때 응답값 |
| 401 |  | 변경하고자 하는 그룹이름이 기존재할 경우의 응답 |
| 400 | USER002 | Biz사용자 초대/수정시 name이 없거나 사이즈를 초과한 경우 |
| 400 | USER003 | Biz사용자 초대/수정시 alias의사이즈를 초과한 경우 |
| 400 | USER004 | Bizt사용자 초대/수정시 기존에 중복된 email이 존재할 경우 |
| 400 | USER008 | Biz Kit 기본 필수정보 없는 상태 |
| 400 | GROUP001 | 그룹이 존재하지 않거나, 퍼블리셔의 소유가 아닌 경우 |
|  |  |  |
|  |  |  |

### 3.2 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-3.2Body"></a>

```text
{
    "id": "XXX",
    "email": "XXX",
    "name": "XXX",
    "alias": "XXX",
    "targetGroupId": "XXX"
}
```

### 3.3 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xC218;&#xC815;v1-3.3&#xC124;&#xBA85;"></a>

| 이름 | 속성 | 설명 |
| :--- | :--- | :--- |
| id | string | 수정한 Biz 사용자의 ID |
| email | string | 수정한 Biz 사용자의 이메일 |
| name | string | 수정한 Biz 사용자의 이름 |
| alias | string | 수정한 Biz 사용자의 Alias |
| targetGroupId | array of string | 변경할 그룹의 ID |

