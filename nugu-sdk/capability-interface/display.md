---
description: Play 에서 전달하는 UI 요소를 화면에 구성하기 규격
---

# Display

## Version

최신 버전은 1.6 입니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Version</th>
      <th style="text-align:left">Date</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">1.0</td>
      <td style="text-align:left">2019.11.17</td>
      <td style="text-align:left">&#xADDC;&#xACA9; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.1</td>
      <td style="text-align:left">20191209</td>
      <td style="text-align:left">
        <p>Close directive</p>
        <p>CloseSucceeded, CloseFailed event &#xCD94;&#xAC00;</p>
        <p>Weather1/2/3/4/5, FullImage directive &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.2</td>
      <td style="text-align:left">20200303</td>
      <td style="text-align:left">
        <p>Duration &#xCD94;&#xAC00;</p>
        <p>Score1/2 directive &#xCD94;&#xAC00;</p>
        <p>ControlFocus, ControlScroll directive &#xCD94;&#xAC00;</p>
        <p>ControlFocusSucceeded, ControlFocusFailed, ControlScrollSucceeded, ControlScrollFailed
          event &#xCD94;&#xAC00;</p>
        <p>SearchList1/2 directive &#xCD94;&#xAC00;</p>
        <p>Call1/2/3 directive &#xCD94;</p>
        <p>FullText3 directive &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.3</td>
      <td style="text-align:left">20200429</td>
      <td style="text-align:left">
        <p>Timer directive &#xCD94;&#xAC00;</p>
        <p>Template &#xC5D0; supportFocusedItemToken, supportVisibleTokenList &#xD544;&#xB4DC;
          &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.4</td>
      <td style="text-align:left">20200622</td>
      <td style="text-align:left">
        <p>ButtonObject &#xC5D0; postback, autoTrigger, closeTemplateAfter, disable
          &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
        <p>ElementSelected event &#xC5D0; postback &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
        <p>Dummy directive &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.5</td>
      <td style="text-align:left">20200902</td>
      <td style="text-align:left">Template &#xC5D0; eventType, textInput &#xD544;&#xB4DC; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.6</td>
      <td style="text-align:left">20201016</td>
      <td style="text-align:left">BadgeObject, UnifiedSearch1 &#xCD94;</td>
    </tr>
  </tbody>
</table>

## SDK Interface

### DisplayAgent 사용

Display interface 규격에 따른 디바이스의 동작 제어는 DisplayAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 DisplayAgent instance 에 접근할 수 있습니다.

```text
val displayAgent = nuguAndroidClient.displayAgent
```

AudioPlayer interface 와 Display interface 를 병합해주는 DisplayAggregatorInterface 를 제공합니다.

```text
val displayAggregator = nuguAndroidClient.getDisplay()
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 DisplayAgent instance 에 접근할 수 있습니다.

```text
let audioPlayerAgent = nuguClient.audioPlayerAgent
```
{% endtab %}
{% endtabs %}

### Context 구성

[UI 제어](display.md#ui-1) 기능을 사용하기 위해서는 template 화면의 상태 정보를 [Context](display.md#context) 에 포함시켜 주어야 합니다.

{% tabs %}
{% tab title="Android" %}
DisplayAggregatorInterface.Controller 를 추가합니다.

```text
val controller = object: DisplayAggregatorInterface.Controller {
    override fun getFocusedItemToken(): String? {
        ...
    }
    
    override fun getVisibleTokenList(): List<String>? {
        ...
    }
    
    ...
}

displayAggregator.displayCardRendered(templateId, controller)
```
{% endtab %}

{% tab title="iOS" %}
DisplayAgentDelegate 를 추가합니다.

```text
class MyDisplayAgentDelegate: DisplayAgentDelegate {
    func displayAgentRequestContext(templateId: String, completion: @escaping (DisplayContext?) -> Void) {
        ...
    }
    
