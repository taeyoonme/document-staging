# 시작하기

## Step 1: 최소 요구사항 확인하기

* Xcode 11.0 or later
* Swift 5.1
* iOS 10.0 or later

## Step 2: NUGU SDK 설치하기

{% tabs %}
{% tab title="Cocoapods" %}
`Podfile`에 다음과 같이 의존성을 추가합니다.

```ruby
target '{Your_Application}' do
  pod 'NuguClientKit'
  pod 'NuguLoginKit'
  pod 'NuguUIKit'
  pod 'NuguServiceKit'
end
```

터미널을 열어 Podfile이 있는 프로젝트 경로에서 아래 Script를 실행합니다.

```bash
$ pod install
```
{% endtab %}

{% tab title="Carthage" %}
`Cartfile`에 다음과 같이 의존성을 추가합니다.

```swift
github "nugu-developers/nugu-ios"
```

터미널을 열어 Podfile이 있는 프로젝트 경로에서 아래 Script를 실행합니다.

```swift
carthage update --platform iOS
```
{% endtab %}
{% endtabs %}

## Step 3: 프로젝트 설정하기

### PoC 정보 입력하기

{% hint style="warning" %}
NUGU PoC를 생성하기 위해서는 NUGU Developers를 통해 제휴가 필요합니다.  
더 자세한 내용은 [NUGU SDK 소개](https://developers.nugu.co.kr/#/sdk/nuguSdkInfo)에서 확인이 가능합니다.
{% endhint %}

제휴를 통해 생성된 PoC 정보를 확인하기 위해서 [NUGU SDK PoC목록](https://developers.nugu.co.kr/#/sdk/pocList)으로 이동해서 Client ID, Client Secret, Redirect URI 정보를 확인하세요.

{% hint style="success" %}
NUGU SDK를 사용하는 앱 간에 URL Scheme 충돌을 방지하기 위해,  
Redirect URI는 `nugu.user.{client-id}://auth`로 설정하는 것을 권고합니다.
{% endhint %}

#### info.plist 파일에 URL Scheme 추가

`info.plist` 파일에 다음과 같이 URL Scheme을 추가합니다.

{% tabs %}
{% tab title="info.plist" %}
```markup
<dict>
  <key>CFBundleURLTypes</key>
  <array>
    <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>nugu.user.{client-id}</string>
    </array>
    </dict>
  </array>
</dict>
```
{% endtab %}
{% endtabs %}

### 음성인식 모델 파일 설정하기

#### 다운로드 받기

[NUGU SDK PoC목록](https://developers.nugu.co.kr/#/sdk/pocList)에서 음성인식 모델 파일을 다운로드 받습니다.

#### 설정하기

다운로드 받은 파일을 Application 에 복사하고 target 으로 추가합니다.

* Example
  * `{application path}/Supporting Files/skt_trigger_search_tinkerbell.raw`
  * `{application path}/Supporting Files/skt_trigger_am_tinkerbell.raw`
  * `{application path}/Supporting Files/skt_trigger_search_aria.raw`
  * `{application path}/Supporting Files/skt_trigger_am_aria.raw`
  * `{application path}/Supporting Files/skt_epd_model.raw`

음성인식 모델 파일을 SDK 로 전달합니다.

{% tabs %}
{% tab title="EndPointDetector 모델 파일 설정" %}
```swift
if let epdFile = Bundle.main.url(forResource: "skt_epd_model", withExtension: "raw") {
    client.asrAgent.options = ASROptions(endPointing: .client(epdFile: epdFile))
}
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="KeywordDetector 모델 파일 설정" %}
```swift
if let netFile = Bundle.main.url(forResource: "skt_trigger_am_aria", withExtension: "raw"),
   let searchFile = Bundle.main.url(forResource: "skt_trigger_search_aria", withExtension: "raw") {
    let keyword.keywordSource = KeywordSource(keyword: "아리아", netFileUrl: netFile, searchFileUrl: searchFile)
    client.keywordDetector.keywordSource = keyword.keywordSource
}
```
{% endtab %}
{% endtabs %}

### 어플리케이션 권한 설정하기

NUGU 서비스는 음성인식을 위하여 마이크 권한 문구를 Info.plist 파일에 추가합니다.

{% tabs %}
{% tab title="info.plist" %}
```markup
<key>NSMicrophoneUsageDescription</key>
<string>For speech recognition</string>
```
{% endtab %}
{% endtabs %}

## Step 4: NUGU 사용하기

### NUGU 로그인 추가

{% hint style="info" %}
NUGU 서비스를 이용하기 위해서는 OAuth 2.0 인증이 필요합니다.  
더 자세한 내용은 [Authentication](../../authentication.md) 에서 확인이 가능합니다.
{% endhint %}

#### NuguLoginKit 불러오기

NUGU의 인증서버와 OAuth 인증을 쉽게 하기 위해서 `NuguLoginKit`을 불러옵니다.

```swift
import NuguLoginKit
```

#### 앱 델리게이트 연결

인 앱 브라우저를 통한 인증 결과를 `NuguLoginKit`에서 처리하기 위해 다음과 같이 `AppDelegate` 클래스에 추가해야 합니다.

{% tabs %}
{% tab title="AppDelegate.swift" %}
```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    // Only for free pass of Sample app's Oauth validation check
    guard let schemeReplacedUrl = SampleApp.schemeReplacedUrl(openUrl: url) else { return false }
    
    NuguOAuthClient.handle(url: schemeReplacedUrl)
    return true
}
```
{% endtab %}
{% endtabs %}

#### 인 앱 브라우저를 통해 로그인

PoC 정보를 이용하여 다음과 같이 `OAuthManager`를 통해 값을 설정한 후에 인 앱 브라우저\(`SFSafariViewController`\)를 이용한 T-ID 로그인을 시도합니다. 인증 절차가 모두 완료되면 결과를 Closure를 통해 받을 수 있습니다.

{% tabs %}
{% tab title="ViewController.swift" %}
```swift
lazy private(set) var oauthClient: NuguOAuthClient = {
    do {
        return try NuguOAuthClient(serviceName: Bundle.main.bundleIdentifier ?? "NuguSample")
    } catch {
        return NuguOAuthClient(deviceUniqueId: "{device-unique-id}")
    }
}()
    
func login() {
    oauthClient.authorize(
        grant: AuthorizationCodeGrant(
            clientId: "{client-id}",
            clientSecret: "{client-secret}",
            redirectUri: "{redirect-uri}"
        ),
        parentViewController: self) { (result) in
            switch result {
            case .success(let authInfo):
                // Save authInfo
            case .failure(let error):
                // Occured error
            }
    }
}
```
{% endtab %}
{% endtabs %}

#### 로그인 정보 갱신

발급 받은 `refresh-token`이 이미 있다면, 이 후에는 인 앱 브라우저 없이 로그인 정보를 갱신할 수 있습니다.

{% tabs %}
{% tab title="ViewController.swift" %}
```swift
func refresh() {

    oauthClient.authorize(grant: RefreshTokenGrant(clientId: "{client-id}", clientSecret: "{client-secret}", refreshToken: "{refresh-token}")) { (result) in
        switch result {
        case .success(let authInfo):
            // Save authInfo
        case .failure(let error):
            // Occured error
        }
    }
}
```
{% endtab %}
{% endtabs %}

### NUGU 음성인식 사용하기

#### 마이크 권한 획득

음성인식을 요청 하기 전에 마이크 권한을 요청해 획득합니다.

{% tabs %}
{% tab title="ViewController.swift" %}
```swift
AVAudioSession.sharedInstance().requestRecordPermission { hasPermission in }
```
{% endtab %}
{% endtabs %}

#### AVAudioSession 설정

NUGU 서비스를 이용하기 위해서는 `AVAudioSession`의 `Category`를 `.playAndRecord`로 설정이 필요합니다.

{% tabs %}
{% tab title="ViewController.swift" %}
```swift
func setAudioSession() throws {
    try AVAudioSession.sharedInstance().setCategory(
        .playAndRecord,
        mode: .default,
        options: [.defaultToSpeaker, .allowBluetoothA2DP]
    )
}
```
{% endtab %}
{% endtabs %}

#### NUGU 음성인식 요청

음성인식을 요청하기 위해서는 아래와 같은 코드를 작성해야 합니다.

1. `NuguClientKit`을 불러옵니다.  

   ```swift
   import NuguClientKit
   ```

2. `NuguClient` 인스턴스를 생성합니다.     

   ```swift
   let client = NuguClient(delegate: self)
   ```

3. 로그인 결과로 받은 Access-token을 `NuguClientDelegate` 로 전달해야 합니다.

   ```swift
   func nuguClientRequestAccessToken() -> String? {
       return "{access-token}"
   }
   ```

4. NUGU 서버와의 연결 이후 음성인식을 요청합니다.    

   ```swift
   client.asrAgent.startRecognition(initiator: .user)
   ```

## 더 알아보기

### Sample Application

NUGU SDK for iOS의 Github Repository에 있는 샘플 앱을 통해서도 NUGU SDK의 주요 사용 방법을 확인하실 수 있습니다.

{% embed url="https://github.com/nugu-developers/nugu-ios" %}

