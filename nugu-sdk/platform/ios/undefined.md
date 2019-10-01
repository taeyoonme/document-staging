# 시작하기

## Using the SDK



### Step 1: Get the latest version of Xcode

### Step 2: Install the SDK

{% tabs %}
{% tab title="Cocoapods" %}
{% code-tabs %}
{% code-tabs-item title="Podfile" %}
```ruby
target 'Your_Application' do
  pod 'NuguDefaultClient'
end
```
{% endcode-tabs-item %}
{% endcode-tabs %}
{% endtab %}

{% tab title="Manually" %}
You can also download the entire iOS SDK.

See "" on Github
{% endtab %}
{% endtabs %}

### Step 3: Get an API Information \(Client ID, client Secret ...\)

### Step 4: NUGU Login in your application

{% hint style="info" %}
 NuguLoginKit 을 통해 제공되는 API 입니다.
{% endhint %}

#### Type1

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift


```
{% endcode-tabs-item %}
{% endcode-tabs %}

{% code-tabs %}
{% code-tabs-item title="AppDelegate.swift" %}
```swift
import NuguLoginKit

func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let handled = OAuthManager<Type1>.shared.handle(open: url, options: options)
    return handled
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

#### Type2



### Step 5: Using NUGU Service in your application



