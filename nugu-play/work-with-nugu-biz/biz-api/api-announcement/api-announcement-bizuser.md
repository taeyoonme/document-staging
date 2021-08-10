# Biz 사용자별 Announcement 전송

등록된 Biz 사용자가 Biz API 수신 및 제휴사 계정 인증을 한 경우, 계정 인증을 통해 생성된 토큰을 바탕으로 개인에게 특화된 Announcement 메세지를 사용자의 디바이스에 발송 할 수 있습니다.

## 1. URL <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-1URL"></a>

```text
[POST] https://biz-api.nugu.co.kr/api/v1/enrolledUser/user/{userApiToken}/announcement
```

## 2. Request <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-2Request"></a>

### 2.1 Body <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-2.1Body"></a>

**body**

```text
{
    "playServiceId": "XXX",
    "tts" {
        "text": "발송 내용",
        "speed": "100",
        "pause1": "600",
        "pause2": "300"
    },
    "display" : {
        "type": "imageText2",
        "title": "타이틀",
        "header": "헤더",
        "body": "본문",
        "footer": "부가설명",
        "image": "http://imageUrl"
    }
}
```

\*\*\*\*

### 2.2 설명 <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-2.2&#xC124;&#xBA85;"></a>

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
      <td style="text-align:left">Publisher-Token</td>
      <td style="text-align:left">Header</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD37C;&#xBE14;&#xB9AC;&#xC154;&#xAC00; &#xBCF4;&#xC720;&#xD55C; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">userApiToken</td>
      <td style="text-align:left">path</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC1C;&#xC1A1;&#xD560; &#xC0AC;&#xC6A9;&#xC790;&#xC758; API &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xBC1C;&#xC1A1; &#xB300;&#xC0C1; play</p>
        <p>&#xB300;&#xC0C1; play&#xC758; &#xD569;&#xC131;&#xC74C;, TTS Domain&#xC744;
          &#xAE30;&#xC900;&#xC73C;&#xB85C; SKML&#xC744; &#xC0DD;&#xC131;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">tts</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">TTS&#xB97C; &#xAD6C;&#xC131;&#xD558;&#xB294; &#xAC1D;&#xCCB4;</td>
    </tr>
    <tr>
      <td style="text-align:left">tts.text</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xBC1C;&#xD654;&#xBB38;&#xC7A5;</p>
        <p>&#xBC1C;&#xD654;&#xBB38;&#xC7A5;, Display &#xAC1D;&#xCCB4; &#xC911; &#xBC18;&#xB4DC;&#xC2DC;
          1&#xAC1C; &#xC774;&#xC0C1;&#xC740; &#xC874;&#xC7AC;&#xD574;&#xC57C; &#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">tts.speed</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xBC1C;&#xD654;&#xC18D;&#xB3C4;
          <br />85, 90... 120&#xAE4C;&#xC9C0;&#xC758; 5&#xB2E8;&#xC704; &#xAC12;</p>
        <p>&#xAE30;&#xBCF8;&#xAC12;&#xC740; 100</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">tts.pause1</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xBB38;&#xC7A5; &#xC0AC;&#xC774; &#xBB35;&#xC74C; &#xAD6C;&#xAC04; &#xAE38;&#xC774;</p>
        <p>300, 400... 900&#xAE4C;&#xC9C0;&#xC758; 100&#xB2E8;&#xC704; &#xAC12;</p>
        <p>&#xAE30;&#xBCF8;&#xAC12;&#xC740; 600</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">tts.pause2</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>100, 200... 500&#xAE4C;&#xC9C0;&#xC758; 100&#xB2E8;&#xC704; &#xAC12;</p>
        <p>&#xAE30;&#xBCF8;&#xAC12;&#xC740; 300</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">display</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>Display &#xAC1D;&#xCCB4;</p>
        <p>&#xBC1C;&#xD654;&#xBB38;&#xC7A5;, Display &#xAC1D;&#xCCB4; &#xC911; &#xBC18;&#xB4DC;&#xC2DC;
          1&#xAC1C; &#xC774;&#xC0C1;&#xC740; &#xC874;&#xC7AC;&#xD574;&#xC57C; &#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">display.type</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xD560; Display Template</p>
        <p>FullText1, ImageText2&#xC911; &#xD558;&#xB098;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">display.title</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD654;&#xBA74; &#xD0C0;&#xC774;&#xD2C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">display.header</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</td>
    </tr>
    <tr>
      <td style="text-align:left">display.body</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">display.footer</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xBD80;&#xAC00; &#xC124;&#xBA85;</td>
    </tr>
    <tr>
      <td style="text-align:left">display.image</td>
      <td style="text-align:left">body</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p></p>
        <p>&#xC774;&#xBBF8;&#xC9C0;</p>
        <ul>
          <li>ImageText Type&#xC5D0;&#xC11C; &#xC774;&#xBBF8;&#xC9C0;&#xAC00; &#xC5C6;&#xC744;
            &#xACBD;&#xC6B0;, &#xB514;&#xD3F4;&#xD2B8; &#xC774;&#xBBF8;&#xC9C0; &#xB178;&#xCD9C;</li>
        </ul>
        <p>
          <img src="../../../../.gitbook/assets/img_notification.png" alt/>
        </p>
      </td>
    </tr>
  </tbody>
</table>

## 3. Response <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-3Response"></a>

### 3.1 HTTP Status <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-3.1HTTPStatus"></a>

| HTTP Status | errorCode | 설명 |
| :--- | :--- | :--- |
| 200 |  | 정상 요청 |
| 403 |  | 퍼블리셔 API Token이 유효하지 않거나, 유효하지 않은 자원에 접근할 경우 리턴 |
| 404 |  | 발송 요청한 사용자가 존재하지 않을 때 응답값 |
| 400 | V1ANN001 | body 값을 파싱할 수 없음 |
| 400 | V1ANN002 | playServiceId 없음 |
| 400 | V1ANN101 | tts, display 객체가 모두 존재하지 않음 |
| 400 | V1ANN102 | tts.text 없음 |
| 400 | V1ANN103 | tts.speed 값이 잘못됨 |
| 400 | V1ANN104 | tts.pause1 값이 잘못됨 |
| 400 | V1ANN105 | tts.pause2 값이 잘못됨 |
| 400 | V1ANN201 | display.type 값이 잘못됨 |
| 400 | V1ANN202 | display.title 값이 없음 |
| 400 | V1ANN203 | display.header 값이 없음 |
| 400 | V1ANN204 | display.body 값이 없음 |

###  <a id="Biz&#xC0AC;&#xC6A9;&#xC790;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-3.2Body"></a>

