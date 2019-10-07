# 시작하기

## 개발환경 설정하기

### 최소 요구사항

* Android 5.0\(api level 21\) or later \(api level 19,20 also supported, but  tls v1.2 required\)

### 레포지토리 추가하기

프로젝트의 build.gradle에 레포지토리를 추가합니다.

```groovy
repositories {
    jcenter()
}
```

### 의존성 추가하기

어플리케이션 모듈의 build.gradle에, 전체 라이브러리를 사용하기 위해 아래 의존성을 추가합니.  
\(전체 라이브러리에 대한 의존성은 여기를 참조\)

```groovy
dependencies {
    // Nugu Android Helper
    implementation "com.skt.nugu:nugu-android-helper:${latestVersion}"
    // Nugu Android UX Kit
    implementation "com.skt.nugu:nugu-ux-kit:${latestVersion}"
    // Nugu Android Login Kit
    implementation "com.skt.nugu:nugu-login-kit:${latestVersion}"
}
```

### 앱 권한 설정하기

AndroidManifest.xml에 아래 필수 권한을 추가합니다.  
\(android.permission.RECORD\_AUDIO 권한은 runtime에 요청하여 획득해야 합니다.\)

```markup
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

## SDK 사용하기

### Step1. NUGU에 로그인하는 방법

#### Type1 \(Authorization Code\)

> 리소스 수정

values/_strings_._xml_ 파일_을 열고_ _nugu\_redirect\_scheme, nugu\_redirect\_host 를 추가 합니다._ 예를들어 redirectUri 는\(은\)  **"example: // sample"** 라면 아래와 같이 2개 라인이 추가 됩니다.

```markup
<string name="nugu_redirect_scheme">example</string>
<string name="nugu_redirect_host">sample</string>
```

> 초기화,  client 생성

발급받은 clientId, clientSecret, redirectUri 로 변경

```kotlin
private val authClient by lazy {
    // Configure Nugu OAuth Options
    val options = NuguOAuthOptions.Builder()
        .clientId("{your-client-id}")
        .clientSecret("{your-client-secret}")
        .redirectUri("{your-redirect-url}")
        .deviceUniqueId("{your-device-uniqueId}")
        .build()
    NuguOAuth.getInstance(options)
}
```

> OAuth 인증

로그인은 loginByWebbrowser\(\) method를 호출후에 NuguOAuthInterface.OnLoginListener를 통해 인증 결과를 받습니다.

```kotlin
authClient.loginByWebbrowser( activity = this, listener = object : NuguOAuthInterface.OnLoginListener {
            override fun onSuccess(credentials: Credentials) {
                // Save Credentials
                client.accessToken = credentials.accessToken
            }

            override fun onError(reason: String) {
                // Called when the request failed.
            }
        })
```

이미 refresh-Token을 발급 받은 상태라면,  loginByWebbrowser\(\) method를 호출하지 말고 silentLogin method를 실행하여 토큰을 갱신 할수 있습니다.

```kotlin
authClient.silentLogin("{refresh-Token}", object : NuguOAuthInterface.OnLoginListener {
            override fun onSuccess(credentials: Credentials) {
                // Save Credentials
                client.accessToken = credentials.accessToken
            }

            override fun onError(reason: String) {
                // Called when the request failed.
            }
        })
```

### Step2. NUGU 서비스 사용하기

로그인 후, 모든 NUGU의 기능을 사용할 수 있습니다. 여기서는 음성인식을 시작하는 기본적인 방법을 설명하겠습니다.

#### Create NuguAndroidClient instance

1. Create AuthDelegate. Use NuguOAuth at NLK to create.

```kotlin
val authDelegate = NuguOAuth.create()
```

2. Create AudioProvider. Use AudioSourceManager as default implementation.

```kotlin
val audioProvider = AudioSourceManager(AudioRecordSourceFactory())
```

3. Create NuguAndroidClient & start ASR.

```kotlin
val client = NuguAndroidClient.Builder(
    context,    // Android Context
    authDelegate,
    audioProvider
).build()

client.asrAgent?.startRecognition()
```

