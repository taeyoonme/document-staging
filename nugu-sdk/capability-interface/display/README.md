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

[UI 제어](./#ui-1) 기능을 사용하기 위해서는 template 화면의 상태 정보를 [Context](./#context) 에 포함시켜 주어야 합니다.

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

Display 로 화면을 구성하기 위해 필요한 데이터는 [Template](./#directive-template) directive 에 포함되어 전달됩니다.

Template 화면은 [Close](./#close) directive 또는 SDK 내부 timer 등에 의해 종료될 수 있으며, [Update](./#update) directive 에 의해 변경될 수 있습니다.

Template 의 focus 와 scroll 은 `사용자 발화` 에 따라 [ControlFocus](display-directive.md#controlfocus), [ControlScroll](display-directive.md#controlscroll) directive 로 제어될 수 있습니다.

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

Template 하위 항목 선택시 [ElementSelected](display-event.md#elementselected) event 가 전달됩니다.

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
      <td style="text-align:left"><a href="../../../nugu-play/create-plays-with-play-builder/use-backend-proxy/capability-interfaces/display-interface.md#textobject">TextObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">image</td>
      <td style="text-align:left"><a href="../../../nugu-play/create-plays-with-play-builder/use-backend-proxy/capability-interfaces/display-interface.md#imageobject">ImageObject</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

### 

