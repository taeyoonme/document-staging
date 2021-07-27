# 전용디바이스 그룹별 Announcement 전송

전용 디바이스로 등록된 그룹에 토큰을 기준으로 Announcement API를 발송 할 수 있습니다.

## 1. URL <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-1URL"></a>

```text
[POST] {{hostName}}/api/v1/sharedDevice/group/{groupApiToken}/announcement?callBack={callBackUrl}
```

## 2. Request <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-2Request"></a>

### 2.1 Body <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-2.1Body"></a>

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

### 2.2 설명 <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-2.2&#xC124;&#xBA85;"></a>

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
      <td style="text-align:left">groupApiToken</td>
      <td style="text-align:left">path</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC1C;&#xC1A1;&#xD560; &#xADF8;&#xB8F9;&#xC758; API &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">callBackUrl</td>
      <td style="text-align:left">query param</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xCC98;&#xB9AC;&#xACB0;&#xACFC;&#xB97C; &#xBC1B;&#xC744; URL</p>
        <p>&#xBBF8;&#xC785;&#xB825;&#xC2DC; &#xC804;&#xC1A1;&#xB418;&#xC9C0; &#xC54A;&#xB294;&#xB2E4;.</p>
      </td>
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
        <p>fullText1, fullText2, imageText2&#xC911; &#xD558;&#xB098;</p>
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
        <p>&#xC774;&#xBBF8;&#xC9C0;</p>
        <ul>
          <li>
            <p>&#xC5C6;&#xC744; &#xACBD;&#xC6B0; &#xC544;&#xB798;&#xC758; &#xC774;&#xBBF8;&#xC9C0;
              &#xC1A1;&#xCD9C;(</p>
            <p><a href="https://cdn.sktnugu.com/aladdin/image/push/img_notification.png">https://cdn.sktnugu.com/aladdin/image/push/img_notification.png</a>)</p>
          </li>
        </ul>
        <p>
          <img src="https://tde.sktelecom.com/wiki/download/thumbnails/367730104/img_notification.png?version=1&amp;modificationDate=1621573187000&amp;api=v2"
          alt/>
        </p>
      </td>
    </tr>
  </tbody>
</table>

## 3. Response <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-3Response"></a>

### 3.1 HTTP Status <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-3.1HTTPStatus"></a>

| HTTP Status | errorCode | 설명 |
| :--- | :--- | :--- |
| 202 |  | 정상 요청 |
| 403 |  | 퍼블리셔 API Token이 유효하지 않거나, 유효하지 않은 자원에 접근할 경우 리턴 |
| 404 |  | 발송 요청한 그룹이 존재하지 않을 때 응답값 |
| 400 | V1ANN001 | body 값을 파싱할 수 없음 |
| 400 | V1ANN002 | playServiceId 없음 |
| 400 | V1ANN101 | tts, display 객체가 모두 존재하지 않음 |
| 400 | V1ANN102 | tts.text 없음 |
| 400 | V1ANN103 | tts.speed 값이 잘못됨 |
| 400 | V1ANN104 | tts.pause1 값이 잘못됨 |
| 400 | V1ANN105 | tts.pause2 값이 잘못됨 |
| 400 | V1ANN201 | displat.type 값이 잘못됨 |
| 400 | V1ANN202 | display.title 값이 없음 |
| 400 | V1ANN203 | display.header 값이 없음 |
| 400 | V1ANN204 | displat.body 값이 없음 |

### 3.2 Body <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-3.2Body"></a>

* callback URL을 입력했을 경우에만 전달받음

```text
{
    "devices": [
        {"uniqueName": "XXX", "token": "XXX", "resultCode": "XXX" },
        {"uniqueName": "XXX", "token": "XXX", "resultCode": "XXX" },
    ]
}
```

### 3.3 설명 <a id="id-&#xC804;&#xC6A9;&#xB514;&#xBC14;&#xC774;&#xC2A4;&#xADF8;&#xB8F9;&#xBCC4;Announcement&#xC804;&#xC1A1;v1-3.3&#xC124;&#xBA85;"></a>

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
      <td style="text-align:left">devices</td>
      <td style="text-align:left">array of object</td>
      <td style="text-align:left">&#xBC1C;&#xC1A1; &#xC694;&#xCCAD; &#xADF8;&#xB8F9;&#xB0B4; &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xB4E4;&#xC758;
        &#xBC1C;&#xC1A1; &#xACB0;&#xACFC;</td>
    </tr>
    <tr>
      <td style="text-align:left">devices[].uniqueName</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xBC1C;&#xC1A1; &#xB300;&#xC0C1; &#xAE30;&#xAE30;&#xC758; unique name</td>
    </tr>
    <tr>
      <td style="text-align:left">devices[].token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">&#xBC1C;&#xC1A1; &#xB300;&#xC0C1; &#xAE30;&#xAE30;&#xC758; API Token</td>
    </tr>
    <tr>
      <td style="text-align:left">devices[].resultCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">
        <p>&#xBC1C;&#xC1A1; &#xACB0;&#xACFC;</p>
        <p>OK : &#xBC1C;&#xC1A1; &#xC131;&#xACF5;</p>
        <p>NOT_AGREE : &#xBC1C;&#xC1A1;&#xC744; &#xD5C8;&#xC6A9;&#xD558;&#xC9C0;
          &#xC54A;&#xC740; &#xACBD;&#xC6B0;</p>
        <p>NO_DEVICE : &#xBC1C;&#xC1A1;&#xC744; &#xD5C8;&#xC6A9;&#xD588;&#xC73C;&#xB098;,
          &#xD5C8;&#xC6A9;&#xD55C; &#xAE30;&#xAE30;&#xAC00; &#xC5C6;&#xB294; &#xACBD;&#xC6B0;</p>
        <p>NOT_CONNECTED : &#xD5C8;&#xC6A9;&#xB41C; &#xAE30;&#xAE30;&#xAC00; &#xC788;&#xC73C;&#xB098;,
          &#xC694;&#xCCAD;&#xD55C; &#xC0AC;&#xC6A9;&#xC790;&#xC5D0;&#xAC8C; &#xC5F0;&#xACB0;&#xB418;&#xC9C0;
          &#xC54A;&#xC740; &#xACBD;&#xC6B0;</p>
        <p>TIMEOUT : &#xAE30;&#xAE30;&#xC640;&#xC758; &#xC5F0;&#xACB0;&#xC774; &#xC6D0;&#xD560;&#xCE58;
          &#xC54A;&#xC740; &#xACBD;&#xC6B0;</p>
        <p>CONNECT_ERROR : &#xAE30;&#xAE30;&#xAC00; &#xAEBC;&#xC838;&#xC788;&#xAC70;&#xB098;,
          &#xAE30;&#xAE30; &#xB124;&#xD2B8;&#xC6CC;&#xD06C;&#xC5D0; &#xBB38;&#xC81C;&#xAC00;
          &#xC788;&#xC744; &#xACBD;&#xC6B0;</p>
      </td>
    </tr>
  </tbody>
</table>

