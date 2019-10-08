# 시작하기

## NUGU SDK 사용하기

### Step 1: 최소 요구사항 확인하기

* Xcode 11.0 or later
* Swift 5.1
* iOS 10.0 or later

### Step 2: NUGU SDK 설치하기

{% tabs %}
{% tab title="Cocoapods\(권장\)" %}
{% code-tabs %}
{% code-tabs-item title="Podfile" %}
```ruby
target 'Your_Application' do
  pod 'NuguClientKit'
  pod 'NuguLoginKit'
end
```
{% endcode-tabs-item %}
{% endcode-tabs %}
{% endtab %}

{% tab title="Manually" %}
Github Repository를 통해 다운로드 받아 직접 빌드할 수 있습니다.   
자세한 내용은 [구성요소](component.md) 탭에서 확인이 가능합니다.

* NuguClientKit: [https://github.com/nugu-developers/nugu-client-kit-ios](https://github.com/nugu-developers/nugu-client-kit-ios)
* NuguLoginKit: [https://github.com/nugu-developers/nugu-login-kit-ios](https://github.com/nugu-developers/nugu-login-kit-ios)
{% endtab %}
{% endtabs %}

### Step 3: NUGU PoC 생성하기

{% hint style="warning" %}
NUGU PoC를 생성하기 위해서는 NUGU Developers를 통해 제휴가 필요합니다.  
더 자세한 내용은 [NUGU SDK 소개](https://developers.nugu.co.kr/#/sdk/nuguSdkInfo)에서 확인이 가능합니다.
{% endhint %}

제휴를 통해 생성된 PoC 정보를 확인하기 위해서 [NUGU SDK PoC목록](https://developers.nugu.co.kr/#/sdk/pocList)으로 이동해서 ClientID, ClientSecret, Redirect URI 정보를 확인하세요. \(Redirect URI는 nugu.user.{pocID}://auth로 입력합니다.\)

### Step 4: NUGU에 로그인하기

{% hint style="info" %}
NUGU 서비스를 이용하기 위해서는 OAuth 2.0 인증이 필요합니다.  
더 자세한 내용은 [Using OAuth 2.0](../../authentication/using-oauth-2.0.md)에서 확인이 가능합니다.
{% endhint %}

> NuguLoginKit 불러오기

NUGU의 인증서버와 OAuth 인증을 더 쉽게 하기 위해서 NuguLoginKit을 불러옵니다.

```swift
import NuguLoginKit
```

#### Type1

> info.plist 파일에 URL Scheme 추가

info.plist 파일에 다음과 같이 URL Scheme을 추가합니다. \(또는 XCode에서 NUGU를 추가할 Target의 Info 탭을 눌러 URL Types를 추가 후 URL Schemes에 "nugu.user.{pocID}"를 입력합니다.\)

{% code-tabs %}
{% code-tabs-item title="info.plist" %}
```markup
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
```
{% endcode-tabs-item %}
{% endcode-tabs %}

> 앱 델리게이트 연결

인 앱 브라우저를 통한 인증 결과를 NuguLoginKit에서 처리하기 위해 다음과 같이 AppDelegate 클래스에 추가해야 합니다.

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

> 인 앱 브라우저를 통해 로그인

Step 3에서 생성한 디바이스의 정보를 이용하여 다음과 같이 OAuthManager를 통해 값을 설정한 후에 인 앱 브라우저\(SFSafariViewController\)를 이용한 T-ID 로그인을 시도합니다. 인증 절차가 모두 완료되면 결과를 Closure를 통해 받을 수 있습니다.

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

> 로그인 정보 갱신

인 앱 브라우저를 통한 T-ID 로그인이 정상적으로 완료된 후 얻은 Refresh-token이 있다면, 이후에는 인 앱 브라우저 없이 로그인 정보를 갱신할 수 있습니다.

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
func refresh() {
    OAuthManager<Type1>.shared.loginSilently(by: "{refresh-token}") { (result) in
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

### Step 5: NUGU 서비스 사용하기

> 마이크 권한 획득

NUGU 서비스는 음성인식을 위하여 마이크 권한 문구를 Info.plist 파일에 추가합니다.

{% code-tabs %}
{% code-tabs-item title="info.plist" %}
```markup
<key>NSMicrophoneUsageDescription</key>
<string>For speech recognition</string>
```
{% endcode-tabs-item %}
{% endcode-tabs %}

음성인식을 요청 하기 전에 마이크 권한을 요청해 획득합니다.

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
AVAudioSession.sharedInstance().requestRecordPermission { hasPermission in }
```
{% endcode-tabs-item %}
{% endcode-tabs %}

> AVAudioSession Category 설정

NUGU 서비스를 이용하기 위해서는 AVAudioSession의 Category를 .playAndRecord로 설정이 필요합니다.

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
func setAudioSession() throws {
    try AVAudioSession.sharedInstance().setCategory(
        .playAndRecord,
        mode: .default,
        options: [.defaultToSpeaker]
    )
}
```
{% endcode-tabs-item %}
{% endcode-tabs %}

> NUGU 음성인식 요청

음성인식을 요청하기 위해서는 아래와 같은 코드를 작성해야 합니다.

1. NuguClientKit을 불러옵니다.

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
import NuguClientKit
```
{% endcode-tabs-item %}
{% endcode-tabs %}

2. NuguClient 인스턴스를 생성합니다. 

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
let client = NuguClient.Builder().build()
```
{% endcode-tabs-item %}
{% endcode-tabs %}

3. 로그인 결과로 받은 Access-token을 NuguClient 인스턴스에 설정합니다.

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
client.accessToken = "{access-token}" 
```
{% endcode-tabs-item %}
{% endcode-tabs %}

4. NetworkManager를 통해 NUGU서버와 연결합니다.

{% code-tabs %}
{% code-tabs-item title="ViewController.swift" %}
```swift
client.networkManager.connect() 
```
{% endcode-tabs-item %}
{% endcode-tabs %}

5. NUGU 서버와의 연결 이후 음성인식을 요청합니다.

{% code-tabs %}
{% code-tabs-item title="VIewController.swift" %}
```swift
client.asrAgent.startRecognition()
```
{% endcode-tabs-item %}
{% endcode-tabs %}

## 더 알아보기

> 구성요소 알아보기

NUGU SDK의 Github Repository를 통해 NUGU Components의 주요 기능들을 확인하실 수 있습니다. 구성요소 소개 페이지에서 필요한 [구성요소](component.md)를 확인하고, 해당 구성요소의 Repository에서 Readme를 통해 더 자세한 정보를 얻을 수 있습니다. 

> Sample Application

[NuguClientKit Github Repository](https://github.com/nugu-developers/nugu-client-kit-ios)에 있는 샘플 앱을 통해서도 NUGU SDK의 주요 사용 방법을 확인하실 수 있습니다.