    ...
}
displayAgent.delegate = MyDisplayAgentDelegate()
```
{% endtab %}
{% endtabs %}

### UI 구성 및 제어

Display 로 화면을 구성하기 위해 필요한 데이터는 [Template](display.md#directive-template) directive 에 포함되어 전달됩니다.

Template 화면은 [Close](display.md#close) directive 또는 SDK 내부 timer 등에 의해 종료될 수 있으며, [Update](display.md#update) directive 에 의해 변경될 수 있습니다.

Template 의 focus 와 scroll 은 `사용자 발화` 에 따라 [ControlFocus](display.md#controlfocus), [ControlScroll](display.md#controlscroll) directive 로 제어될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
DisplayAggregatorInterface.Renderer 를 추가합니다.

```text
val renderer = object: DisplayAggregatorInterface.Renderer {
    override fun render(templateId: String, templateType: String, templateContent: String, dialogRequestId: String, displayType: Type): Boolean {
        ...
    }
    
    ...
}
displayAggregator.setRenderer(renderer)
```

UI 를 제어하려면 DisplayAggregatorInterface.Controller 를 추가합니다.

```text
val controller = object: DisplayAggregatorInterface.Controller {
    override fun controlFocus(direction: Direction): Boolean {
        ...
    }
    
    override fun controlScroll(direction: Direction): Boolean {
        ...
    }
    
    ...
}
displayAggregator.displayCardRendered(templateId, controller)
```
{% endtab %}

{% tab title="iOS" %}
DisplayAgentDelegate 를 추가합니다.

```text
class MyDisplayAgentDelegate: DisplayAgentDelegate {
    func displayAgentShouldRender(template: DisplayTemplate, completion: @escaping (AnyObject?) -> Void) {
        ...
    }
    
    func displayAgentShouldMoveFocus(templateId: String, direction: DisplayControlPayload.Direction, completion: @escaping (Bool) -> Void) {
        ...
    }
    
    func displayAgentShouldScroll(templateId: String, direction: DisplayControlPayload.Direction, completion: @escaping (Bool) -> Void) {
        ...
    }
    
