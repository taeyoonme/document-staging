---
description: 'Template, 응용레벨 사이의 상호작용 커스텀'
---

# TemplateHandler

`TemplateRenderer`는 ****`TemplateView`를 사용하여 화면을 구성합니다.  
  
TemplateView 에서 버튼클릭이나 상태 변경이 일어나면 이를 응용레벨에 알려 처리되도록 해야 합니다. 마찬가지로 응용레벨에서 display에 필요한 상태변경이나 명령이 발생하면 TemplateView에 알려 갱신 처리를 해야 합니다. 이와 같은 TemplateView와 응용레벨에서의 상호작용은 `TemplateHandler`인터페이스를 통해 이루어집니다.  
  
TemplateRenderer에서 사용중인 `TemplateFragment` 소스를 보면, TemplateView를 생성하면서 `BasicTemplateHandler` 객체를 TemplateView에 설정하고 있습니다. BasicTemplateHandler는 TemplateHandler 구현체로, 위에서 설명한 상호작용을 처리하고 있습니다.  
  
특정 상호작용을 제한하거나 동작 변경이 필요하다면 BasicTemplateHandler를 상속 및 override 하여 상호작용에 관여할 수 있습니다. 

## TemplateHandler

TemplateView \(이하 View로 표기\) 는 버튼이 클릭되거나, 보여지는 item list에 변화가 생길때 이를 응용레벨로 알려 처리되도록 합니다. 또한 Toast나 Activity의 노출을 요청할 수도 있습니다.    
각 상황에 호출되는 메서드들은 아래와 같습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>Methods</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">
        <p><b>fun onElementSelected(tokenId: String)</b>
        </p>
        <p>View&#xB0B4; &#xBC84;&#xD2BC; &#xD074;&#xB9AD;&#xC2DC; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onChipSelected(text: String)</b>
        </p>
        <p>View&#xB0B4; chip(&#xCD94;&#xCC9C; &#xBA85;&#xB839;&#xC5B4;) &#xD074;&#xB9AD;&#xC2DC;
          &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onCloseClicked()</b>
        </p>
        <p>View&#xB0B4; &#xB2EB;&#xAE30; &#xBC84;&#xD2BC; &#xD074;&#xB9AD;&#xC2DC;
          &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onNuguButtonSelected()</b>
        </p>
        <p>View&#xB0B4; &#xB204;&#xAD6C; &#xBC84;&#xD2BC; (&#xC544;&#xB9AC;&#xC544;
          &#xD638;&#xCD9C;) &#xD074;&#xB9AD;&#xC2DC; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onPlayerCommand(command: String, param: String = &quot;&quot;)</b>
        </p>
        <p>&#xBBF8;&#xB514;&#xC5B4; &#xC7AC;&#xC0DD; &#xAD00;&#xB828; &#xB3D9;&#xC791;&#xC774;
          &#xD544;&#xC694;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;. (ex.
          View&#xB0B4; &#xC7AC;&#xC0DD;/&#xC77C;&#xC2DC;&#xC815;&#xC9C0; &#xBC84;&#xD2BC;
          &#xD074;&#xB9AD;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onContextChanged(context: String)</b>
        </p>
        <p>View&#xC758; display context &#xBCC0;&#xACBD;&#xC774; &#xC788;&#xC744;&#xB54C;
          &#xD638;&#xCD9C;&#xB41C;&#xB2E4;. (ex. focus item &#xBCC0;&#xD654;, visible
          item &#xB9AC;&#xC2A4;&#xD2B8;&#xC758; &#xBCC0;&#xD654;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>fun showToast(text: String)</b>
        <br />View&#xC5D0;&#xC11C; &#xC751;&#xC6A9;&#xB808;&#xBCA8;&#xB85C; Toast&#xB178;&#xCD9C;&#xC744;
        &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun showActivity(className: String)</b>
        </p>
        <p>View&#xC5D0;&#xC11C; &#xC751;&#xC6A9;&#xB808;&#xBCA8;&#xB85C; Activity
          &#xB178;&#xCD9C;&#xC744; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun playTTS(text: String)</b>
        </p>
        <p>View&#xC5D0;&#xC11C; &#xC751;&#xC6A9;&#xB808;&#xBCA8;&#xB85C; TTS &#xC7AC;&#xC0DD;&#xC744;
          &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun setClientListener(listener: ClientListener)</b>
        </p>
        <p>handler&#xC5D0; ClientListener&#xB97C; &#xC124;&#xC815;&#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
  </tbody>
</table>



## TemplateHandler.ClientListener

TemplateHandler가 View에서 응용레벨로의 메시지 전달 혹은 요청이라면,  ClientListener는 응용레벨에서 View로의 메시지 전달과 요청이라고 할 수 있다. 

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>Methods</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">
        <p><b>fun onMediaStateChanged(activity: AudioPlayerAgentInterface.State, currentTimeMs: Long, currentProgress: Float)</b>
        </p>
        <p>&#xBBF8;&#xB514;&#xC5B4; &#xC7AC;&#xC0DD; &#xC0C1;&#xD0DC; &#xBCC0;&#xACBD;&#xC2DC;
          &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onMediaDurationRetrieved(durationMs: Long)</b>
        </p>
        <p>&#xBBF8;&#xB514;&#xC5B4;&#xC758; &#xC7AC;&#xC0DD;&#xC2DC;&#xAC04;&#xC774;
          &#xAD6C;&#xD574;&#xC84C;&#xC744;&#xB54C; &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun onMediaProgressChanged(progress: Float, currentTimeMs: Long)</b>
        </p>
        <p>&#xBBF8;&#xB514;&#xC5B4;&#xC758; &#xC7AC;&#xC0DD;&#xACBD;&#xACFC; &#xC5C5;&#xB370;&#xC774;&#xD2B8;&#xC2DC;
          &#xD638;&#xCD9C;&#xB41C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun controlFocus(direction: Direction): Boolean</b>
        </p>
        <p>View&#xC5D0; focus &#xC774;&#xB3D9;&#xC744; &#xC694;&#xCCAD;&#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun controlScroll(direction: Direction): Boolean</b>
        </p>
        <p>View&#xC5D0; scroll &#xC744; &#xC694;&#xCCAD;&#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun getFocusedItemToken(): String?</b>
        </p>
        <p>View&#xB0B4;&#xC5D0; &#xD604;&#xC7AC; focusing &#xC911;&#xC778; &#xC544;&#xC774;&#xD15C;&#xC758;
          &#xD1A0;&#xD070;&#xC815;&#xBCF4;&#xB97C; &#xC694;&#xAD6C;&#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>fun getVisibleTokenList(): List?</b>
        </p>
        <p>View&#xB0B4;&#xC5D0; &#xD604;&#xC7AC; visible&#xD55C; &#xC544;&#xC774;&#xD15C;
          &#xB9AC;&#xC2A4;&#xD2B8;&#xC815;&#xBCF4;&#xB97C; &#xC694;&#xAD6C;&#xD55C;&#xB2E4;.</p>
      </td>
    </tr>
  </tbody>
</table>

