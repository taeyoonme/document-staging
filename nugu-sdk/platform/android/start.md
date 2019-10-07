# 시작하기

## 개발환경 설정하기

### 최소 요구사항

* Android 5.0\(api level 21\) or later \(api level 19,20 also supported, but  tls v1.2 required\)

### 레포지토리 추가하기

프로젝트의 build.gradle에 다음 레포지토리를 추가한다.

```groovy
repositories {
    jcenter()
}
```

### 의존성 추가하기

어플리케이션 모듈의 build.gradle에, 전체 라이브러리를 사용하기 위해 아래 의존성을 추가한다.  
\(전체 라이브러리에 대한 의존성은 여기서 확인할 수 있다\)

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

AndroidManifest.xml에 아래 필수 권한을 추가한다.  
\(android.permission.RECORD\_AUDIO 권한은 runtime에 요청하여 획득해야한다\)

```markup
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

## SDK 사용하기

### Login to NUGU

#### Type1 \(Authorization Code\)

> Add url scheme in strings.xml

Open the file strings.xml and add the value of the _nugu\_redirect\_scheme_, _nugu\_redirect\_host_ For example, If redirectUri is issued as **"example: // sample"**

In _strings.xml_

```markup
<string name="nugu_redirect_scheme">example</string>
<string name="nugu_redirect_host">sample</string>
```

> Initializes, creates a new authClient for TYPE1

Change the issued clientId, clientSecret, redirectUri information.

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

> Authentication to NUGU OAuth platform

login is done via call the loginWithBrowser\(\) method on the ClientManager.getAuthClient\(\). After the call, you can receive the result from NuguOAuthInterface.OnLoginListener.

```kotlin
authClient.loginWithBrowser( activity = this, listener = object : NuguOAuthInterface.OnLoginListener {
            override fun onSuccess(credentials: Credentials) {
                // Save Credentials
                client.accessToken = credentials.accessToken
            }

            override fun onError(reason: String) {
                // Called when the request failed.
            }
        })
```

> Refresh access-token \(silently method\)

```kotlin
authClient.refreshToken("{refresh-Token}", object : NuguOAuthInterface.OnLoginListener {
            override fun onSuccess(credentials: Credentials) {
                // Save Credentials
                client.accessToken = credentials.accessToken
            }

            override fun onError(reason: String) {
                // Called when the request failed.
            }
        })
```

#### Type2 \(Client Credentials\)

> Initializes, creates a new authClient for TYPE2

Change the issued clientId, clientSecret information.

```kotlin
private val authClient by lazy {
    // Configure Nugu OAuth Options
    val options = NuguOAuthOptions.Builder()
        .clientId("{your-client-id}")
        .clientSecret("{your-client-secret}")
        .deviceUniqueId("{your-device-uniqueId}")
        .build()
    NuguOAuth.getInstance(options)
}
```

> Authentication to NUGU OAuth platform

```kotlin
authClient.loginWithCredentials(object : NuguOAuthInterface.OnLoginListener {
        override fun onSuccess(credentials: Credentials) {
            // Save Credentials
            client.accessToken = credentials.accessToken
        }

        override fun onError(reason: String) {
            // Called when the request failed.
        }
)
```

### Using NUGU in your application

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

