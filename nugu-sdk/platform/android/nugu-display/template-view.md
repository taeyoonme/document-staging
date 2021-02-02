---
description: 'Template, 응용레벨 사이의 상호작용 커스텀'
---

# TemplateHandler

`TemplateRenderer`는 _\*\*_`TemplateView`를 사용하여 화면을 구성합니다.

TemplateView 에서 버튼클릭이나 상태 변경이 일어나면 이를 응용레벨에 알려 처리되도록 해야 합니다. 마찬가지로 응용레벨에서 display에 필요한 상태변경이나 명령이 발생하면 TemplateView에 알려 갱신 처리를 해야 합니다. 이와 같은 TemplateView와 응용레벨에서의 상호작용은 `TemplateHandler`인터페이스를 통해 이루어집니다.

TemplateRenderer에서 사용중인 `TemplateFragment` 소스를 보면, TemplateView를 생성하면서 `BasicTemplateHandler` 객체를 TemplateView에 설정하고 있습니다. BasicTemplateHandler는 TemplateHandler 구현체로, 위에서 설명한 상호작용을 처리하고 있습니다.

특정 상호작용을 제한하거나 동작 변경이 필요하다면 BasicTemplateHandler를 상속 및 override 하여 상호작용에 관여할 수 있습니다.

## TemplateHandler

TemplateView \(이하 View로 표기\) 는 버튼이 클릭되거나, 보여지는 item list에 변화가 생길때 이를 응용레벨로 알려 처리되도록 합니다. 또한 Toast나 Activity의 노출을 요청할 수도 있습니다.  
각 상황에 호출되는 메서드들은 아래와 같습니다.

| Methods |
| :--- |
| **fun onElementSelected\(tokenId: String\)** View내 버튼 클릭시 호출된다. |
| **fun onChipSelected\(text: String\)** View내 chip\(추천 명령어\) 클릭시 호출된다. |
| **fun onCloseClicked\(\)** View내 닫기 버튼 클릭시 호출된다. |
| **fun onNuguButtonSelected\(\)** View내 누구 버튼 \(아리아 호출\) 클릭시 호출된다. |
| **fun onPlayerCommand\(command: String, param: String = ""\)** 미디어 재생 관련 동작이 필요할때 호출된다. \(ex. View내 재생/일시정지 버튼 클릭\) |
| **fun onContextChanged\(context: String\)** View의 display context 변경이 있을때 호출된다. \(ex. focus item 변화, visible item 리스트의 변화\) |
| **fun showToast\(text: String\)** View에서 응용레벨로 Toast노출을 요청할때 호출된다. |
| **fun showActivity\(className: String\)** View에서 응용레벨로 Activity 노출을 요청할때 호출된다. |
| **fun playTTS\(text: String\)** View에서 응용레벨로 TTS 재생을 요청할때 호출된다. |
| **fun setClientListener\(listener: ClientListener\)** handler에 ClientListener를 설정한다. |

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

