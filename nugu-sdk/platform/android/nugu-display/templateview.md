---
description: TemplateView 커스텀
---

# TemplateView

기본적으로 제공되는 `TemplateView`는 Nugu에서 정의한 레이아웃과 디자인을 따릅니다.  
TemplateView를 직접 구현하고 이를 TemplateView 생성로직에 적용하면 특정 templateType의 template 노출이 요청된 경우 원하는 TemplateView를 노출 시킬 수 있습니다.

## TemplateView 구현

TemplateView는 TemplateRenderer를 통해 전달되는 템플릿 노출, 템플릿 업데이트를 처리해야 합니다. TemplateView Interface에서 필수로 override 해야 하는 method입니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Methods</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">
        <p><b>fun load(templateContent: String, deviceTypeCode: String, dialogRequestId: String, onLoadingComplete: (() -&gt; Unit)? = null)</b>
        </p>
        <p>
          <br />&#xC0C8;&#xB85C;&#xC6B4; &#xD0EC;&#xD50C;&#xB9BF; &#xB178;&#xCD9C;&#xC774;
          &#xD544;&#xC694;&#xD560;&#xB54C; TemplateRenderer&#xC758; render()&#xB97C;
          &#xD1B5;&#xD574; &#xD638;&#xCD9C;&#xB429;&#xB2C8;&#xB2E4;.</p>
        <p>templateContent&#xC5D0;&#xB294; template payload &#xC804;&#xCCB4;&#xAC00;
          &#xC804;&#xB2EC;&#xB429;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun update(templateContent: String, dialogRequestedId: String, onLoadingComplete: (() -&gt; Unit))</b>
        </p>
        <p>
          <br />&#xC774;&#xBBF8; &#xB178;&#xCD9C;&#xB41C; &#xD0EC;&#xD50C;&#xB9BF;&#xC758;
          &#xBD80;&#xBD84; &#xC5C5;&#xB370;&#xC774;&#xD2B8;&#xAC00; &#xD544;&#xC694;&#xD560;&#xB54C;
          TemplateRenderer&#xC758; update()&#xB97C; &#xD1B5;&#xD574; &#xD638;&#xCD9C;&#xB429;&#xB2C8;&#xB2E4;.
          <br
          />templateContent&#xC5D0;&#xB294; &#xC5C5;&#xB370;&#xC774;&#xD2B8;&#xAC00;
          &#xD544;&#xC694;&#xD55C; template payload&#xAC00; &#xC804;&#xB2EC;&#xB429;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
  </tbody>
</table>

{% hint style="info" %}
TemplateView 구현체는 android View 객체여야 합니다.
{% endhint %}

## TemplateView Constructor 추가

생성될 TemplateView는 templateType에 따라 결정됩니다.   
  
TemplateView.kt에 선언된 정적 맵에 templateType과 templateConstructor가 매핑되어 있습니다.   
이 맵에서 templateType에 맞는 templateConstructor를 찾아 TemplateView를 생성합니다.   
매핑되는 것이 없을 경우 TemplateWebView 객체가 생성됩니다.  
  
원하는 templateType과 직접 구현한 TemplateView 생성자를 매핑하여 맵에 추가하면 됩니다.

```kotlin
TemplateView.kt

/**
 * key : TemplateType list
 * value : TemplateView Constructor
 */
 val templateConstructor: HashMap<List<String>, (String, Context) -> TemplateView> by lazy {
    HashMap<List<String>, (String, Context) -> TemplateView>().also {
        it[MEDIA_TEMPLATE_TYPES] = { templateType, context ->
            DisplayAudioPlayer(templateType, context)
        }
    }
}
 
```

