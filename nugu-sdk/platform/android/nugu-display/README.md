# NUGU Display의 노출과 제어

[Display 가이드](https://developers-doc.nugu.co.kr/nugu-sdk/capability-interface/display)에 소개된 DisplayAggregatorInterface.Renderer, DisplayAggregatorInterface.Controller 를 구현하고 DisplayAgent를 이용하여 필요한 화면을 노출하고 이를 제어할 수 있습니다.  
  
NUGU SDK는 이 모든 과정을 구현한 **TemplateRenderer**를 제공합니다.  
TemplateRenderer 사용법을 설명합니다.

{% hint style="info" %}
TemplateRenderer는 NuguUXKit에 포함되어 있습니다.
{% endhint %}

## TemplateRenderer 생성

```kotlin
 // MainActivity.kt in SampleApp
 private val templateRenderer = TemplateRenderer(
        nuguClientProvider = object : TemplateRenderer.NuguClientProvider {
            override fun getNuguClient(): NuguAndroidClient {
                return ClientManager.getClient()
            }
        },
        deviceTypeCode = "your_device_type_code",
        fragmentManager = supportFragmentManager,
        containerId = R.id.template_container)
```

* **nuguClientProvider** : Template 관련요청 처리를 위한 NuguAndroidClient 프로바이더
* **deviceTypeCode** : poc의 device type code
* **fragmentManager** : Fragment Transaction을 위한 fragmentManager
* **containerId** : Fragment가 추가될 container view id

{% hint style="info" %}
Template 화면은 Fragment 형태로 제공됩니다.
{% endhint %}

## TemplateRenderer 등록

nuguAndroidClient에 templateRenderer를 displayRenderer로 설정합니다. 

```kotlin
// MainActivity.kt in SampleApp
ClientManager.getClient().setDisplayRenderer(templateRenderer)
```

이제 Template 화면이 알아서 노출되고 클릭, 스크롤, 포커스 등 사용자 인터렉션이 자동으로 처리됩니다.

## TemplateRenderer 사용 \(모든 템플릿 제거\)

templateRenderer를 등록하는 것만으로도 Template 노출, 업데이트, 제거 등이 알아서 처리됩니다.  
다만 백키 클릭과 같이 templateRenderer가 알아챌 수 없는 이벤트로, 노출중인 모든 template을 제거하는 유즈케이스 대응을 위해 clearAll\(\) 메서드를 제공합니다.

```kotlin
// TemplateRenderer.kt in NuguUXKit
fun clearAll(): Boolean 

// MainActivity.kt in SampleApp
override fun onBackPressed() {
    if (templateRenderer.clearAll()) return
    super.onBackPressed()
}
```

SampleApp의 MainActivity에서의 사용예시입니다.  
백키 이벤트가 발생했을때 template이 노출중인 상태라면 template을 제거하고, 아니라면 activity를 종료하는 케이스에 사용될 수 있습니다.  


