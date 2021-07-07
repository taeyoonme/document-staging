---
description: 'Template, 응용레벨 사이의 상호작용 커스텀'
---

# TemplateHandler

`TemplateRenderer`는 `TemplateView`를 사용하여 화면을 구성합니다.

TemplateView 에서 버튼클릭이나 상태 변경이 일어나면 이를 응용레벨에 알려 처리되도록 해야 합니다. 마찬가지로 응용레벨에서 display에 필요한 상태변경이나 명령이 발생하면 TemplateView에 알려 갱신 처리를 해야 합니다. 이와 같은 TemplateView와 응용레벨에서의 상호작용은 `TemplateHandler`인터페이스를 통해 이루어집니다.

TemplateHandler는 `TemplateHandlerFactory`에서 생성합니다. 

특정 상호작용을 제한하거나 동작 변경이 필요하다면 SDK의 기본 Handler인 `BasicTemplateHandler`를 상속 후 필요한 메서드를 override 하여 커스텀 TemplateHandler를 작성하고, 이를 TemplateHandlerFactory에 의해 생성되도록 적용하면 됩니다.

## TemplateHandler

TemplateView \(이하 View로 표기\) 는 버튼이 클릭되거나, 보여지는 item list에 변화가 생길때 이를 응용레벨로 알려 처리되도록 합니다. 또한 Toast나 Activity의 노출을 요청할 수도 있습니다.  
각 상황에 호출되는 메서드들은 아래와 같습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Methods</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><b>fun onElementSelected(tokenId: String)</b>
        <br />View&#xB0B4; &#xBC84;&#xD2BC; &#xD074;&#xB9AD;&#xC2DC; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun onChipSelected(text: String)</b>
        <br />View&#xB0B4; chip(&#xCD94;&#xCC9C; &#xBA85;&#xB839;&#xC5B4;) &#xD074;&#xB9AD;&#xC2DC;
        &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onCloseAllClicked()</b>
          <br />View&#xB0B4; &#xB2EB;&#xAE30; &#xBC84;&#xD2BC; &#xD074;&#xB9AD;&#xC2DC;
          &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
        <p>SDK&#xC5D0;&#xC11C;&#xB294; &#xB178;&#xCD9C;&#xC911;&#xC778; &#xBAA8;&#xB4E0;
          &#xD15C;&#xD50C;&#xB9BF;&#xBDF0;&#xB97C; &#xC885;&#xB8CC;&#xD558;&#xB294;
          &#xB3D9;&#xC791;&#xC774; &#xC2E4;&#xD589;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun onCloseClicked()</b>
        <br />View&#xB0B4; &#xD648; &#xBC84;&#xD2BC; &#xD074;&#xB9AD;&#xC2DC; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun onNuguButtonSelected()</b>
        <br />View&#xB0B4; &#xB204;&#xAD6C; &#xBC84;&#xD2BC; (&#xC544;&#xB9AC;&#xC544;
        &#xD638;&#xCD9C;) &#xD074;&#xB9AD;&#xC2DC; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun onPlayerCommand(command: String, param: String = &quot;&quot;)</b>
        <br
        />&#xBBF8;&#xB514;&#xC5B4; &#xC7AC;&#xC0DD; &#xAD00;&#xB828; &#xB3D9;&#xC791;&#xC774;
        &#xD544;&#xC694;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;. (ex.
        View&#xB0B4; &#xC7AC;&#xC0DD;/&#xC77C;&#xC2DC;&#xC815;&#xC9C0; &#xBC84;&#xD2BC;
        &#xD074;&#xB9AD;)</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun onContextChanged(context: String)</b>
        <br />View&#xC758; display context &#xBCC0;&#xACBD;&#xC774; &#xC788;&#xC744;&#xB54C;
        &#xD638;&#xCD9C;&#xB41C;&#xB2E4;. (ex. focus item &#xBCC0;&#xD654;, visible
        item &#xB9AC;&#xC2A4;&#xD2B8;&#xC758; &#xBCC0;&#xD654;)</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun showToast(text: String)</b>
        <br />View&#xC5D0;&#xC11C; &#xC751;&#xC6A9;&#xB808;&#xBCA8;&#xB85C; Toast&#xB178;&#xCD9C;&#xC744;
        &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun showActivity(className: String)</b>
        <br />View&#xC5D0;&#xC11C; &#xC751;&#xC6A9;&#xB808;&#xBCA8;&#xB85C; Activity
        &#xB178;&#xCD9C;&#xC744; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun playTTS(text: String)</b>
        <br />View&#xC5D0;&#xC11C; &#xC751;&#xC6A9;&#xB808;&#xBCA8;&#xB85C; TTS &#xC7AC;&#xC0DD;&#xC744;
        &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun setClientListener(listener: ClientListener)</b>
        <br />handler&#xC5D0; ClientListener&#xB97C; &#xC124;&#xC815;&#xD55C;&#xB2E4;.</td>
    </tr>
  </tbody>
</table>

## TemplateHandler.ClientListener

TemplateHandler가 View에서 응용레벨로의 메시지 전달 혹은 요청이라면, ClientListener는 응용레벨에서 View로의 메시지 전달과 요청이라고 할 수 있다.

| Methods |
| :--- |
| **fun onMediaStateChanged\(activity: AudioPlayerAgentInterface.State, currentTimeMs: Long, currentProgress: Float\)** 미디어 재생 상태 변경시 호출된다. |
| **fun onMediaDurationRetrieved\(durationMs: Long\)** 미디어의 재생시간이 구해졌을때 호출된다. |
| **fun onMediaProgressChanged\(progress: Float, currentTimeMs: Long\)** 미디어의 재생경과 업데이트시 호출된다. |
| **fun controlFocus\(direction: Direction\): Boolean** View에 focus 이동을 요청한다. |
| **fun controlScroll\(direction: Direction\): Boolean** View에 scroll 을 요청한다. |
| **fun getFocusedItemToken\(\): String?** View내에 현재 focusing 중인 아이템의 토큰정보를 요구한다. |
| **fun getVisibleTokenList\(\): List?** View내에 현재 visible한 아이템 리스트정보를 요구한다. |

## TemplateHandler 적용

작성한 커스텀 TemplateHandler를 리턴하는 TemplateHandlerFactory 를 TemplateRenderer에 적용하면 커스텀 TemplateHandler가 동작합니다.

```kotlin
TemplateRenderer.templateHandlerFactory = object : TemplateHandler.TemplateHandlerFactory() {
    override fun onCreate(
        nuguProvider: TemplateRenderer.NuguClientProvider,
        templateInfo: TemplateHandler.TemplateInfo,
        fragment: Fragment
    ): TemplateHandler {
        return if (templateInfo.templateType == "template you want set your own handler")
            YourTemplateHandler(nuguProvider, templateInfo, fragment)
        else
            super.onCreate(nuguProvider, templateInfo, fragment)
    }
}
```

