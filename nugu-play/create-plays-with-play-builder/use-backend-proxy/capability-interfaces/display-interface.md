# Display Interface

Display Interface를 사용하면 화면을 가진 디바이스에서 화면에 필요한 정보를 보여줄 수 있습니다. Display Interface 사용함으로 활성화한 Play는 Display Template을 구성하여 화면을 제어할 수 있습니다. 디바이스와 관계없이 하나의 Template이 여러 디스플레이 대응하게 됩니다. 

Display Interface를 사용하기 위해서는 우선 `General` &gt; `기본 정보` 페이지의 Capability Interface에서 `Display 제어` 항목을 `ON`으로 설정해야 합니다.

![](../../../../.gitbook/assets/capability_audio_1.jpg)

{% hint style="danger" %}
Display Interface는 AudioPlayer를 위한 Display와 중첩하여 사용할 수 없습니다. 
{% endhint %}

## 지원 디바이스 및 해상도

현재 Display Interface를 지원하는 디바이스와 해상는 다음과 같습니다.

| 디바이스 | Size \(px\) | Orientation |
| :---: | :---: | :---: |
| NU300 | 1280 x 800 | Landscape |
| Btv | 1920 x 1080 | Landscape |

## Template 유형 모아보기

다음과 같은 유형의 Template 들을 사용할 수 있습니다.  

| Type  | NU300 |  Btv |
| :--- | :---: | :---: |
| FullText1 | ![](../../../../.gitbook/assets/fulltext1_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/fulltext1_btv%20%282%29.jpg) |
| FullText2 | ![](../../../../.gitbook/assets/fulltext2_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/fulltext2_btv%20%282%29.png) |
| ImageText1 | ![](../../../../.gitbook/assets/imagetext1_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/imagetext1_btv.png) |
| ImageText2 | ![](../../../../.gitbook/assets/imagetext2_nu300.png) | ![](../../../../.gitbook/assets/imagetext2_btv%20%281%29.png) |
| ImageText3 | ![](../../../../.gitbook/assets/imagetext3_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/imagetext3_btv.png) |
| ImageText4 | ![](../../../../.gitbook/assets/imagetext4_nu300.png) | ![](../../../../.gitbook/assets/imagetext4_btv.png) |
| TextList1 | ![](../../../../.gitbook/assets/textlist1_nu300.png) | ![](../../../../.gitbook/assets/textlist1_btv.png) |
| TextList2 | ![](../../../../.gitbook/assets/textlist2_nu300.png) | ![](../../../../.gitbook/assets/textlist2_btv%20%281%29.png) |
| TextList3 | ![](../../../../.gitbook/assets/textlist3_nu300.png) | ![](../../../../.gitbook/assets/textlist3_btv.png) |
| ImageList1 | ![](../../../../.gitbook/assets/imagelist1_nu300.png) | ![](../../../../.gitbook/assets/imagelist1_btv.png) |
| ImageList2 | ![](../../../../.gitbook/assets/imagelist2_nu300.png) | ![](../../../../.gitbook/assets/imagelist2_btv.jpg) |

## 





### Context  <a id="id-1.DisplayInterface-3.Context"></a>

Template이 display되는 동안 display 중인 template의 token 값을 전달됩니다. Event가 발생하는 경우는 template display되는 상황이기 때문에 context는 함께 전달됩니다.

```text
{
    "Display": {
        "version": "1.0",
        "playServiceId": "{{STRING}}",
        "token": "{{STRING}}"
    }
}
```

| parameter | type | mandatory | description |
| :--- | :---: | :---: | :--- |
| version | string | Y | 인터페이스 버전 |
| playServiceId | string | N | template을 전송한 Play의 play service id |
| token | string | N | 클릭하는 template을 식별하기 위한 unique identifier |







## 화면 구성 요소

Template 별로 알아보기 전에, 화면 구성 요소에 대해 알아보겠습니다. 

### TitleObject

화면 상단의 타이틀 영역에 들어갈 요소입니다. NU300 화면 상단 왼쪽의 홈 버튼은 기본으로 제공되는 버튼으로 Title Object와는 무관합니다.. 