    ...
}
displayAgent.delegate = MyDisplayAgentDelegate()
```
{% endtab %}
{% endtabs %}

### 사용자 인터렉션 처리

Template 하위 항목 선택시 [ElementSelected](display.md#elementselected) event 가 전달됩니다.

{% tabs %}
{% tab title="Android" %}
```text
displayAggregator.setElementSelected(templateId, token, postback)
```
{% endtab %}

{% tab title="iOS" %}
```text
displayAgent.elementDidSelect(templateId: displayTemplate.templateId, token: token, postback: postback)
```
{% endtab %}
{% endtabs %}

Template 에 화면에 대한 사용자 interaction 발생시 SDK 로 notify 해주어야 내부 timer\(template 일정시간 노출 후 종료하기 위한\) 가 갱신됩니다.

{% tabs %}
{% tab title="Android" %}
```text
displayAggregator.notifyUserInteraction(templateId)
```
{% endtab %}

{% tab title="iOS" %}
```text
displayAgent.notifyUserInteraction()
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "Display": {
    "version": "1.3",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "focusedItemToken": "{{STRING}}",
    "visibleTokenList": [
      "{{STRING}}"
    ]
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | N | 클릭하는 template을 식별하기 위한 unique identifier |
| focusedItemToken | string | N | 현재 화면에 List Template이 보여지고 있을 때, 포커스된 item을 식별하기 위한 unique identifier focusable이 true인 List Template이 보여지고 있을 때는 반드시 focusedItemToken이 존재해야 함 |
| visibleTokenList | list | N | 현재 화면에 List Template이 보여지고 있을 때, 보여지고 있는 item들을 식별하기 위한 unique identifier 목록 List Template이 보여지고 있을 때는 반드시 visibleTokenList이 존재해야 함 |

## Common Objects

Template 에 사용되는 공통 object 의 데이터 구조입니다.

### ImageObject

```text
{
  "contentDescription": "{{STRING}}",
  "sources": [
    {
      "url": "{{STRING}}",
      "size": "{{STRING}}",
      "widthPixels": {{LONG}},
      "heightPixels": {{LONG}}
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
      <td style="text-align:left">contentDescription</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">sources</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xB9AC;&#xC2A4;&#xD2B8;&#xB85C; &#xC81C;&#xACF5;&#xB418;&#xBA70; &#xD074;&#xB77C;&#xC774;&#xC5B8;&#xD2B8;&#xC5D0;&#xC11C;
        &#xD654;&#xBA74; &#xD06C;&#xAE30;&#xC5D0; &#xAC00;&#xC7A5; &#xC801;&#xD569;&#xD55C;
        &#xC774;&#xBBF8;&#xC9C0;&#xB97C; &#xC0AC;&#xC6A9;&#xD574;&#xC57C; &#xD568;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>sources.</p>
        <p>url</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>sources.</p>
        <p>size</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">X_SMALL, SMALL, MEDIUM, LARGE, X_LARGE</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>sources.</p>
        <p>widthPixels</p>
      </td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>sources.</p>
        <p>heightPixels</p>
      </td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

| size value | Recommended Size \(in pixels\) |
| :--- | :--- |
| X\_SMALL | 480 x 320 |
| SMALL | 720 x 480 |
| MEDIUM | 960 x 640 |
| LARGE | 1280 x 800 |
| X\_LARGE | 1920 x 1080 |

### TextObject

```text
{
  "text": "{{STRING}}",
  "color": "{{STRING}}",
  "style": {}
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
      <td style="text-align:left">text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>Text &#xC911;&#xAC04;&#xC5D0; &#xAC15;&#xC870; &#xD45C;&#xD604;&#xC744;
          &#xC704;&#xD55C; &#xB9C8;&#xD06C;&#xC5C5; &#xC0AC;&#xC6A9; &#xAC00;&#xB2A5;
          &#xC2A4;&#xD399;</p>
        <ul>
          <li>&#xBCFC;&#xB4DC; :&lt;b&gt;&#xBCFC;&#xB4DC;&lt;/b&gt;</li>
          <li>&#xAE30;&#xC6B8;&#xB9BC; :&lt;i&gt;<em>&#xAE30;&#xC6B8;&#xB9BC;</em>&lt;/i&gt;</li>
          <li>&#xBC11;&#xC904; : &lt;u&gt;&#xBC11;&#xC904;&lt;/u&gt;</li>
          <li>&#xC717;&#xCCA8;&#xC790; : &lt;sup&gt;&#xC717;&#xCCA8;&#xC790;&lt;/sup&gt;</li>
          <li>&#xC544;&#xB798;&#xCCA8;&#xC790; : &lt;sub&gt;&#xC544;&#xB798;&#xCCA8;&#xC790;&lt;/sub&gt;</li>
          <li>&#xCDE8;&#xC18C;&#xC120; :&lt;s&gt;&#xCDE8;&#xC18C;&#xC120;&lt;/s&gt;</li>
          <li>&#xC0C9;&#xC0C1; : &lt;font color=&quot;red&quot;&gt;&#xBE68;&#xAC15;&lt;/font&gt;</li>
        </ul>
        <p>&#xC704;&#xC5D0; &#xC694;&#xC18C;&#xC678; &#xB2E4;&#xB978; &#xB9C8;&#xD06C;&#xC5C5;
          &#xC0AC;&#xC6A9; &#xC2DC; &#xB9C8;&#xD06C;&#xC5C5; &#xC694;&#xC18C; &#xC0AC;&#xC6A9;
          &#xBD88;&#xAC00;, &#xC6D0;&#xBCF8; &#xD45C;&#xC2DC;</p>
      </td>
    </tr>
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
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xAE30;&#xBCF8;&#xC801;&#xC73C;&#xB85C;&#xB294; &#xC0C1;&#xC704; &#xC2A4;&#xD0C0;&#xC77C;(directive
          &#xB4F1;)&#xC744; &#xB530;&#xB984;.</p>
        <p>CSS &#xC18D;&#xC131;&#xC740; &#xBAA8;&#xB450; &#xAC00;&#xB2A5;&#xD558;&#xBA70;,
          &#xB2E4;&#xC74C;&#xC758; &#xAC12;&#xB4E4;&#xC744; &#xAC00;&#xC9C8; &#xC218;
          &#xC788;&#xB2E4;.</p>
        <ul>
          <li>text-align : left, center, right</li>
          <li>opacity : 0 ~ 1</li>
          <li>display : block, inline, none</li>
          <li>margin : 10px
            <br />&#xC0AC;&#xC6A9;&#xC608;.
            <br />{ &quot;text-align&quot;:&quot;center&quot;, &quot;display&quot;: &quot;block&quot;
            }</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### ButtonObject

```text
{
  "type": "{{STRING}}",
  "text": "{{STRING}}",
  "image": ImageObject,
  "token": "{{STRING}}",
  "textInput": {
    "text": "{{STRING}}",
    "playServiceId": "{{STRING}}"
  },
  "postback": {},
  "autoTrigger": {
    "delayInMilliseconds": {{LONG}},
    "showTimer": {{BOOL}}
  },
  "closeTemplateAfter": {{BOOL}},
  "style": {},
  "disable": {{BOOL}}
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
      <td style="text-align:left">N</td>
      <td style="text-align:left">text(default), image &#xC911; &#xD558;&#xB098;&#xC758; &#xAC12;&#xC744;
        &#xAC00;&#xC9C8; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBC84;&#xD2BC; &#xC774;&#xBBF8;&#xC9C0;</p>
        <ul>
          <li>type&#xC774; image&#xC778; &#xACBD;&#xC6B0;&#xC5D0; &#xD55C;&#xD574; &#xD544;&#xC218;&#xC774;&#xBA70;,
            &#xD574;&#xB2F9; &#xC774;&#xBBF8;&#xC9C0;&#xB97C; &#xC774;&#xC6A9;&#xD574;
            &#xBC84;&#xD2BC;&#xC744; &#xD45C;&#xD604;&#xD55C;&#xB2E4;.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBC84;&#xD2BC; &#xD14D;&#xC2A4;&#xD2B8;</p>
        <ul>
          <li>type&#xC774; text&#xC778; &#xACBD;&#xC6B0;&#xC5D0; &#xD55C;&#xD574; &#xD544;&#xC218;&#xC774;&#xBA70;,
            &#xD574;&#xB2F9; &#xD14D;&#xC2A4;&#xD2B8;&#xB97C; &#xC774;&#xC6A9;&#xD574;
            &#xBC84;&#xD2BC;&#xC744; &#xD45C;&#xD604;&#xD55C;&#xB2E4;.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD074;&#xB9AD; &#xC2DC; &#xC804;&#xB2EC;&#xB420; &#xD1A0;&#xD070; &#xAC12;</td>
    </tr>
    <tr>
      <td style="text-align:left">eventType</td>
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
          <li><b>Text.TextInput</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">textInput</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">eventType == TextTextInput&#xC778; &#xACBD;&#xC6B0; &#xD544;&#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">textInput.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD560; &#xD14D;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>textInput.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD2B9;&#xC815; Play&#xB85C; &#xC9C0;&#xC815;&#xD558;&#xC5EC; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xB294;
        &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">postback</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p></p>
        <p>&#xD074;&#xB9AD; &#xC2DC; &#xC804;&#xB2EC;&#xB418;&#xB294; &#xC784;&#xC758;&#xC758;
          Object</p>
        <ul>
          <li>&#xBC84;&#xD2BC; &#xD074;&#xB9AD; &#xC2DC; &#xB3D9;&#xC791;&#xC744; &#xC704;&#xD574;
            &#xD544;&#xC694;&#xD55C; &#xC815;&#xBCF4;&#xB97C; &#xC784;&#xC758;&#xC758;
            JSON &#xD3EC;&#xB9F7;&#xC73C;&#xB85C; &#xCD94;&#xAC00; &#xAC00;&#xB2A5;</li>
          <li>&#xAE30;&#xC874;&#xC5D0; token&#xC744; &#xC774; &#xC6A9;&#xB3C4;&#xB85C;
            &#xD65C;&#xC6A9;&#xD558;&#xB294; &#xACBD;&#xC6B0;&#xAC00; &#xB9CE;&#xC558;&#xB294;&#xB370;,
            token&#xC740; identifier &#xC5ED;&#xD560;&#xC744; &#xD558;&#xB3C4;&#xB85D;
            &#xD558;&#xAE30; &#xC704;&#xD574; &#xCD94;&#xAC00;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">autoTrigger</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD2B9;&#xC815; &#xC2DC;&#xAC04;&#xC774; &#xC9C0;&#xB09C; &#xB4A4; ElementSelected
          Event&#xB97C; &#xC790;&#xB3D9;&#xC73C;&#xB85C; &#xBC1C;&#xC0DD;&#xC2DC;&#xD0A4;&#xB294;
          &#xACBD;&#xC6B0; &#xD3EC;&#xD568;</p>
        <p>&#xD558;&#xC704; parameter&#xB4E4;&#xC740; autoTrigger&#xAC00; &#xD3EC;&#xD568;&#xB418;&#xBA74;
          &#xBAA8;&#xB450; mandatory parameter</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>autoTrigger.</p>
        <p>delayInMilliseconds</p>
      </td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">TTS &#xC885;&#xB8CC; &#xD6C4; trigger &#xC2DC;&#xD0AC;&#xB54C;&#xAE4C;&#xC9C0;&#xC758;
        &#xC2DC;&#xAC04; (msec)</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>autoTrigger.</p>
        <p>showTimer</p>
      </td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC84;&#xD2BC;&#xC5D0; timer &#xC22B;&#xC790;&#xB97C; &#xBCF4;&#xC5EC;&#xC904;&#xC9C0;
        &#xC124;&#xC815;</td>
    </tr>
    <tr>
      <td style="text-align:left">closeTemplateAfter</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">trigger &#xB610;&#xB294; &#xD074;&#xB9AD; &#xB3D9;&#xC791; &#xD6C4; template&#xC744;
        &#xBC14;&#xB85C; &#xB2EB;&#xC744;&#xC9C0;, &#xC544;&#xB2C8;&#xBA74; template&#xC758;
        life cycle &#xB300;&#xB85C; &#xD654;&#xBA74;&#xC5D0; &#xBCF4;&#xC5EC;&#xC904;&#xC9C0;
        &#xC124;&#xC815;</td>
    </tr>
    <tr>
      <td style="text-align:left">style</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBC84;&#xD2BC;&#xC758; &#xCD94;&#xAC00;&#xC801;&#xC778; style&#xC744;
          &#xC815;&#xC758;&#xD568;.</p>
        <p>textObject&#xC758; style&#xACE0; &#xC0AC;&#xC6A9;&#xBC95;&#xC774; &#xB3D9;&#xC77C;&#xD568;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">disable</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC774; &#xC18D;&#xC131;&#xC774; true&#xC774;&#xBA74; &#xBC84;&#xD2BC;&#xC744;
        disable &#xCC98;&#xB9AC;&#xD568;.</td>
    </tr>
  </tbody>
</table>

### TitleObject

```text
{
  "logo": ImageObject,
  "text": TextObject,
  "subtext": TextObject,
  "subicon": ImageObject,
  "button": ButtonObject
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| logo | ImageObject | N | png 타입으로 투명 이미지로 제공해야 함 |
| text | TextObject | Y | 제목 |
| subtext | TextObject | N | ASR Text 등 부제목 |
| subicon | ImageObject | N | 서브 아이콘 \( 위치 : subText 왼쪽 \) |
| button | ButtonObject | N | 우측에 위치하는 버튼 |

### BackgroundObject

```text
{
  "image": ImageObject,
  "color": "{{STRING}}"
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
  </tbody>
</table>

### Duration

TTS, 보이스 크롭 등이 종료된 후 template 이 화면에 남아 있어야 하는 시간입니다.

| Duration string | Duration value |
| :--- | :--- |
| SHORT | 7초 |
| MID | 15초 |
| LONG | 30초 |
| LONGEST | 10분 |

### GrammarGuide

발화가이드 입니다.

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
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left">array of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD654;&#xBA74;&#xC5D0; &#xD45C;&#xC2DC;&#xD560; &#xBB38;&#xC790;&#xC5F4;&#xB4E4;&#xC744;
          &#xC815;&#xC758;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>
          <br />&#xC0AC;&#xC6A9;&#xC608;.
          <br />[&quot;&#xD648; &#xD654;&#xBA74;&#xC73C;&#xB85C; &#xC774;&#xB3D9;&#xD574;&#xC918;&quot;,
          &quot;&#xC120;&#xD638;&#xCC44;&#xB110; &#xCC3E;&#xC544;&#xC918;&quot;]</p>
      </td>
    </tr>
  </tbody>
</table>

### ToggleButtonObject

```text
{
  "style": "{{STRING}}",
  "status": "{{STRING}}",
  "token": "{{STRING}}"
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| style | string | Y | image, text |
| status | string | Y | on, off |
| token | string | Y | 클릭 시 전달될 토큰 값 |

### ContextLayer

Template 의 종류를 구분하기 위한 속성입니다.

| contextLayer | description |
| :--- | :--- |
| INFO | 기본값. 정보성 |
| MEDIA | 미디어 재생 |
| ALERT | 알람/타이머 |
| CALL | 전화 수신/발신/통화중 |

### BadgeObject

```text
{
  "type": "{{STRING}}",
  "text": TextObject,
  "image": ImageObject
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>TEXT</li>
          <li>IMAGE</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">text</td>
      <td style="text-align:left"><a href="../../nugu-play/create-plays-with-play-builder/use-backend-proxy/capability-interfaces/display-interface.md#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">image</td>
      <td style="text-align:left"><a href="../../nugu-play/create-plays-with-play-builder/use-backend-proxy/capability-interfaces/display-interface.md#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

## Directive

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
      <td style="text-align:left"><a href="display.md#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="display.md#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="display.md#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="display.md#backgroundobject">BackgroundObject</a>
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
      <td style="text-align:left"><a href="display.md#imageobject">ImageObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBCF4;&#xC870; &#xC124;&#xBA85;</td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left"><a href="display.md#grammarguide">GrammarGuide</a>
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
      <td style="text-align:left"><a href="display.md#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="display.md#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="display.md#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="display.md#backgroundobject">BackgroundObject</a>
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
      <td style="text-align:left"><a href="display.md#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>icon</p>
      </td>
      <td style="text-align:left"><a href="display.md#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#togglebuttonobject">ToggleButtonObject</a>
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
      <td style="text-align:left"><a href="display.md#grammarguide">GrammarGuide</a>
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
      <td style="text-align:left"><a href="display.md#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="display.md#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="display.md#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="display.md#backgroundobject">BackgroundObject</a>
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
      <td style="text-align:left"><a href="display.md#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>icon</p>
      </td>
      <td style="text-align:left"><a href="display.md#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>listItems.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left">array of <a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#button-object">ButtonObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#grammarguide">GrammarGuide</a>
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
      <td style="text-align:left"><a href="display.md#contextlayer">ContextLayer</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left"><a href="display.md#duration">Duration</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left"><a href="display.md#titleobject">TitleObject</a>
      </td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left"><a href="display.md#backgroundobject">BackgroundObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>header</p>
      </td>
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xCD5C;&#xC800; &#xC628;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>content.</p>
        <p>body</p>
      </td>
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#imageobject">ImageObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
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
      <td style="text-align:left"><a href="display.md#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">grammarGuide</td>
      <td style="text-align:left"><a href="display.md#grammarguide">GrammarGuide</a>
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
| contextLayer | [ContextLayer](display.md#contextlayer) | N |  |
| duration | [Duration](display.md#duration) | N |  |
| title | [TitleObject](display.md#titleobject) | **Y** |  |
| background | [BackgroundObject](display.md#backgroundobject) | N |  |
| listItems | list | N | 현재는 최대 2개의 아이템을 보여주고 있음 |
| listItems. header | [TextObject](display.md#textobject) | N | item의 최상위 텍스트 |
| listItems. body | [TextObject](display.md#textobject) | N | item의 주요내용 텍스트 |
| listItems. image | [ImageObject](display.md#imageobject) | N | item의 주 이미지 |
| listItems. temperature. max | [TextObject](display.md#textobject) | N | 최대 온도 |
| listItems. temperature. min | [TextObject](display.md#textobject) | N | 최저 온도 |
| listItems. footer | [TextObject](display.md#textobject) | N | 기타정보를 위한 텍스트 |
| listItems. focus | boolean | N | focus 여부\(bold 처리\) |
| grammarGuide | [GrammarGuide](display.md#grammarguide) | N | 4.8 Grammar Guide 참조 |
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
| contextLayer | [ContextLayer](display.md#contextlayer) | N |  |
| duration | [Duration](display.md#duration)  | N | \#7\)DurationOption 참고 |
| title | [TitleObject](display.md#titleobject) | **Y** |  |
| background | [BackgroundObject](display.md#backgroundobject) | N |  |
| content. header | [TextObject](display.md#textobject) | N | 헤더 문자열 |
| content. body | [TextObject](display.md#textobject) | N | 게이지 중앙의 문자열 |
| content. footer | [TextObject](display.md#textobject) | N | 게이지 중앙 하단의 부연 문자열 |
| content. progress | long | N | 게이지 진행도\(0에서 1사이의 값\) |
| content. progressColor | String | N | 게이지의 색\(default는 red\) |
| content. min | [TextObject](display.md#textobject) | N | 게이지 최저값 |
| content. max | [TextObject](display.md#textobject) | N | 게이지 최고값 |
| content. icon | [ImageObject](display.md#imageobject) | N | 게이지 아이콘 이미지 |
| grammarGuide | [GrammarGuide](display.md#grammarguide) | N | 4.8 Grammar Guide 참조 |
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
| title | [TitleObject](display.md#titleobject) | **Y** |  |
| background | [BackgroundObject](display.md#backgroundobject) | N |  |
| content. image | [ImageObject](display.md#imageobject) | **Y** |  |
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
| title | [TitleObject](display.md#titleobject) | **Y** |  |
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

## Event

### ElementSelected

```text
{
  "header": {
    "namespace": "Display",
    "name": "ElementSelected",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | **Y** |  |

### CloseSucceeded

```text
{
  "header": {
    "namespace": "Display",
    "name": "CloseSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### CloseFailed

```text
{
  "header": {
    "namespace": "Display",
    "name": "CloseFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ControlFocusSucceeded

```text
{
  "header": {
    "namespace": "Display",
    "name": "ControlFocusSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | N | PREVIOUS, NEXT |

### ControlFocusFailed

```text
{
  "header": {
    "namespace": "Display",
    "name": "ControlFocusFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | N | PREVIOUS, NEXT |

### ControlScrollSucceeded

```text
{
  "header": {
    "namespace": "Display",
    "name": "ControlScrollSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | N | PREVIOUS, NEXT |

### ControlScrollFailed

```text
{
  "header": {
    "namespace": "Display",
    "name": "ControlScrollFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | N | PREVIOUS, NEXT |

