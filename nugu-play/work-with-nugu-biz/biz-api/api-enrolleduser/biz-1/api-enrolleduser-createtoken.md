# Biz 사용자 API Token 생성

Biz 사용자를 대상으로 Announcement 등 API를 발송할 때, 제휴사 계정을 인증하여 해당 계정 기준으로 토큰을 발급하고 발송 할 수 있도록 합니다. 

유의사항

* Developers는 Biz 사용자를 식별하는 키로 email을 사용한다.
  * **email이 다르지만 Biz Api Token이 같은 경우를 허용하지 않는다.**
*  Developers는 초대받은 Biz 사용자가 모든 초대과정을 정상적으로 마친 경우에만 정상적인 Biz 사용자로서 식별하며, 사용자에 의한 페이지 이탈등의 행위로 초대과정이 중단된 경우 상태를 유지하지 않는다. 
  * **제휴사는 userApiToken을 전달했으나\(제휴사 서비스에 저장했으나\), 사용자가 초대행위를 마치지 않고 중단했다면, 생성한 userApiToken은 사용할 수 없다.**

## 1. 절차 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-1.&#xC808;&#xCC28;"></a>

1. Biz 사용자는 초대 링크로 진입할 경우 NUGU ID 로그인을 수행한다.
2. Developers는 기등록된 제휴사의 인증 URL로 status, callBackUrl. email을 전달한다.
   1. status값은 Developers에서 생성된 값으로서 수정되어서는 안된다.
3. 제휴사는 인증과정을 통해 사용자 API Token을 생성하고, 전달받은 callBackUrl에 userApiToken과 status를 전달한다.

## 2. 인증 요청 \[Developers 요청\] <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-2.&#xC778;&#xC99D;&#xC694;&#xCCAD;[Developers&#xC694;&#xCCAD;]"></a>

* Developers에서 기등록된 제휴사의 인증 URL로 인증을 요청한다.
* 인증 URL을 통해 로그인 등의 행위들로 사용자를 식별하여, Biz 사용자 API Token을 생성한후, 요청시 전달한 callBackUrl로 결과를 리턴한다.

### 2.1 Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-2.1Request"></a>

| 이름 | 유형 | 속성 | 필수 | 설명 |
| :--- | :--- | :--- | :--- | :--- |
| status | query param | string | Y | Developers에서 사용자를 식별하는 키값으로서 전달된 값을 바꾸어서는 안된다. |
| callBackUrl | query param | string | Y | 인증을 마친후 생성한 Biz 사용자 API Token과 status를 전달할 URL |
| email | query param | string | Y | 초대한 사용자를 식별하기 위한 이메일 |

### 2.2 Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-2.2Response"></a>

## 3. 인증 결과 수신 \[제휴사 요청\] <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-3.&#xC778;&#xC99D;&#xACB0;&#xACFC;&#xC218;&#xC2E0;[&#xC81C;&#xD734;&#xC0AC;&#xC694;&#xCCAD;]"></a>

* Developers에서 사용자 API Token을 저장하는 API
* Developers는 전달받은 파라미터가 유효하지 않을 경우, confirmUrl로 결과코드를 전송한다.

### 2.1 Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-2.1Request.1"></a>

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xC774;&#xB984;</th>
      <th style="text-align:left">&#xC720;&#xD615;</th>
      <th style="text-align:left">&#xC18D;&#xC131;</th>
      <th style="text-align:left">&#xD544;&#xC218;</th>
      <th style="text-align:left">&#xC124;&#xBA85;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">status</td>
      <td style="text-align:left">query param</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Developers&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xC790;&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xB294;
        &#xD0A4;&#xAC12;&#xC73C;&#xB85C;&#xC11C; &#xC778;&#xC99D; &#xC694;&#xCCAD;&#xC5D0;
        &#xC804;&#xB2EC;&#xB41C; &#xAC12;&#xC744; &#xBC14;&#xAFB8;&#xC5B4;&#xC11C;&#xB294;
        &#xC548;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">userApiToken</td>
      <td style="text-align:left">query param</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC778;&#xC99D;&#xC744; &#xB9C8;&#xCE5C;&#xD6C4; &#xC0DD;&#xC131;&#xD55C;
        Biz &#xC0AC;&#xC6A9;&#xC790; API Token</td>
    </tr>
    <tr>
      <td style="text-align:left">confirmUrl</td>
      <td style="text-align:left">query param</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC815;&#xC0C1;&#xC801;&#xC778; &#xCD08;&#xB300;&#xD589;&#xC704;&#xB97C;
          &#xB9C8;&#xCE5C; &#xACBD;&#xC6B0; &#xC81C;&#xD734;&#xC0AC;&#xC5D0; &#xC131;&#xACF5;&#xACB0;&#xACFC;&#xB97C;
          &#xC804;&#xB2EC;&#xD558;&#xAE30; &#xC704;&#xD55C; URL</p>
        <p>&#xC5C6;&#xC744; &#xACBD;&#xC6B0; &#xC804;&#xC1A1;&#xD558;&#xC9C0; &#xC54A;&#xB294;&#xB2E4;.</p>
      </td>
    </tr>
  </tbody>
</table>

### 2.2 Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-2.2Response.1"></a>

## 4. 인증 결과 전송 \[Developers 요청\] <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-4.&#xC778;&#xC99D;&#xACB0;&#xACFC;&#xC804;&#xC1A1;[Developers&#xC694;&#xCCAD;]"></a>

* 제휴사에서 인증 결과를 전송받고자 confirmUrl을 입력했다면, 입력한 URL로 처리결과를 POST로 전송한다.

### 4.1 Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-4.1Request"></a>

#### 4.1.1 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;APIToken&#xC0DD;&#xC131;v1-4.1.1Body"></a>

**body**

```text
{
    "userApiToken": "XXX",
    "resultCode": "OK"
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xC774;&#xB984;</th>
      <th style="text-align:left">&#xC720;&#xD615;</th>
      <th style="text-align:left">&#xC18D;&#xC131;</th>
      <th style="text-align:left">&#xD544;&#xC218;</th>
      <th style="text-align:left">&#xC124;&#xBA85;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">userApiToken</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC9C4;&#xD589;&#xC911;&#xC778; Biz &#xC0AC;&#xC6A9;&#xC790; API Token</td>
    </tr>
    <tr>
      <td style="text-align:left">resultCode</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">enum</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>OK : &#xC0AC;&#xC6A9;&#xC790; &#xC0DD;&#xC131; &#xC644;&#xB8CC;</p>
        <p>CONFLICT : &#xC0DD;&#xC131;&#xD55C; Biz Api Token&#xC774; &#xB2E4;&#xB978;
          Biz &#xC0AC;&#xC6A9;&#xC790;&#xC5D0; &#xC911;&#xBCF5;&#xB41C; &#xACBD;&#xC6B0;</p>
      </td>
    </tr>
  </tbody>
</table>