```text
{
    "logo": ImageObject,
    "text": TextObject,
    "subtext" : TextObject,
    "subicon" : ImageObject,
    "button" : TextObject
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Type</th>
      <th style="text-align:left">Mandatory</th>
      <th style="text-align:left">Description</th>
      <th style="text-align:left">NU300</th>
      <th style="text-align:left">Btv</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">logo</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD22C;&#xBA85; &#xBC30;&#xACBD;&#xC758; &#xC774;&#xBBF8;&#xC9C0;&#xB85C;
        &#xC81C;&#xACF5;&#xD574;&#xC57C; &#xD568;(PNG &#xD0C0;&#xC785;)</td>
      <td
      style="text-align:left">
        <p>50x50</p>
        <p>&#xAC00;&#xB85C; Size Flexible</p>
        </td>
        <td style="text-align:left">
          <p>STB2&#xBD80;&#xD130; &#xC801;&#xC6A9; &#xC608;&#xC815;</p>
          <p>&#xC0AC;&#xC774;&#xC988; &#xBBF8;&#xC815;</p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left">text</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC81C;&#xBAA9;</td>
      <td style="text-align:left">42sp, #FFFFFF &#xC73C;&#xB85C; &#xBCF4;&#xC5EC;&#xC9D1;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">36sp, #1a1a1a &#xC73C;&#xB85C; &#xBCF4;&#xC5EC;&#xC9D1;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">subtext</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBD80;&#xC81C;&#xBAA9;</td>
      <td style="text-align:left">&#xACF5;&#xBC31; &#xD3EC;&#xD568; 20&#xC790;</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">subicon</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">subText &#xC67C;&#xCABD;&#xC5D0; &#xB178;&#xCD9C;&#xB420; &#xC11C;&#xBE0C;&#xC544;&#xC774;&#xCF58;</td>
      <td
      style="text-align:left">
        <p>&#xC704;&#xCE58; : subText &#xC67C;&#xCABD;</p>
        <p>size : 36 x 36dp</p>
        </td>
        <td style="text-align:left">
          <p>&#xC704;&#xCE58; : subText &#xC67C;&#xCABD;</p>
          <p>size : 30 x 30dp</p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left">button</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC6B0;&#xCE21;&#xC5D0; &#xC704;&#xCE58;&#xD558;&#xB294; &#xBC84;&#xD2BC;</p>
        <p>(&#xBC84;&#xD2BC; &#xC548;&#xC758; Text&#xB9CC; &#xC815;&#xC758;&#xAC00;&#xB2A5;)</p>
      </td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

### ImageObject

```text
{
    "contentDescription": "{{STRING}}",
    "sources": [
        {
            "url": "{{STRING}}",
            "size": "{{STRING}}",
            "widthPixels": 1920,
            "heightPixels": 1080
        },
        {
            "url": "{{STRING}}",
            "size": "{{STRING}}",
            "widthPixels": 480,
            "heightPixels": 320
        },
        {...}
    ]
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:center">Type</th>
      <th style="text-align:center">Mandatory</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">contentDescription</td>
      <td style="text-align:center">string</td>
      <td style="text-align:center">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">heightPixels</td>
      <td style="text-align:center">long</td>
      <td style="text-align:center">N</td>
      <td style="text-align:left">&#xC815;&#xD655;&#xD55C; &#xAC12;&#xC774; &#xC544;&#xB2C8;&#xB77C;&#xBA74;,
        &#xC0AC;&#xC6A9;&#xD558;&#xC9C0; &#xC54A;&#xB294; &#xAC83;&#xC744; &#xAD8C;&#xC7A5;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">size</td>
      <td style="text-align:center">string</td>
      <td style="text-align:center">N</td>
      <td style="text-align:left">
        <p>X_SMALL, SMALL, MEDIUM, LARGE, X_LARGE</p>
        <p>&#xD654;&#xBA74; &#xD06C;&#xAE30;&#xBCC4; &#xCD5C;&#xC801;&#xD654;&#xB97C;
          &#xC704;&#xD574; size &#xC815;&#xBCF4;&#xB97C; &#xB123;&#xB294; &#xAC83;&#xC744;
          &#xAD8C;&#xC7A5;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>Value&#xBCC4; &#xAD8C;&#xC7A5; &#xC0AC;&#xC774;&#xC988;&#xB294; &#xC544;&#xB798;&#xC758;
          &#xD45C;&#xB97C; &#xCC38;&#xACE0;&#xD558;&#xC138;&#xC694;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">sources</td>
      <td style="text-align:center">list</td>
      <td style="text-align:center">Y</td>
      <td style="text-align:left">&#xB9AC;&#xC2A4;&#xD2B8;&#xB85C; &#xC81C;&#xACF5;&#xB418;&#xBA70; &#xD074;&#xB77C;&#xC774;&#xC5B8;&#xD2B8;&#xC5D0;&#xC11C;
        &#xD654;&#xBA74; &#xD06C;&#xAE30;&#xC5D0; &#xAC00;&#xC7A5; &#xC801;&#xD569;&#xD55C;
        &#xC774;&#xBBF8;&#xC9C0;&#xB97C; &#xC0AC;&#xC6A9;&#xD574;&#xC57C; &#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">url</td>
      <td style="text-align:center">string</td>
      <td style="text-align:center">Y</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">widthPixels</td>
      <td style="text-align:center">long</td>
      <td style="text-align:center">N</td>
      <td style="text-align:left">&#xC815;&#xD655;&#xD55C; &#xAC12;&#xC774; &#xC544;&#xB2C8;&#xB77C;&#xBA74;,
        &#xC0AC;&#xC6A9;&#xD558;&#xC9C0; &#xC54A;&#xB294; &#xAC83;&#xC744; &#xAD8C;&#xC7A5;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
  </tbody>
</table>

| Size Value | Recommended Size \(in pixels\) |
| :---: | :---: |
| X\_SMALL | 480 x 320 |
| SMALL | 720 x 480 |
| MEDIUM | 960 x 640 |
| LARGE | 1280 x 800 |
| X\_LARGE | 1920 x 1080 |

### 

### BackgroundObject

image와 color가 동시에 존재하면 image의 우선순위가 높습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">color</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>color &#xD615;&#xC2DD; (RGB)</p>
        <p>default - #000000</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">opacity</td>
      <td style="text-align:left">number</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">NU300&#xC5D0;&#xB9CC; &#xC720;&#xD6A8;&#xD558;&#xBA70;,
        <br />default&#xAC12;&#xC740; 0.7</td>
    </tr>
  </tbody>
</table>### 

### Text Object

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">color</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>color &#xD615;&#xC2DD; (RGB)</p>
        <p>default &#xAC12;&#xC740; &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xB9C8;&#xB2E4;
          &#xB2E4;&#xB984;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">style</td>
      <td style="text-align:left">json</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xAE30;&#xBCF8;&#xC801;&#xC73C;&#xB85C;&#xB294; &#xC0C1;&#xC704; &#xC2A4;&#xD0C0;&#xC77C;(directive
          &#xB4F1;)&#xC744; &#xB530;&#xB974;&#xBA70;, &#xD604;&#xC7AC; FullText1,2&#xC758;
          body text&#xC5D0;&#xB9CC; &#xC801;&#xC6A9; &#xAC00;&#xB2A5;.</p>
        <p>CSS &#xC18D;&#xC131;&#xC740; &#xBAA8;&#xB450; &#xAC00;&#xB2A5;&#xD558;&#xBA70;,
          &#xB2E4;&#xC74C;&#xC758; &#xAC12;&#xB4E4;&#xC744; &#xAC00;&#xC9C8; &#xC218;
          &#xC788;&#xB2E4;.</p>
        <ul>
          <li>text-align : left, center, right</li>
          <li>opacity : 0 ~ 1</li>
          <li>display : block, inline, none</li>
          <li>margin : 10px</li>
        </ul>
        <p>
          <br />&#xC0AC;&#xC6A9;&#xC608;.
          <br />{ &quot;text-align&quot;:&quot;center&quot;, &quot;display&quot;: &quot;block&quot;
          }</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>TextObject는 Scrollable이 명시된 경우만 스크롤이 가능하고, 명시되어 있지 않으면 default로 스크롤 불가합니다.



## Template 유형별 Spec.

Display Interface에서는 크게 4종류의 Template을 제공합니다. 

* FullText : 텍스트로 화면을 구성할 때 사용합니다.
* ImageText : 이미지와 텍스트를 함께 구성할 때 사용합니다. 
* TextList : 텍스트를 중심으로 리스트를 표현할 때 사용합니다. 
* IamgeList : 이미지를 중심으로 리스트를 표현할 때 사용합니다.

### 

### FullText1

#### 형식

```text
{
    "type": "Display.FullText1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "header": TextObject, 
        "body": TextObject,     
        "footer": TextObject
    }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Type</th>
      <th style="text-align:left">Required</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.FullText1</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
          <li>Scrollable</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF4;&#xC870; &#xC124;&#xBA85;</td>
    </tr>
  </tbody>
</table>#### 

#### Sample Code

```text
{
    "type": "Display.FullText1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "서비스명"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#222"
    },
    "content": {
      "header": {"text": "본문 제목"},
      "body": {
        "text": "본문 내용입니다. '에펠탑'은 1889년 파리 마르스 광장에 지어진 탑으로, 프랑스의 대표적인 건축물입니다."
      },
      "footer": {"text": "background image example"}
    }
}
```

#### 

### 

### FullText2

#### 형식

```text
{
    "type": "Display.FullText2",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "body": TextObject,     
        "footer": TextObject
    }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Type</th>
      <th style="text-align:left">Required</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.FullText2</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
          <li>&#xCD5C;&#xB300; 4&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF4;&#xC870; &#xC124;&#xBA85;</td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.FullText2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "날짜/시간"}
    },
    "background": {"color": "#465865"},
    "content": {
      "body": {
        "text": "오늘은 12월 24일 수요일입니다.\n오늘 미세먼지는 매우나쁨이네요.\n그냥 집에만 있어야겠어요."
      },
      "footer": {"text": "오후 6:03"}
    }
}
```

#### Sample Image

![](../../../../.gitbook/assets/fulltext2.png)

### ImageText1

#### 형식

```text
{
    "type": "Display.ImageText1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "imageAlign": "{{STRING}}"
        "header": TextObject,
        "body": TextObject,    
        "footer": TextObject
    }
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.ImageText1</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.imageAlign</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"><b>LEFT, RIGHT</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
          <li>&#xCD5C;&#xB300; 3&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870; &#xC124;&#xBA85;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
          <li>&#xCD5C;&#xB300; 2&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.ImageText1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "content": {
      "header": {"text": "엔드 게임"},
      "body": {"text": "body text."},
      "footer": {"text": "13일째 1100만 돌파. 역대 외화 흥행 2위 달성"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "imageAlign": ""
    }
}
```

### 

### ImageText2

#### 형식

```text
{
    "type": "Display.ImageText2",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "imageAlign": "{{STRING}}"
        "header": TextObject,     
        "body": TextObject
    }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.ImageText2</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.imageAlign</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"><b>LEFT, RIGHT</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
          <li>&#xCD5C;&#xB300; 6&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870; &#xC124;&#xBA85;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
          <li>&#xCD5C;&#xB300; 2&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text

