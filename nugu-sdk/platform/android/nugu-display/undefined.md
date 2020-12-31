# 커스텀

**TemplateRenderer**는 Nugu의 기본 화면 유지정책에 따라 Template 을 노출하고 제거합니다. 예를들어 응답 TTS재생이 종료되면 일정시간 후 연관된 Template은 자동으로 제거됩니다. 이런 기본정책과 독립적으로 자신만의 화면 유지정책을 가지려면 **DisplayAgentInterface.Renderer**를 직접 구현하여 nuguAndroidClient 객체에 [displayRenderer로 등록](https://app.gitbook.com/@nugu-developers-docs/s/dev/nugu-sdk/platform/android/nugu-display#templaterenderer-1)하면 됩니다.

## DisplayAgentInterface.Renderer 직접 구현

인터페이스 선언부입니다. 

```kotlin
interface Renderer {
    fun render(templateId: String, templateType: String, templateContent: String, header: Header, displayType: Type): Boolean
    fun clear(templateId: String, force: Boolean)
    fun update(templateId: String, templateContent: String)
}
```

## 화면 노출, 업데이트, 제거 

main thread 꼭 언급

```
$ give me super-powers
```

{% hint style="info" %}
 Super-powers are granted randomly so please submit an issue if you're not happy with yours.
{% endhint %}

Once you're strong enough, save the world:

{% code title="hello.sh" %}
```bash
# Ain't no code for that yet, sorry
echo 'You got to trust me on this, I saved the world'
```
{% endcode %}

## 

