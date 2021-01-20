# NUGU 서비스 관리 web server 연동

## WebView 설정하기

### Cookie 설정

NUGU 서비스 관리 웹에서 사용할 cookie 를 설정합니다.

* authToken: OAuth bearer 토큰
* appVersion: Application 버전 정보
* pocId: [https://developers.nugu.co.kr/\#/sdk/pocList](https://developers.nugu.co.kr/#/sdk/pocList) 에서 확인 가능
* theme: LIGHT 또는 DARK
* oauthRedirectUri: NUGU 서비스 관리 웹 내에서 Play 에 로그인 하고 나면 호출되는 url \(ex&gt; nugu.public.sample://oauth\_refresh\)

{% code title="NuguServiceWebViewController.swift" %}
```swift
@IBOutlet private weak var nuguServiceWebView: NuguServiceWebView!

override func viewDidLoad() {
    super.viewDidLoad()
    
    let cookie = NuguServiceCookie(
        authToken: AuthorizationStore.shared.authorizationToken,
        appVersion: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "",
        pocId: pocId,
        theme: "LIGHT",
        oauthRedirectUri: url
    )
    nuguServiceWebView.setNuguServiceCookie(nuguServiceCookie: cookie)
}

```
{% endcode %}

### Javascript interface 연동

* `openExternalApp(openExternalAppItem:)` : 외부 앱 실행 요청
* `openInAppBrowser(url:)` : 인 앱 브라우저 실행 요청
* `closeWindow(reason:)` : `ViewController` 종료 요청. `reason` 이 `WITHDRAWN_USER` 인 경우 회원탈퇴 요청으로 인한 종료이기 때문에, 인증정보 등을 파기해야 합니다.

{% code title="NuguServiceWebViewController.swift" %}
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    nuguServiceWebView.javascriptDelegate = self
}

extension NuguServiceWebViewController: NuguServiceWebJavascriptDelegate {
    func openExternalApp(openExternalAppItem: WebOpenExternalApp) {
        log.debug("openExternalApp : \(openExternalAppItem)")
        if let appSchemeUrl = URL(string: openExternalAppItem.scheme ?? ""),
            UIApplication.shared.canOpenURL(appSchemeUrl) == true {
            UIApplication.shared.open(appSchemeUrl, options: [:], completionHandler: nil)
            return
        }
        if let appId = openExternalAppItem.appId,
            let appStoreUrl = URL(string: "https://itunes.apple.com/app/" + appId + "?mt=8"),
            UIApplication.shared.canOpenURL(appStoreUrl) == true {
            UIApplication.shared.open(appStoreUrl, options: [:], completionHandler: nil)
        }
    }
    
    func openInAppBrowser(url: String) {
        log.debug("openInAppBrowser : \(url)")
        present(SFSafariViewController(url: URL(string: url)!), animated: true, completion: nil)
    }
    
    func closeWindow(reason: String) {
        log.debug("closeWindow : \(reason)")
        if reason == "WITHDRAWN_USER" {
            navigationController?.dismiss(animated: true, completion: {
                // 인증 정보 파기
            })
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

```
{% endcode %}

## NUGU 서비스 관리 웹 호출

* `NuguServiceWebView.serviceSettingUrl`: NUGU 서비스 관리 웹 사이트
* `NuguServiceWebView.agreementUrl`: NUGU 이용약관 웹 사이트

{% code title="NuguServiceWebViewController.swift" %}
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    nuguServiceWebView.loadUrlString(NuguServiceWebView.serviceSettingUrl)
}
```
{% endcode %}

## Play 로그인 결과 전달

NUGU 서비스 관리 웹 내에서 Play 에 로그인 하고 나면 `oauthRedirectUri` 가 호출되며, `WebView` 를 갱신하면 로그인 결과가 웹 페이지에 반영됩니다.

* 로그인 결과를 전달하기 위한 `Notification` 을 정의합니다.

```swift
static let oauthRefresh = Notification.Name("com.skt.Romaine.oauth_refresh")
```

* `application(_:open:options)` 에서 `url` 이 `oauthRedirectUri` 인 경우 `Notification` 을 전송합니다. 

{% code title="AppDelegate.swift" %}
```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    if url.absoluteString == SampleApp.oauthRedirectUri {
        NotificationCenter.default.post(name: .oauthRefresh, object: nil, userInfo: nil)
        return true
    }
}
```
{% endcode %}

* `ViewController` 에서 `Notification` 을 받으면 `WebView` 를 갱신합니다.

{% code title="NuguServiceWebViewController.swift" %}
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(
        self,
        selector: #selector(refreshAfterOauth),
        name: .oauthRefresh,
        object: nil
    )
}

@objc func refreshAfterOauth() {
    presentedViewController?.dismiss(animated: true, completion: nil)
    nuguServiceWebView.reload()
}
```
{% endcode %}

