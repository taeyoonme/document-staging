# 시작하기

### Check your application

* android 5.0\(api level 21\) or later \(api level 19,20 also supported, but  tls v1.2 required\)

### Setup Dependency

At application module's build gradle, add dependencies.

```groovy
dependencies {
    // Nugu Android Client
    implementation "com.skt.nugu:nac:${latestVersion}"
    // Nugu Android UX Kit
    implementation "com.skt.nugu:nux:${latestVersion}"
    // Nugu Android Login Kit
    implementation "com.skt.nugu:nlk:${latestVersion}"
}
```

### Login to NUGU

#### Type1 \(Authorization Code\)

#### Type2 \(Client Credentials\)

### Using NUGU in your application

#### Create NuguAndroidClient instance

1. Create AuthDelegate. Use NuguOAuth at NLK to create.

```kotlin
val authDelegate = NuguOAuth.create( object : CredentialInterface {
            override fun getCredentials(): String {
                // return stored credentials, or empty string if not exist.
                return PreferenceHelper.credentials(context)
            }

            override fun setCredentials(credentials: String) {
                // save credentials if you want or nothing to do
                PreferenceHelper.credentials(context, credentials)
            }
        })
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

