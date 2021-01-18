# Display-Directive

### Close

화면 종료 요청입니다.

```text
{
  "header": {
    "namespace": "Display",
    "name": "Close",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ControlFocus

List item 의 포커스 이동 요청입니다.

```text
{
  "header": {
    "namespace": "Display",
    "name": "ControlFocus",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | Y | PREVIOUS, NEXT |

### ControlScroll

List 의 스크롤 이동 요청입니다.

```text
{
  "header": {
    "namespace": "Display",
    "name": "ControlScroll",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | Y | PREVIOUS, NEXT |

### Update

화면 갱신 요청입니다.

```text
{
  "header": {
    "namespace": "Display",
    "name": "Update",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    ...
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 변경된 template 의 token |
|  |  | Y | template payload 중 변경된 부분 |

## Directive - Template

### FullText1/2/3, ImageText1/2/3/4

```text
{
  "header": {
    "namespace": "Display",
    "name": "FullText1" | "FullText2" | "FullText2" | "FullText3" | "ImageText1" | "ImageText2" | "ImageText3" | "ImageText4",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "content": {
      "image": ImageObject,
      "imageAlign": "{{STRING}}"
      "header": TextObject,
      "body": TextObject,
      "footer": TextObject
    },
    "grammarGuide": GrammarGuide,
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left"><a href="./#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="./#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="./#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="./#backgroundobject">BackgroundObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>image</p>
      </td>
      <td style="text-align:left"><a href="./#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>imageAlign</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">LEFT, RIGHT</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <ul>
          <li>&#xC904;&#xBC14;&#xAFC8; &#xAC00;&#xB2A5; (&apos;\n&apos;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>body</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
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
      <td style="text-align:left">
        <p>content.</p>
        <p>footer</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF4;&#xC870; &#xC124;&#xBA85;</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left"><a href="./#grammarguide">GrammarGuide</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### TextList1/2, ImageList1/2/3

```text
{
  "header": {
    "namespace": "Display",
    "name": "TextList1" | "TextList2" | "ImageList1" | "ImageList2" | "ImageList3",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "badgeNumber": {{BOOLEAN}},
    "badgeNumberMode": "{{STRING}}",
    "focusable": {{BOOLEAN}},
    "anchorItemToken": "{{STRING}}",
    "listItems": [
      {
        "token": "{{STRING}}",
        "image": ImageObject,
        "icon": ImageObject,
        "header": TextObject,
        "body": TextObject,
        "footer": TextObject,
        "type": "{{STRING}}",
        "toggle": ToggleButtonObject,
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        }
      }
    ]
    "grammarGuide": GrammarGuide,
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left"><a href="./#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="./#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="./#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="./#backgroundobject">BackgroundObject</a>
      </td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;) PAGE(item&#xC758;
        &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744; &#xB54C;
        &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">focusable</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">List Template&#xC758; item&#xB4E4;&#xC774; focus &#xAC00;&#xB2A5;&#xD55C;&#xC9C0;
        &#xC5EC;&#xBD80; default - true</td>
    </tr>
    <tr>
      <td style="text-align:left">anchorItemToken</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display &#xB420; &#xB54C; &#xCCAB; &#xBC88;&#xC9F8;&#xB85C; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294;
        &#xC544;&#xC774;&#xD15C;&#xC758; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">array</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Scrollable</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>token</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>image</p>
      </td>
      <td style="text-align:left"><a href="./#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>icon</p>
      </td>
      <td style="text-align:left"><a href="./#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>body</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>footer</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>type</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>list item&#xC758; type&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;, &#xC815;&#xC758;&#xD558;&#xC9C0;
          &#xC54A;&#xC73C;&#xBA74; &#xC704;&#xC758; &#xC608;&#xC2DC;&#xC640; &#xAC19;&#xC740;
          &#xC77C;&#xBC18;&#xD615;&#xC744; &#xC758;&#xBBF8;&#xD568;.</p>
        <p>&quot;SEPARATOR&quot;&#xB85C; &#xC815;&#xC758;&#xD560; &#xACBD;&#xC6B0;&#xC5D0;&#xB294;
          &#xC544;&#xB798;&#xC640; &#xAC19;&#xC740; header&#xB9CC;&#xC774; &#xC720;&#xD6A8;&#xD55C;
          &#xAD6C;&#xBD84;&#xC6A9; &#xD0C0;&#xC774;&#xD2C0; &#xD56D;&#xBAA9;&#xC774;
          &#xD45C;&#xC2DC;&#xB428;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>toggle</p>
      </td>
      <td style="text-align:left"><a href="./#togglebuttonobject">ToggleButtonObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB9AC;&#xC2A4;&#xD2B8;&#xC544;&#xC774;&#xD15C;&#xC758; &#xC6B0;&#xCE21;&#xC5D0;
        &#xD45C;&#xC2DC;&#xB418;&#xB294; &#xD1A0;&#xAE00; &#xBC84;&#xD2BC;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>eventType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p></p>
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>textInput</p>
      </td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>textInput.</p>
        <p>text</p>
      </td>
      <td style="text-align:left">sring</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>textInput.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left"><a href="./#grammarguide">GrammarGuide</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### TextList3/4

```text
{
  "header": {
    "namespace": "Display",
    "name": "TextList3" | "TextList4",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.3"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "badgeNumber": {{BOOLEAN}},
    "badgeNumberMode": "{{STRING}}",
    "focusable": {{BOOLEAN}},
    "anchorItemToken": "{{STRING}}",
    "listItems": [
      {
        "token": "{{STRING}}",
        "image": ImageObject,
        "icon": ImageObject,
        "header": TextObject,
        "body": [TextObject],
        "footer": TextObject,
        "button": ToggleButtonObject,
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        }
      }
    ]
    "caption": TextObject,
    "grammarGuide": GrammarGuide,
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left"><a href="./#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="./#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="./#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="./#backgroundobject">BackgroundObject</a>
      </td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;) PAGE(item&#xC758;
        &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744; &#xB54C;
        &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">focusable</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">List Template&#xC758; item&#xB4E4;&#xC774; focus &#xAC00;&#xB2A5;&#xD55C;&#xC9C0;
        &#xC5EC;&#xBD80; default - true</td>
    </tr>
    <tr>
      <td style="text-align:left">anchorItemToken</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display &#xB420; &#xB54C; &#xCCAB; &#xBC88;&#xC9F8;&#xB85C; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294;
        &#xC544;&#xC774;&#xD15C;&#xC758; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">array</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Scrollable</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>token</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>image</p>
      </td>
      <td style="text-align:left"><a href="./#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>icon</p>
      </td>
      <td style="text-align:left"><a href="./#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>body</p>
      </td>
      <td style="text-align:left">array of <a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>footer</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>button</p>
      </td>
      <td style="text-align:left"><a href="./#button-object">ButtonObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>List &#xC544;&#xC774;&#xD15C;&#xC758; &#xBC84;&#xD2BC;</p>
        <p>body&#xAC00; 2&#xC904;&#xC778; &#xACBD;&#xC6B0;&#xC5D0; &#xCD5C;&#xC801;&#xD654;
          &#xB418;&#xC5B4; &#xC788;&#xC74C;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>eventType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p></p>
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>textInput</p>
      </td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>textInput.</p>
        <p>text</p>
      </td>
      <td style="text-align:left">sring</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>textInput.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">caption</td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC804;&#xCCB4; &#xB9AC;&#xC2A4;&#xD2B8; &#xC544;&#xC774;&#xD15C;&#xB4E4;&#xC5D0;
          &#xB300;&#xD55C; &#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <p>&#xD14D;&#xC2A4;&#xD2B8; &#xAE38;&#xC774; : &#xCD5C;&#xB300; 2&#xC904;(&#xB2E8;&#xB9D0;&#xC5D0;
          &#xB530;&#xB77C; 1&#xC904;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left"><a href="./#grammarguide">GrammarGuide</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### Weather1/2

```text
{
  "header": {
    "namespace": "Display",
    "name": "Weather1" | "Weather2",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "content": {
      "header": TextObject,
      "image": ImageObject,
      "temperature": {
        "current": TextObject,
        "max": TextObject,
        "min": TextObject
      },
      "body": TextObject,
      "footer": TextObject,
      "listItems": [
        {
          "header": TextObject,
          "image": ImageObject,
          "body": TextObject,
          "footer": TextObject
        }
      ]
    },
    "grammarGuide": GrammarGuide,
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left"><a href="./#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="./#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="./#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="./#backgroundobject">BackgroundObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB0A0;&#xC528;&#xC815;&#xBCF4;&#xB97C; &#xB098;&#xD0C0;&#xB0B4;&#xB294;
        &#xD5E4;&#xB354; &#xBB38;&#xC790;&#xC5F4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>image</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB0A0;&#xC528;&#xC815;&#xBCF4;&#xB97C; &#xB098;&#xD0C0;&#xB0B4;&#xB294;
        &#xC774;&#xBBF8;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>temperature.</p>
        <p>current</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD604;&#xC7AC; &#xC628;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>temperature.</p>
        <p>max</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xCD5C;&#xACE0; &#xC628;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>temperature.</p>
        <p>min</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xCD5C;&#xC800; &#xC628;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>body</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBBF8;&#xC138;&#xBA3C;&#xC9C0;, &#xC624;&#xC804;, &#xAC74;&#xC870;&#xC8FC;&#xC758;&#xBCF4;
          &#xB4F1;&#xC758; &#xB0A0;&#xC528;&#xC5D0; &#xB300;&#xD55C; &#xC124;&#xBA85;</p>
        <p>HTML &#xD45C;&#xD604; &#xAC00;&#xB2A5;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>footer</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">body &#xC544;&#xB798; &#xD45C;&#xD604;&#xB418;&#xB294; &#xD14D;&#xC2A4;&#xD2B8;(html
        &#xAC00;&#xB2A5;)</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>listItems</p>
      </td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC2DC;&#xAC04;&#xBCC4; &#xB0A0;&#xC528; &#xC815;&#xBCF4; &#xD45C;&#xD604;&#xC744;
        &#xC704;&#xD55C; &#xB9AC;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>listItems.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>listItems.</p>
        <p>image</p>
      </td>
      <td style="text-align:left"><a href="./#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>listItems.</p>
        <p>body</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>listItems.</p>
        <p>footer</p>
      </td>
      <td style="text-align:left"><a href="./#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left"><a href="./#grammarguide">GrammarGuide</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### Weather3/4

```text
{
  "header": {
    "namespace": "Display",
    "name": "Weather3" | "Weather4",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
      "playServiceId": "{{STRING}}",
      "token": "{{STRING}}",
      "contextLayer": "{{STRING}}",
      "duration": "{{STRING}}",
      "title": TextObject,
      "background": BackgroundObject,
      "content": {
        "listItems": [
          {
            "header": TextObject,
            "body": TextObject,
            "image": ImageObject,
            "temperature": {
              "max": TextObject,
              "min": TextObject
            },
            "footer": TextObject,
            "focus": {{Boolean}}
          }
        ]
      },
    "grammarGuide": GrammarGuide,
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** | template을 식별하기 위한 unique identifier |
| contextLayer | [ContextLayer](./#contextlayer) | N |  |
| duration | [Duration](./#duration) | N |  |
| title | [TitleObject](./#titleobject) | **Y** |  |
| background | [BackgroundObject](./#backgroundobject) | N |  |
| listItems | list | N | 현재는 최대 2개의 아이템을 보여주고 있음 |
| listItems. header | [TextObject](./#textobject) | N | item의 최상위 텍스트 |
| listItems. body | [TextObject](./#textobject) | N | item의 주요내용 텍스트 |
| listItems. image | [ImageObject](./#imageobject) | N | item의 주 이미지 |
| listItems. temperature. max | [TextObject](./#textobject) | N | 최대 온도 |
| listItems. temperature. min | [TextObject](./#textobject) | N | 최저 온도 |
| listItems. footer | [TextObject](./#textobject) | N | 기타정보를 위한 텍스트 |
| listItems. focus | boolean | N | focus 여부\(bold 처리\) |
| grammarGuide | [GrammarGuide](./#grammarguide) | N | 4.8 Grammar Guide 참조 |
| supportFocusedItemToken | bool | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | bool | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### Weather5

```text
{
  "header": {
    "namespace": "Display",
    "name": "Weather5",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "content": {
      "header": TextObject,
      "body": TextObject,
      "footer": TextObject,
      "progress": {{LONG}},
      "min": TextObject,
      "max": TextObject,
      "icon": ImageObject
    },
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** | template을 식별하기 위한 unique identifier |
| contextLayer | [ContextLayer](./#contextlayer) | N |  |
| duration | [Duration](./#duration)  | N | \#7\)DurationOption 참고 |
| title | [TitleObject](./#titleobject) | **Y** |  |
| background | [BackgroundObject](./#backgroundobject) | N |  |
| content. header | [TextObject](./#textobject) | N | 헤더 문자열 |
| content. body | [TextObject](./#textobject) | N | 게이지 중앙의 문자열 |
| content. footer | [TextObject](./#textobject) | N | 게이지 중앙 하단의 부연 문자열 |
| content. progress | long | N | 게이지 진행도\(0에서 1사이의 값\) |
| content. progressColor | String | N | 게이지의 색\(default는 red\) |
| content. min | [TextObject](./#textobject) | N | 게이지 최저값 |
| content. max | [TextObject](./#textobject) | N | 게이지 최고값 |
| content. icon | [ImageObject](./#imageobject) | N | 게이지 아이콘 이미지 |
| grammarGuide | [GrammarGuide](./#grammarguide) | N | 4.8 Grammar Guide 참조 |
| supportFocusedItemToken | boolean | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | boolean | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### FullImage

```text
{
  "header": {
    "namespace": "Display",
    "name": "FullImage",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "content": {
      "image": ImageObject
    },
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** | template을 식별하기 위한 unique identifier |
| contextLayer | string | N | \#10\)Context Layer Option 참고 |
| duration | string | N | \#7\)DurationOption 참고 |
| title | [TitleObject](./#titleobject) | **Y** |  |
| background | [BackgroundObject](./#backgroundobject) | N |  |
| content. image | [ImageObject](./#imageobject) | **Y** |  |
| grammarGuide | array of string | N | 4.8 Grammar Guide 참조 |
| supportFocusedItemToken | boolean | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | boolean | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### Score1

```text
{
  "header": {
    "namespace": "Display",
    "name": "Score1",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "content": {
      "schedule": TextObject,
      "status": TextObject,
      "match": [
        {
          "header": TextObject,
          "body": TextObject,
          "footer": TextObject,
          "image": ImageObject,
          "score": TextObject
        }
      ]
    },
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** | template을 식별하기 위한 unique identifier |
| contextLayer | string | N | \#10\)Context Layer Option 참고 |
| duration | string | N | \#7\)DurationOption 참고 |
| title | [TitleObject](./#titleobject) | **Y** |  |
| background | BackgroundObject | N |  |
| content. schedule | TextObject | N | 경기 스케줄 정보 |
| content. status | TextObject | **Y** | 경기 상태 |
| content. match | list | **Y** | 팀정보를 노출하기 위한 리스트 |
| content. match. header | TextObject | **Y** | 본문 제목\(1줄\) |
| content. match. body | TextObject | N | 본문 내용\(1줄\) |
| content. match. footer | TextObject | N | 보조 설명\(2줄\) |
| content. match. image | ImageObject | **Y** | 팀로고 |
| content. match. score | TextObject | **Y** | 스코어 |
| grammarGuide | list of string | N | 4.8 Grammar Guide 참조 |
| supportFocusedItemToken | boolean | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | boolean | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### **Score2**

```text
{
  "header": {
    "namespace": "Display",
    "name": "Score2",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "listItems": [
      {
        "token": "{{STRING}}",
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        },
        "schedule": TextObject,
        "status": TextObject,
        "match": [
          {
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject,
            "image": ImageObject,
            "score": TextObject
          }
        ]
      }
    ],
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
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
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />schedule</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xACBD;&#xAE30; &#xC2A4;&#xCF00;&#xC904; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />status</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xACBD;&#xAE30; &#xC0C1;&#xD0DC;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />match</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD300;&#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />match.
        <br />header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;(1&#xC904;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />match.
        <br />body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;(2&#xC904;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />match.
        <br />image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD300;&#xB85C;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />match.
        <br />score</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC2A4;&#xCF54;&#xC5B4;</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### **SearchList1**

```text
{
  "header": {
    "namespace": "Display",
    "name": "SearchList1",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "badgeNumber": {{Boolean}},
    "badgeNumberMode": "{{STRING}}",
    "listItems": [
      {
        "token": "{{STRING}}",
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        },
        "title": TextObject,
        "subtitle": TextObject,
        "description": TextObject,
        "image": ImageObject,
        "category": "{{String}}",
        "badge": TextObject,
        "subBadge": TextObject,
        "subIcon": ImageObject
      }
    ],
    "grammarGuide": [],
    "metadata": {},
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        <br
        />IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;)
        <br />PAGE(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744;
        &#xB54C; &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        <br
        />default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />title</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">item&#xC758; &#xC81C;&#xBAA9; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />subtitle</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">category&#xAC00; people, epg&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        &#xD45C;&#xC2DC;&#xB428;.</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />description</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">category&#xAC00; people&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC; &#xD45C;&#xC2DC;&#xB428;.</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>item&#xC758; &#xBC30;&#xACBD; &#xC774;&#xBBF8;&#xC9C0;</p>
        <p>vod, epg&#xC778; &#xACBD;&#xC6B0;&#xB294; &#xD544;&#xC218;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />category</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>item&#xC758; &#xC885;&#xB958;.</p>
        <p>vod, epg, people &#xC911; &#xD55C;&#xAC00;&#xC9C0; &#xAC12;&#xC744; &#xAC00;&#xC838;&#xC57C;
          &#xD568;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />badge</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC544;&#xC774;&#xD15C; &#xC6B0;&#xC0C1;&#xB2E8;&#xC5D0; &#xD45C;&#xC2DC;&#xB418;&#xB294;
        &#xBC43;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />subBadge</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC544;&#xC774;&#xD15C; &#xC88C;&#xC0C1;&#xB2E8;&#xC5D0; &#xD45C;&#xC2DC;&#xB418;&#xB294;
        &#xBC43;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />subIcon</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">epg category&#xC778; &#xACBD;&#xC6B0;, subtitle &#xC88C;&#xCE21;&#xC5D0;
        &#xD45C;&#xC2DC;&#xB418;&#xB294; icon</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">metadata</td>
      <td style="text-align:left">jsonObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display&#xC5D0; &#xB300;&#xD55C; &#xC784;&#xC758;&#xC758; &#xBD80;&#xAC00;&#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### **SearchList2**

```text
{
  "header": {
    "namespace": "Display",
    "name": "SearchList2",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "content": {
      "body": TextObject,
      "footer": TextObject,
      "listItems": [
        {
          "token": "{{STRING}}",
          "eventType": "{{STRING}}",
          "textInput": {
            "text": "{{STRING}}",
            "playServiceId": "{{STRING}}"
          },
          "header": TextObject
        }
      ]
    },
    "grammarGuide": [],
    "metadata": {},
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
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
      <td style="text-align:left">content.
        <br />body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />listItems.
        <br />header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">metadata</td>
      <td style="text-align:left">jsonObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display&#xC5D0; &#xB300;&#xD55C; &#xC784;&#xC758;&#xC758; &#xBD80;&#xAC00;&#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

```text
{
  "header": {
    "namespace": "Display",
    "name": "UnifiedSearch1",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "badgeNumber": {{Boolean}},
    "badgeNumberMode": "{{STRING}}",
    "listItems": [
      {
        "type": "{{STRING}}",
        "token": "{{STRING}}",
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        },
        "title": TextObject,
        "titleIcon": ImageObject,
        "subtitle": TextObject,
        "description": TextObject,
        "image": ImageObject
      }
    ],
    "grammarGuide": [],
    "metadata": {},
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">titltIcon</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        <br
        />IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;)
        <br />PAGE(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744;
        &#xB54C; &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        <br
        />default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xC544;&#xC774;&#xD15C;&#xC758; &#xD0C0;&#xC785;</p>
        <ul>
          <li><b>MAIN</b> - &#xD604;&#xC7AC; &#xCC98;&#xB9AC; &#xC911;&#xC778; &#xB3C4;&#xBA54;&#xC778;&#xC758;
            &#xC544;&#xC774;&#xD15C; (ex. &#xBE44;&#xB514;&#xC624;)</li>
          <li><b>TOPIC</b>
            <ul>
              <li>
                <img src="http://tde.sktelecom.com/wiki/download/thumbnails/312160250/image2020-8-31_18-14-43.png?version=1&amp;modificationDate=1599097269000&amp;api=v2"
                alt/>
              </li>
              <li><b>&#xB2E4;&#xB978; &#xB9AC;&#xC2A4;&#xD2B8; &#xC544;&#xC784;&#xD15C;&#xACFC; &#xB3D9;&#xC77C;&#xD558;&#xAC8C; &#xC2A4;&#xD06C;&#xB864;</b>
              </li>
            </ul>
          </li>
          <li><b>SEPARATOR</b> - &#xB9AC;&#xC2A4;&#xD2B8; &#xC544;&#xC774;&#xD15C;&#xAC04;&#xC758;
            &#xAD6C;&#xBD84;&#xC790; (&#xD074;&#xB9AD;&#xD560; &#xC218; &#xC5C6;&#xC74C;)</li>
          <li><b>ETC</b> - &#xB2E4;&#xB978; &#xB3C4;&#xBA54;&#xC778;&#xC5D0;&#xC11C;
            &#xCC98;&#xB9AC;&#xD558;&#xAE30; &#xC704;&#xD55C; &#xC544;&#xC774;&#xD15C;
            (ex. &#xC74C;&#xC545;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>MAIN</b> - <b>mandatory</b>
          </li>
          <li><b>TOPIC</b> - <b>optional</b> (&#xD3EC;&#xD568;&#xB418;&#xB294; &#xACBD;&#xC6B0;
            &#xD574;&#xB2F9; &#xD56D;&#xBAA9;&#xC744; &#xD074;&#xB9AD;&#xD560; &#xC218;
            &#xC788;&#xC74C;)
            <ul>
              <li>token&#xC744; &#xD3EC;&#xD568;&#xD558;&#xC9C0; &#xC54A;&#xC73C;&#xBA74;
                &#xD074;&#xB9AD;&#xD560; &#xC218; &#xC5C6;&#xACE0;, focus&#xB3C4; &#xC774;&#xB3D9;&#xD558;&#xC9C0;
                &#xC54A;&#xC73C;&#xBA70;, context&#xC758; visibleTokenList&#xC5D0;&#xB3C4;
                &#xD3EC;&#xD568;&#xB418;&#xC9C0; &#xC54A;&#xC74C;</li>
            </ul>
          </li>
          <li><b>SEPARATOR</b> - <b>&#xD3EC;&#xD568;&#xD558;&#xBA74; &#xC548;&#xB428;</b>
          </li>
          <li><b>ETC</b> - <b>mandatory</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />title</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">item&#xC758; &#xC81C;&#xBAA9; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />subtitle</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">category&#xAC00; people, epg&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        &#xD45C;&#xC2DC;&#xB428;.</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />description</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">category&#xAC00; people&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC; &#xD45C;&#xC2DC;&#xB428;.</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>item&#xC758; &#xBC30;&#xACBD; &#xC774;&#xBBF8;&#xC9C0;</p>
        <p>vod, epg&#xC778; &#xACBD;&#xC6B0;&#xB294; &#xD544;&#xC218;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />category</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">
        <p>N</p>
        <p>(listItems.type == <b>MAIN</b>&#xC774;&#xBA74; <b>Y</b>)</p>
      </td>
      <td style="text-align:left">
        <p>type&#xC774; MAIN&#xC778; &#xACBD;&#xC6B0;&#xB294; &#xAF2D; &#xD3EC;&#xD568;&#xD574;&#xC57C;
          &#xD568;</p>
        <p>item&#xC758; &#xC885;&#xB958;.</p>
        <p>vod, epg, people &#xC911; &#xD55C;&#xAC00;&#xC9C0; &#xAC12;&#xC744; &#xAC00;&#xC838;&#xC57C;
          &#xD568;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />subIcon</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">epg category&#xC778; &#xACBD;&#xC6B0;, subtitle &#xC88C;&#xCE21;&#xC5D0;
        &#xD45C;&#xC2DC;&#xB418;&#xB294; icon</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />progress</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>epg category&#xC778; &#xACBD;&#xC6B0;, image &#xC544;&#xB798;&#xC5D0;
          &#xD45C;&#xC2DC;&#xB418;&#xB294; &#xD504;&#xB85C;&#xADF8;&#xB808;&#xC2A4;&#xBC14;</p>
        <ul>
          <li>0~100&#xC758; &#xAC12;&#xC744; &#xAC00;&#xC9C0;&#xBA70; %&#xB97C; &#xC758;&#xBBF8;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />topLeft</td>
      <td style="text-align:left">BadgeObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC544;&#xC774;&#xD15C; &#xC88C;&#xC0C1;&#xB2E8;&#xC5D0; &#xD45C;&#xC2DC;&#xB418;&#xB294;
        &#xBC43;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />topRight</td>
      <td style="text-align:left">BadgeObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC544;&#xC774;&#xD15C; &#xC6B0;&#xC0C1;&#xB2E8;&#xC5D0; &#xD45C;&#xC2DC;&#xB418;&#xB294;
        &#xBC43;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />bottomLeft</td>
      <td style="text-align:left">BadgeObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC544;&#xC774;&#xD15C; &#xC88C;&#xD558;&#xB2E8;&#xC5D0; &#xD45C;&#xC2DC;&#xB418;&#xB294;
        &#xBC43;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />bottomRight</td>
      <td style="text-align:left">BadgeObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC544;&#xC774;&#xD15C; &#xC6B0;&#xD558;&#xB2E8;&#xC5D0; &#xD45C;&#xC2DC;&#xB418;&#xB294;
        &#xBC43;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">metadata</td>
      <td style="text-align:left">jsonObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display&#xC5D0; &#xB300;&#xD55C; &#xC784;&#xC758;&#xC758; &#xBD80;&#xAC00;&#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### **CommerceList**

```text
{
  "header": {
    "namespace": "Display",
    "name": "CommerceList",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "badgeNumber": {{Boolean}},
    "badgeNumberMode": "{{STRING}}",
    "focusable": {{Boolean}},
    "anchorItemToken": "{{STRING}}",
    "listItems": [
      {
        "token": "{{STRING}}",
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        },
        "image": ImageObject,
        "header": TextObject,
        "body": TextObject,
        "footer": TextObject,
        "detail": TextObject,
        "price": TextObject,
        "priceDesc": TextObject
      }
    ],
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        <br
        />IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;)
        <br />PAGE(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744;
        &#xB54C; &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        <br
        />default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">focusable</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">List Template&#xC758; item&#xB4E4;&#xC774; focus &#xAC00;&#xB2A5;&#xD55C;&#xC9C0;
        &#xC5EC;&#xBD80;
        <br />default - true</td>
    </tr>
    <tr>
      <td style="text-align:left">anchorItemToken</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display &#xB420; &#xB54C; &#xCCAB; &#xBC88;&#xC9F8;&#xB85C; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294;
        &#xC544;&#xC774;&#xD15C;&#xC758; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC0C1;&#xD488; &#xC774;&#xBBF8;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC81C;&#xBAA9; (&#xC0C1;&#xD488;&#xBA85;-&#xCD5C;&#xB300; 2&#xC904;
        &#xB178;&#xCD9C;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9; (&#xC635;&#xC158;/&#xC0C1;&#xC138; &#xC124;&#xBA85;-&#xCD5C;&#xB300;
        1&#xC904;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF4;&#xC870; &#xC124;&#xBA85;1 (&#xCD5C;&#xC0C1;&#xB2E8;&#xC5D0; &#xB178;&#xCD9C;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />detail</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF4;&#xC870; &#xC124;&#xBA85;2</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />price</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xAC00;&#xACA9; &#xC815;&#xBCF4;1</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />priceDesc</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC00;&#xACA9; &#xC815;&#xBCF4;2</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### **CommerceOption**

```text
{
  "header": {
    "namespace": "Display",
    "name": "CommerceOption",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "badgeNumber": {{Boolean}},
    "badgeNumberMode": "{{STRING}}",
    "focusable": {{Boolean}},
    "anchorItemToken": "{{STRING}}",
    "content": {
      "image": ImageObject,
      "header": TextObject,
      "body": TextObject,
      "price": TextObject,
      "priceDesc": TextObject,
      "listItems": [
        {
          "token": "{{STRING}}",
          "eventType": "{{STRING}}",
          "textInput": {
            "text": "{{STRING}}",
            "playServiceId": "{{STRING}}"
          },
          "header": TextObject
        }
      ]
    },
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        <br
        />IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;)
        <br />PAGE(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744;
        &#xB54C; &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        <br
        />default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">focusable</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">List Template&#xC758; item&#xB4E4;&#xC774; focus &#xAC00;&#xB2A5;&#xD55C;&#xC9C0;
        &#xC5EC;&#xBD80;
        <br />default - true</td>
    </tr>
    <tr>
      <td style="text-align:left">anchorItemToken</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display &#xB420; &#xB54C; &#xCCAB; &#xBC88;&#xC9F8;&#xB85C; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294;
        &#xC544;&#xC774;&#xD15C;&#xC758; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC0C1;&#xD488; &#xC774;&#xBBF8;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC81C;&#xBAA9; (&#xC0C1;&#xD488;&#xBA85;-&#xCD5C;&#xB300; 2&#xC904;
        &#xB178;&#xCD9C;)</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9; (&#xC0C1;&#xD488; &#xC635;&#xC158;/&#xC0C1;&#xC138;
        &#xC124;&#xBA85;-&#xCD5C;&#xB300; 2&#xC904; &#xB178;&#xCD9C;)</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />price</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xAC00;&#xACA9; &#xC815;&#xBCF4;1</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />priceDesc</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC00;&#xACA9; &#xC815;&#xBCF4;2</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC635;&#xC158; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC635;&#xC158; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xBCF4;&#xC870;&#xC124;&#xBA85;(&#xC635;&#xC158;&#xBA85;-&#xCD5C;&#xB300;
        4&#xC904;)</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### **CommercePrice**

```text
{
  "header": {
    "namespace": "Display",
    "name": "CommercePrice",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "content": {
      "image": ImageObject,
      "header": TextObject,
      "body": TextObject,
      "price": TextObject,
      "priceDesc": TextObject,
      "icon": ImageObject,
      "subText": TextObject,
      "totalPrice": TextObject,
      "totalPriceDesc": TextObject,
      "confirm": ButtonObject,
      "cancel": ButtonObject,
      "next": ButtonObject,
      "prev": ButtonObject
    },
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** | template을 식별하기 위한 unique identifier |
| contextLayer | string | N | \#10\)Context Layer Option 참고 |
| duration | string | N | \#7\)DurationOption 참고 |
| title | TitleObject | **Y** |  |
| content. image | ImageObject | **Y** | 상품 이미지 |
| content. header | TextObject | **Y** | 제목 \(상품명-최대 2줄\) |
| content. body | TextObject | N | 본문 내용 \(상품 옵션/상세 설명-최대 2줄\) |
| content. price | TextObject | **Y** | 가격 정보1 |
| content. priceDesc | TextObject | N | 가격 정보2 |
| content. icon | ImageObject | N | 결제 정보 아이콘 \(ex. sk pay 이미지\) |
| content. subText | TextObject | N | 보조 설명 |
| content. totalPrice | TextObject | **Y** | 가격정보3 \(최종 결제 금액\) |
| content. totalPriceDesc | TextObject | N | 가격정보4 \(최종 결제 금액 설명\)  |
| content. confirm | ButtonObject | **Y** | 확인\(결제\) 버튼 |
| content. cancel | ButtonObject | N | 취소 버튼 |
| content. prev | ButtonObject | N | 이전 페이지 이동\(포커스 이동은 안되며 리모콘 '&lt;' 키로만 호출 가능\) |
| content. next | ButtonObject | N | 다음 페이지 이동\(포커스 이동은 안되며 리모콘 '&gt;' 키로만 호출 가능\) |
| grammarGuide | list of string | N | 4.8 Grammar Guide 참조 |
| supportFocusedItemToken | boolean | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | boolean | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### **CommerceInfo**

```text
{
  "header": {
    "namespace": "Display",
    "name": "CommerceInfo",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "content": {
      "image": ImageObject,
      "header": TextObject,
      "body": TextObject,
      "price": TextObject,
      "priceDesc": TextObject,
      "subText1": TextObject,
      "subText2": TextObject,
      "subText3": TextObject,
      "button": ButtonObject,
      "prev": ButtonObject,
      "next": ButtonObject
    },
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** | template을 식별하기 위한 unique identifier |
| contextLayer | string | N | \#10\)Context Layer Option 참고 |
| duration | string | N | \#7\)DurationOption 참고 |
| title | TitleObject | **Y** |  |
| content. image | ImageObject | **Y** | 상품 이미지 |
| content. header | TextObject | **Y** | 제목 \(상품명-최대 1줄\) |
| content. body | TextObject | N | 본문 내용 \(상품 옵션/상세 설명-최대 1줄\) |
| content. price | TextObject | **Y** | 가격 정보1 |
| content. priceDesc | TextObject | N | 가격 정보2 |
| content. subText1 | TextObjet | N | 우측 보조설명1 \(최대 2줄\) |
| content. subText2 | TextObjet | N | 우측 보조설명2 \(최대 2줄\) |
| content. subText3 | TextObjet | N | 우측 보조설명3 \(최대 2줄\) |
| content. button | ButtonObject | N |  |
| content. prev | ButtonObject | N | 이전 페이지 이동\(포커스 이동은 안되며 리모콘 '&lt;' 키 이벤트만 적용\) |
| content. next | ButtonObject | N | 다음 페이지 이동\(포커스 이동은 안되며 리모콘 '&gt;' 키 이벤트만 적용\) |
| grammarGuide | list of string | N | 4.8 Grammar Guide 참조 |
| supportFocusedItemToken | boolean | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | boolean | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### **Call1**

```text
{
  "header": {
    "namespace": "Display",
    "name": "Call1",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "badgeNumber": {{Boolean}},
    "badgeNumberMode": "{{STRING}}",
    "listItems": [
      {
        "token": "{{String}}",
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        },
        "image": ImageObject,
        "title": TextObject,
        "subtitle": TextObject,
        "newBadge": {{Boolean}},
        "icon": ImageObject,
        "inactive": {{Boolean}}
      }
    ],
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xD504;&#xB85C;&#xD544; &#xC774;&#xBBF8;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />title</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />subtitle</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />newBadge</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC88C;&#xCE21; &#xC0C1;&#xB2E8; &#xBD89;&#xC740; &#xC810; &#xD45C;&#xC2DC;
        &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />icon</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC774;&#xBBF8;&#xC9C0; &#xD6C4;&#xCE21;&#xD558;&#xB2E8;&#xC758; &#xC544;&#xC774;&#xCF58;
        &#xC774;&#xBBF8;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />inactive</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">dimmed &#xBC0F; focus &#xC774;&#xB3D9;&#xC2DC; &#xBB34;&#xC2DC; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        <br
        />IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;)
        <br />PAGE(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744;
        &#xB54C; &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        <br
        />default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### **Call2**

```text
{
  "header": {
    "namespace": "Display",
    "name": "Call2",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "content": {
      "image": ImageObject,
      "icon": ImageObject,
      "header": TextObject,
      "body": TextObject,
      "footer": TextObject,
      "description": TextObject,
      "headerIcon": ImageObject,
      "footerIcon": ImageObject,
      "rightArea": {
        "button": {
          "icon": ImageObject,
          "text": TextObject,
          "token": "{{String}}"
        },
        "headerIcon": ImageObject,
        "header": TextObject,
        "body": TextObject
      },
      "prevButton": {
        "token": "{{String}}"
      },
      "nextButton": {
        "token": "{{String}}"
      }
    },
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** | template을 식별하기 위한 unique identifier |
| contextLayer | string | N | \#10\)Context Layer Option 참고 |
| duration | string | N | \#7\)DurationOption 참고 |
| title | TitleObject | **Y** |  |
| content. image | ImageObject | **Y** | 프로필 이미지 |
| content. icon | ImageObject | N | 뱃지 이미지 |
| content. header | TextObject | N | 이름 영역 |
| content. body | TextObject | N | 전화변호 영역 |
| content. footer | TextObject | N | 주소 영역 |
| content. description | TextObject | N | 부연설명 영역 |
| content. headerIcon | ImageObject | N | header 우측 아이콘 |
| content. footerIcon | ImageObject | N | footer 좌측 아이콘 |
| content. rightArea |  | N | 우측 부가정보 영역 |
| content. rightArea. button |  | N | 우측 부가정보 영역 내의 버튼 |
| content. rightArea. button. icon | ImageObject | N | 버튼 아이콘 이미지 |
| content. rightArea. button. text | TextObject | N | 버튼 텍스트 |
| content. rightArea. button. token | string | Y | button 객체를 정의한 경우에는 필수 |
| content. rightArea. headerIcon | ImageObject | N | header 좌측 아이콘 이미지 |
| content. rightArea. header | TextObject | N | header text |
| content. rightArea. body | TextObject | N | body text |
| content. nextButton. token | string | Y | nextButton 객체는 선택이지만, nextButton 객체가 정의된다면 필수. |
| content. prevButton. token | string | Y | prevButton 객체는 선택이지만, prevButton객체가 정의된다면 필수. |
| grammarGuide | list of string | N | 4.8 Grammar Guide 참조 |
| supportFocusedItemToken | boolean | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | boolean | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### Call3

```text
{
  "header": {
    "namespace": "Display",
    "name": "Call3",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "profileImageUrl": "{{STRING}}",
    "mdn": "{{STRING}}",
    "name": "{{STRING}}",
    "nameImageUrl": "{{STRING}}",
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">profileImageUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xB2E4;&#xB978; &#xC0AC;&#xB78C;&#xACFC; &#xD1B5;&#xD654;&#xC77C;&#xB54C;
        &#xC0C1;&#xB300;&#xBC29;&#xC758; profile image url(Device&#xC77C; &#xACBD;&#xC6B0;&#xB294;
        Device image URL)</td>
    </tr>
    <tr>
      <td style="text-align:left">nameImageUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0C1;&#xB300;&#xBC29;&#xC758; display name &#xC6B0;&#xCE21;&#xC5D0;
          &#xD45C;&#xC2DC;&#xB418;&#xB294; &#xC774;&#xBBF8;&#xC9C0;URL</p>
        <p>(T114 &#xC77C;&#xACBD;&#xC6B0; &#xC774;&#xBBF8;&#xC9C0; &#xC544;&#xC774;&#xCF58;
          URL)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC0C1;&#xB300;&#xBC29;&#xC758; display name</td>
    </tr>
    <tr>
      <td style="text-align:left">mdn</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC0C1;&#xB300;&#xBC29;&#xC758; display mdn</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
  </tbody>
</table>

### **Timer**

```text
{
  "header": {
    "namespace": "Display",
    "name": "Timer",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.3"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "alertType": "{{STRING}}",
    "scheduledTime": "{{STRING}}",
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | timer 관련 token |
| contextLayer | string | N | \#10\)Context Layer Option 참고 |
| duration | string | N | \#7\)DurationOption 참고 |
| alertType | string | Y | alert의 종류 \(TIMER, SLEEP\) |
| scheduledTime | string | Y | alert이 동작하는 시간 정보\(ISO 8601 포맷, ex. 2019-11-25T20:20:30\) |
| supportFocusedItemToken | boolean | N | Context에 있는 focusedItemToken이 지원되어야 하는지 여부 |
| supportVisibleTokenList | boolean | N | Context에 있는 visibleTokenList가 지원되어야 하는지 여부 |

### **Dummy**

* Display Interface에서 제공하는 화면은 완성된 데이터를 클라이언트로 전송하여 Webview 또는 클라이언트에서 직접 화면을 그리기 위해 사용됨
* 이와 달리 Dummy는 리스트의 일부 데이터만 전달하고, 클라이언트에서 부족한 데이터를 직접 추가해서 그리기 위해 정의함
  * 클라이언트에서 정보 보안 이슈로 서버로 올릴 수 없는 데이터는 DummyTemplate을 받아 필요한 데이터를 채운 뒤에 Display할 수 있음
* Dummy는 데이터만을 전달하기 때문에 적절한 타입으로 변환하여 Webview를 호출해도 되고, 클라이언트에서 임의의 형식으로 그려도 관계없음

```text
{
  "header": {
    "namespace": "Display",
    "name": "Dummy",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.5"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "subType": "{{STRING}}",
    "contextLayer": "{{STRING}}",
    "duration": "{{STRING}}",
    "title": TitleObject,
    "background": BackgroundObject,
    "badgeNumber": {{Boolean}},
    "badgeNumberMode": "{{STRING}}",
    "focusable": {{Boolean}},
    "anchorItemToken": "{{STRING}}",
    "listItems": [
      {
        "token": "{{STRING}}",
        "eventType": "{{STRING}}",
        "textInput": {
          "text": "{{STRING}}",
          "playServiceId": "{{STRING}}"
        },
        "image": ImageObject,
        "header": TextObject,
        "body": TextObject,
        "footer": TextObject,
        "data": {},
        "postback": {}
      }
    ],
    "buttonList": [],
    "grammarGuide": [],
    "supportFocusedItemToken": {{Boolean}},
    "supportVisibleTokenList": {{Boolean}},
    "data": {}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">template&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique
        identifier</td>
    </tr>
    <tr>
      <td style="text-align:left">subType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB77C;&#xC774;&#xC5B8;&#xD2B8;&#xC5D0;&#xC11C; &#xC790;&#xCCB4;&#xC801;&#xC73C;&#xB85C;
          &#xC815;&#xC758;&#xD55C; subType&#xC744; &#xD1B5;&#xD574; Dummy&#xB97C;
          &#xC5B4;&#xB5BB;&#xAC8C; &#xB514;&#xC2A4;&#xD50C;&#xB808;&#xC774;&#xD574;&#xC57C;
          &#xD560;&#xC9C0; &#xC2DD;&#xBCC4;</p>
        <p>Dummy&#xB294; &#xB2E4;&#xC591;&#xD55C; &#xD615;&#xD0DC;&#xB85C; &#xB514;&#xC2A4;&#xD50C;&#xB808;&#xC774;&#xB420;
          &#xC218; &#xC788;&#xAE30; &#xB54C;&#xBB38;&#xC5D0; &#xC815;&#xC758;&#xD588;&#xC73C;&#xBA70;,
          &#xC784;&#xC758;&#xC758; &#xAC12;&#xC744; &#xC0AC;&#xC6A9;&#xD560; &#xC218;
          &#xC788;&#xC74C;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">contextLayer</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#10)Context Layer Option &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">#7)DurationOption &#xCC38;&#xACE0;</td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left">N</td>
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
      <td style="text-align:left">badgeNumberMode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">badge &#xC22B;&#xC790;&#xB97C; &#xC124;&#xC815;&#xD558;&#xB294; &#xBC29;&#xBC95;
        <br
        />IMMUTABILITY(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5B4;&#xB3C4;
        badge &#xC22B;&#xC790;&#xB294; &#xC720;&#xC9C0;&#xB428;)
        <br />PAGE(item&#xC758; &#xC704;&#xCE58;&#xAC00; &#xBCC0;&#xACBD;&#xB418;&#xC5C8;&#xC744;
        &#xB54C; &#xCCAB; &#xBC88;&#xC9F8; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; item&#xC758;
        badge &#xC22B;&#xC790;&#xAC00; 1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xB428;)
        <br
        />default - IMMUTABILITY</td>
    </tr>
    <tr>
      <td style="text-align:left">focusable</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">List Template&#xC758; item&#xB4E4;&#xC774; focus &#xAC00;&#xB2A5;&#xD55C;&#xC9C0;
        &#xC5EC;&#xBD80;
        <br />default - true</td>
    </tr>
    <tr>
      <td style="text-align:left">anchorItemToken</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">display &#xB420; &#xB54C; &#xCCAB; &#xBC88;&#xC9F8;&#xB85C; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294;
        &#xC544;&#xC774;&#xD15C;&#xC758; &#xD1A0;&#xD070;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Scrollable (&#xC2A4;&#xD06C;&#xB864;&#xC774; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;&#xB294; &#xC9E4;&#xB9BC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD074;&#xB9AD;&#xC740; &#xD55C; item &#xC804;&#xCCB4;&#xC5D0;&#xC11C;
        &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />eventType</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xD50C;&#xB7AB;&#xD3FC;&#xC73C;&#xB85C; &#xC804;&#xB2EC;&#xD558;&#xB294;
          Event Type (Capability &#xBA85;&#xACFC; Event&#xB97C; &#xBAA8;&#xB450;
          &#xBA85;&#xC2DC;&#xD574;&#xC57C; &#xD568;)</p>
        <ul>
          <li><b>Display.ElementSelected</b> - default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
          <li><b>Text.TextInput </b>- default (eventType &#xAC12;&#xC774; &#xC5C6;&#xB294;
            &#xACBD;&#xC6B0; &#xAE30;&#xBCF8;&#xAC12;)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />textInput.
        <br />playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />body</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />footer</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBCF4;&#xC870;&#xC124;&#xBA85;</p>
        <p>&#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
          &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.
        <br />type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>list item&#xC758; type&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;, &#xC815;&#xC758;&#xD558;&#xC9C0;
          &#xC54A;&#xC73C;&#xBA74; &#xC704;&#xC758; &#xC608;&#xC2DC;&#xC640; &#xAC19;&#xC740;
          &#xC77C;&#xBC18;&#xD615;&#xC744; &#xC758;&#xBBF8;&#xD568;.</p>
        <p>&quot;SEPARATOR&quot;&#xB85C; &#xC815;&#xC758;&#xD560; &#xACBD;&#xC6B0;&#xC5D0;&#xB294;
          &#xC544;&#xB798;&#xC640; &#xAC19;&#xC740; header&#xB9CC;&#xC774; &#xC720;&#xD6A8;&#xD55C;
          &#xAD6C;&#xBD84;&#xC6A9; &#xD0C0;&#xC774;&#xD2C0; &#xD56D;&#xBAA9;&#xC774;
          &#xD45C;&#xC2DC;&#xB428;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItem.
        <br />toggle</td>
      <td style="text-align:left">ToggleButtonObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xB9AC;&#xC2A4;&#xD2B8;&#xC544;&#xC774;&#xD15C;&#xC758; &#xC6B0;&#xCE21;&#xC5D0;
          &#xD45C;&#xC2DC;&#xB418;&#xB294; &#xD1A0;&#xAE00; &#xBC84;&#xD2BC;</p>
        <p>4.9 ToggleButtonObject &#xCC38;&#xC870;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">listItem.
        <br />data</td>
      <td style="text-align:left">Object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC01; item &#xBCC4;&#xB85C; &#xCD94;&#xAC00;&#xB85C; &#xD544;&#xC694;&#xD55C;
        &#xB370;&#xC774;&#xD130;&#xB97C; JSON &#xD3EC;&#xB9F7;&#xC73C;&#xB85C;
        &#xCD94;&#xAC00; &#xAC00;&#xB2A5;</td>
    </tr>
    <tr>
      <td style="text-align:left">listItem.
        <br />postback</td>
      <td style="text-align:left">Object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xC804;&#xB2EC;&#xB418;&#xB294; &#xC784;&#xC758;&#xC758;
          Object</p>
        <ul>
          <li>&#xBC84;&#xD2BC; &#xD074;&#xB9AD; &#xC2DC; &#xB3D9;&#xC791;&#xC744; &#xC704;&#xD574;
            &#xD544;&#xC694;&#xD55C; &#xC815;&#xBCF4;&#xB97C; &#xC784;&#xC758;&#xC758;
            JSON &#xD3EC;&#xB9F7;&#xC73C;&#xB85C; &#xCD94;&#xAC00; &#xAC00;&#xB2A5;</li>
          <li>&#xAE30;&#xC874;&#x3137;&#xC5D0; token&#xC744; &#xC774; &#xC6A9;&#xB3C4;&#xB85C;
            &#xD65C;&#xC6A9;&#xD558;&#xB294; &#xACBD;&#xC6B0;&#xAC00; &#xB9CE;&#xC558;&#xB294;&#xB370;,
            token&#xC740; identifier &#xC5ED;&#xD560;&#xC744; &#xD558;&#xB3C4;&#xB85D;
            &#xD558;&#xAE30; &#xC704;&#xD574; &#xCD94;&#xAC00;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">buttonList</td>
      <td style="text-align:left">list of ButtonObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Template &#xD558;&#xB2E8;&#xC758; &#xC120;&#xD0DD; &#xBC84;&#xD2BC;(ex&gt;
        &quot;&#xCDE8;&#xC18C;&quot;, &quot;&#xD655;&#xC778;&quot;)</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">4.8 Grammar Guide &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportFocusedItemToken</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; focusedItemToken&#xC774; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">supportVisibleTokenList</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Context&#xC5D0; &#xC788;&#xB294; visibleTokenList&#xAC00; &#xC9C0;&#xC6D0;&#xB418;&#xC5B4;&#xC57C;
        &#xD558;&#xB294;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">data</td>
      <td style="text-align:left">Object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC11C;&#xBE44;&#xC2A4;&#xC5D0;&#xC11C; &#xD544;&#xC694;&#xD55C; &#xB370;&#xC774;&#xD130;&#xB97C;
        JSON &#xD3EC;&#xB9F7;&#xC73C;&#xB85C; &#xCD94;&#xAC00; &#xAC00;&#xB2A5;</td>
    </tr>
  </tbody>
</table>

## 

