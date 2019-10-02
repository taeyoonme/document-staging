# 시작하기

## Using the SDK

### Step 1: Check your application

* Xcode 11.0 or later
* Swift 5.1
* iOS 10.0 or later

### Step 2: Install the SDK

{% tabs %}
{% tab title="Cocoapods" %}
{% code-tabs %}
{% code-tabs-item title="Podfile" %}
```ruby
target 'Your_Application' do
  pod 'NuguDefaultClient'
  pod 'NuguLoginKit'
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

```swift
import NuguLoginKit
```

#### Type1

> Add URL scheme in info.plist

{% code-tabs %}
{% code-tabs-item title="info.plist" %}
```markup
<plist version="1.0">
  <dict>
    <key>CFBundleURLTypes</key>
    <array>
      <dict>
      <key>CFBundleURLSchemes</key>
      <array>
        <string>nugu.user.{pocId}</string>
      </array>
      </dict>
    </array>
  </dict>
</plist>
```
{% endcode-tabs-item %}
{% endcode-tabs %}

> Acquire access-token \(using SFSafariViewController\)

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
func login() {
    OAuthManager<Type1>.shared.provider = Type1(
        clientId: "{client-id}",
        clientSecret: "{client-secret}",
        redirectUri: "{redirect-uri}",
        deviceUniqueId: "{device-unique-id}"
    )
    
    OAuthManager<Type1>.shared.loginBySafariViewController(from: self) { (result) in
        switch result {
        case .success(let authInfo):
            // Save authInfo
        case .failure(let error):
            // Occured error
        }
    }
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

{% code-tabs %}
{% code-tabs-item title="AppDelegate.swift" %}
```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let handled = OAuthManager<Type1>.shared.handle(open: url, options: options)
    return handled
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

> Refresh access-token \(silently method\)

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
func refresh() {
    OAuthManager<Type1>.shared.refreshToken(by: "{refresh-token}") { (result) in
        switch result {
        case .success(let authInfo):
            // Save authInfo
        case .failure(let error):
            // Occured error
        }
    }
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

#### Type2

> Acquire access-token \(always silently method\)

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
func login() {
    OAuthManager<Type2>.shared.provider = Type2(
        clientId: "{client-id}",
        clientSecret: "{client-secret}",
        deviceUniqueId: "{device-unique-id}"
    )
    
    OAuthManager<Type2>.shared.login() { (result) in
        switch result {
        case .success(let authInfo):
            // Save authInfo
        case .failure(let error):
            // Occured error
        }
    }
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

### Step 5: Using NUGU Service in your application

> NUGU서비스를 이용하기 위해서는 AVAudioSession의 Category를 .playAndRecord로 설정이 필요합니다. \(문구 변경 예정\)

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
func setAudioSession() throws {
    try AVAudioSession.sharedInstance().setCategory(
        .playAndRecord,
        mode: .default,
        options: [.defaultToSpeaker, .allowBluetoothA2DP]
    )
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

> NuguClient Instance를 생성한 후 다음과 같이 음성명령을 요청할 수 있습니다. \(문구 변경 예정\)

{% code-tabs %}
{% code-tabs-item title="VIewController.swift" %}
```swift
let client = NuguClient.Builder.build()

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Using result by NUGU-login
        client.authorizationManager.payload = AuthorizationPayload(
            type: "{type of access-token}",
            accessToken: "{access-token}",
            expireDate: "{expire-date of access-token}"
        )

        /// Using nugu service    
        client.networkManager.connect()
        
        /// Set delegate
        client.asrAgent.delegate = self
    }

    func recognize() {
        /// Using capability agents (Automatic Speech Recognition)
        client.asrAgent.startRecognition()
    }
}

// MARK: - ASRAgentDelegate

extension ViewController: ASRAgentDelegate {
    func asrAgentDidChange(state: ASRState) {
        // Observe state
    }
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

## See Also

> Sample App을 통해 좀 더 구체적인 사용 방법을 확인하세요. \(문구 변경 예정\)