{
    "type": "Display.ImageText2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "content": {
      "header": {"text": "엔드 게임"},
      "body": {
        "text": "예상을 뛰어넘는 흥행몰이에 대부분의 언론에서 오프닝을 상향조정 했다. 현재 데드라인은 북미 제외 시장 한정 7억 달러, 헐리우드 리포터는 전체 9억 5천만 달러로 예상하고 있다. 또 이를 넘어 오프닝만 10억 달러[6]를 점치는 곳도 있었다. 그리고 미국의 박스 오피스 닷컴 및 매거진이 주요 매체 중에서는 처음으로 첫번째 주말 예측 기록을 발표했는데 북미에서만 3억 5000만 달러, 이외 지역에서는 7억 5000만 달러, 합이 11억 달러를 벌여들일 것으로 예측 집계했다.[7][8] 종전의 전세계 박스 오피스 기록은 이전 작의 6억 4100만 달러[9]를 해외 흥행으로만 갈아치운 셈이다."
      },
      "footer": {"text": "footer test"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "imageAlign": "left"
    }
}
```

### 

### ImageText3

#### 형식

```text
{
    "type": "Display.ImageText3",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "header": TextObject,     
        "body": TextObject,
        "footer": TextObject,
    }
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.ImageText3</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
          <li>Scrollable</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.ImageText3",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {"color": "#465865"},
    "content": {
      "header": {"text": "엔드 게임"},
      "body": {
        "text": "예상을 뛰어넘는 흥행몰이에 대부분의 언론에서 오프닝을 상향조정 했다. 현재 데드라인은 북미 제외 시장 한정 7억 달러, 헐리우드 리포터는 전체 9억 5천만 달러로 예상하고 있다. 또 이를 넘어 오프닝만 10억 달러[6]를 점치는 곳도 있었다. 그리고 미국의 박스 오피스 닷컴 및 매거진이 주요 매체 중에서는 처음으로 첫번째 주말 예측 기록을 발표했는데 북미에서만 3억 5000만 달러, 이외 지역에서는 7억 5000만 달러, 합이 11억 달러를 벌여들일 것으로 예측 집계했다.[7][8] 종전의 전세계 박스 오피스 기록은 이전 작의 6억 4100만 달러[9]를 해외 흥행으로만 갈아치운 셈이다."
      },
      "footer": {"text": "배급사 : 월트디즈니"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      }
    }
}
```

### 

### ImageText4

#### 형식

```text
{
    "type": "Display.ImageText4",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "header": TextObject,     
        "body": TextObject,
        "footer": TextObject,
    }
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.ImageText4</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">content.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.ImageText4",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {"color": "#465865"},
    "content": {
      "header": {"text": "본문 제목"},
      "body": {"text": "본문 내용"},
      "footer": {"text": "보조 설명"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      }
    }
}
```





### TextList1

#### 형식

```text
{
    "type": "Display.TextList1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        }
    ]
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.TextList1</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">badgeNumber</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC22B;&#xC790;(&#xC21C;&#xC11C;)&#xB97C;
          &#xBC1C;&#xD654;&#xD558;&#xC5EC; item&#xC744; &#xC120;&#xD0DD;&#xD558;&#xB3C4;&#xB85D;
          badge&#xB97C; &#xD45C;&#xC2DC;&#xD560;&#xC9C0; &#xC5EC;&#xBD80; (true -
          &#xD45C;&#xC2DC;&#xD568;, false - &#xD45C;&#xC2DC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;)</p>
        <p>default - false</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Scrollable (&#xC2A4;&#xD06C;&#xB864;&#xC774; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;&#xB294; &#xC9E4;&#xB9BC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.TextList1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "Movie Chart"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "listItems": [
      {
        "token": "{{111}}",
        "header": {"text": "1위"},
        "body": {"text": "앤드게임"},
        "footer": {"text": "평점 9.5/10"}
      },
      {
        "token": "{{222}}",
        "header": {"text": "2위"},
        "body": {"text": "캡틴마블"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{333}}",
        "header": {"text": "3위"},
        "body": {"text": "왓칭"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{444}}",
        "header": {"text": "4위"},
        "body": {"text": "요로나"},
        "footer": {"text": "평점 8.1/10"}
      }
    ]
}
```

### 

### TextList2

#### 형식

```text
{
    "type": "Display.TextList2",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        }
    ]
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.TextList2</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">badgeNumber</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC22B;&#xC790;(&#xC21C;&#xC11C;)&#xB97C;
          &#xBC1C;&#xD654;&#xD558;&#xC5EC; item&#xC744; &#xC120;&#xD0DD;&#xD558;&#xB3C4;&#xB85D;
          badge&#xB97C; &#xD45C;&#xC2DC;&#xD560;&#xC9C0; &#xC5EC;&#xBD80; (true -
          &#xD45C;&#xC2DC;&#xD568;, false - &#xD45C;&#xC2DC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;)</p>
        <p>default - false
          <br />
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Scrollable (&#xC2A4;&#xD06C;&#xB864;&#xC774; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;&#xB294; &#xC9E4;&#xB9BC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.TextList2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "Movie Chart"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "1위"},
        "body": {"text": "앤드게임"},
        "footer": {"text": "평점 9.5/10"}
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "2위"},
        "body": {"text": "캡틴마블"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "3위"},
        "body": {"text": "왓칭 (watching someone who should be)"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "4위"},
        "body": {"text": "요로나"},
        "footer": {"text": "평점 8.1/10"}
      }
    ]
}
```

#### 

### 

### TextList3

#### 형식

```text
{
    "type": "Display.TextList3",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": [ TextObjects ] ,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": [ TextObjects ],
            "footer": TextObject
        }
    ],
    "caption": TextObject
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.TextList3</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">badgeNumber</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC22B;&#xC790;(&#xC21C;&#xC11C;)&#xB97C;
          &#xBC1C;&#xD654;&#xD558;&#xC5EC; item&#xC744; &#xC120;&#xD0DD;&#xD558;&#xB3C4;&#xB85D;
          badge&#xB97C; &#xD45C;&#xC2DC;&#xD560;&#xC9C0; &#xC5EC;&#xBD80; (true -
          &#xD45C;&#xC2DC;&#xD568;, false - &#xD45C;&#xC2DC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;)</p>
        <p>default - false
          <br />
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Scrollable (&#xC2A4;&#xD06C;&#xB864;&#xC774; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;&#xB294; &#xC9E4;&#xB9BC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.body</td>
      <td style="text-align:left">
        <p>TextObjects</p>
        <p>(list of TextObject)</p>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xD5C8;&#xC6A9; / &#xCD5C;&#xB300; 4&#xC904;</li>
          <li>footer &#xC815;&#xC758; &#xC2DC; 3&#xC904; &#xC81C;&#xD55C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">caption</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC804;&#xCCB4; &#xB9AC;&#xC2A4;&#xD2B8; &#xC544;&#xC774;&#xD15C;&#xB4E4;&#xC5D0;
          &#xB300;&#xD55C; &#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xD14D;&#xC2A4;&#xD2B8; &#xAE38;&#xC774; : &#xCD5C;&#xB300; 2&#xC904;(&#xB2E8;&#xB9D0;&#xC5D0;
            &#xB530;&#xB77C; 1&#xC904;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.TextList3",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "TextList3 - badge"},
      "subtext": {"text": "Q. {ASR} 알려줘"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "badgeNumber": true,
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "본문제목"},
        "body": [{"text": "본문내용1"}, {"text": "본문내용2"}, {"text": "본문내용3"}],
        "footer": {"text": "보조설명"}
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "본문제목"},
        "body": [
          {"text": "본문내용1"},
          {"text": "본문내용2 (exactly)", "color": "red"},
          {"text": "본문내용3"},
          {"text": "본문내용4"}
        ]
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "3위"},
        "body": [
          {"text": "본문내용1"},
          {"text": "본문내용2"},
          {"text": "본문내용3"},
          {"text": "본문내용4"}
        ],
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "4위 ㅁㄴㅇ xㅋㅌㅊ 123 234 asd"},
        "body": [
          {"text": "본문내용1 본문내용1 본문내용1 본문내용1"},
          {"text": "본문내용2"},
          {"text": "본문내용3"},
          {"text": "본문내용4"}
        ]
      }
    ],
    "caption": {"text": "caption"}
}
```

### 

### ImageList1

#### 형식

```text
{
    "type": "Display.ImageList1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "footer": TextObject
        }
    ]
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.ImageList1</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">badgeNumber</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC22B;&#xC790;(&#xC21C;&#xC11C;)&#xB97C;
          &#xBC1C;&#xD654;&#xD558;&#xC5EC; item&#xC744; &#xC120;&#xD0DD;&#xD558;&#xB3C4;&#xB85D;
          badge&#xB97C; &#xD45C;&#xC2DC;&#xD560;&#xC9C0; &#xC5EC;&#xBD80; (true -
          &#xD45C;&#xC2DC;&#xD568;, false - &#xD45C;&#xC2DC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;)</p>
        <p>default - false</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">badgeNumberStyle</td>
      <td style="text-align:left">json</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC544;&#xB798;&#xC640; &#xAC19;&#xC740; Json&#xC73C;&#xB85C; badge style
          &#xC815;&#xC758;</p>
        <p>{
          <br />&quot;background&quot;: &quot;#f0f&quot;, // Container&#xC758; Color
          <br
          />&quot;color&quot;: &quot;red&quot;, // Badge font color
          <br />&quot;border-radius&quot;: &quot;10px&quot; // radius
          <br />}</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Scrollable (&#xC2A4;&#xD06C;&#xB864;&#xC774; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;&#xB294; &#xC9E4;&#xB9BC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.ImageList1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "badgeNumber": true,
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "서비스명"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#212171"
    },
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "아늑한 Jazz Mood"},
        "footer": {"text": "19곡"}
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "plow deep"},
        "footer": {"text": "29곡"}
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "운동 할 때 무한 반복해도 절대 질리지 않는 트랙들!"},
        "footer": {"text": "9곡"}
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "절대 질리지 않는 트랙들!", "color": "red"},
        "footer": {"text": "29곡"}
      }
    ]
}
```

### 

### ImageList2

#### 형식

```text

{
    "type": "Display.ImageList1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "badgeNumberStyle": {
      "background": "#f0f",
      "color": "red",
      "border-radius": "10px"
    },
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "icon": ImageObject,
            "header": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "icon": ImageObject,
            "header": TextObject,
            "footer": TextObject
        }
    ]
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Display.ImageList2</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SHORT</b>(default), <b>MID</b>, <b>LONG, LONGEST</b>
        </p>
        <ul>
          <li>SHORT - 7sec</li>
          <li>MID - 15sec</li>
          <li>LONG - 30sec</li>
          <li>LONGEST - 10min</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">badgeNumber</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC22B;&#xC790;(&#xC21C;&#xC11C;)&#xB97C;
          &#xBC1C;&#xD654;&#xD558;&#xC5EC; item&#xC744; &#xC120;&#xD0DD;&#xD558;&#xB3C4;&#xB85D;
          badge&#xB97C; &#xD45C;&#xC2DC;&#xD560;&#xC9C0; &#xC5EC;&#xBD80; (true -
          &#xD45C;&#xC2DC;&#xD568;, false - &#xD45C;&#xC2DC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;)</p>
        <p>default - false</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">badgeNumberStyle</td>
      <td style="text-align:left">json</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC544;&#xB798;&#xC640; &#xAC19;&#xC740; Json&#xC73C;&#xB85C; badge style
          &#xC815;&#xC758;</p>
        <p>{
          <br />&quot;background&quot;: &quot;#f0f&quot;, // Container&#xC758; Color
          <br
          />&quot;color&quot;: &quot;red&quot;, // Badge font color
          <br />&quot;border-radius&quot;: &quot;10px&quot; // radius
          <br />}</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">Scrollable (&#xC2A4;&#xD06C;&#xB864;&#xC774; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;&#xB294; &#xC9E4;&#xB9BC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.icon</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC0C1;&#xD0DC; &#xC544;&#xC774;&#xCF58;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <ul>
          <li>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
            &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```text
{
    "type": "Display.ImageList2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "서비스명"}
    },
    "background": {"color": "#212171"},
    "badgeNumber": false,
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "data:image/png;base64,iVsomesomesomesome",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      }
    ]
}
```

### 







