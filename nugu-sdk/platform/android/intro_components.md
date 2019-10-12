# 구성요소

![](../../../.gitbook/assets/android-components-diagram.png)

## 구성요소 목록

{% hint style="info" %}
NUGU SDK for Android 를 통한 개발을 위해서는 `NuguCore`, `NuguInterface`를 필수로 포함해야합니다.
{% endhint %}

* NUGU Component\(Platform Independent\)
  * `NuguCore` : NUGU 서비스 이용에 필요한 구성요소들의 기본 구현을 제공합니다.
  * `NuguInterface` : NUGU SDK를 구성하는 필수 요소에 대한 인터페이스와 데이터 타입 등을 제공합니다.
  * `NuguClientKit` : NUGU서비스를 쉽게 개발할 수 있도록 도와주는 기능을 제공합니다.
* NUGU Component\(Platfom Dependent\)
  * `NuguAndroidHelper` : NUGU서비스를 안드로이드 플랫폼에서 쉽게 개발할 수 있도록 도와주는 기능을 제공합니다.
  * `NuguUXKit` : NUGU의 디자인 가이드를 준수하는 UX 요소들을 제공합니다.
  * `NuguLoginKit` : NUGU의 로그인을 도와주는 기능을 제공합니다.
  * `NuguInternalLibraryPorting` : NUGU서비스 사용에 필요한 기능 중 SDK에서 직접 제공하지 않는 기능\(키워드 인식, 발화의 시작/끝 인식 등\)은 타 라이브러리를 사용합니다.  이에 대한 NUGU SDK로의 이식 구현을 제공합니다.
* Internal Library
  * `KeenSense` : 키워드 인식 기능을 제공하는 라이브러리 입니다.
  * `JadeMarble` : 발화의 시작/끝 인식 기능을 제공하는 라이브러리 입니다.
  * `SilverTray` : TTS발화에 대한 NUGU서비스 전용 플레이어입니다.

## Github

#### NUGU

| 이름 | 주소 |
| :--- | :--- |
| `nugu-android` | [https://github.com/nugu-developers/nugu-android](%20https://github.com/nugu-developers/nugu-android) |

#### Internal Library



## Maven

NUGU SDK for Android의 구성요소는 모두 별도로 추가할 수 있습니다.

```groovy
dependencies {
    implementation "com.skt.nugu:nugu-core:${nugu_latestVersion}"
    implementation "com.skt.nugu:nugu-interface:${nugu_latestVersion}"
    implementation "com.skt.nugu:nugu-client-kit:${nugu_latestVersion}"
    implementation "com.skt.nugu:nugu-android-helper:${nugu_latestVersion}"
    implementation "com.skt.nugu:nugu-ux-kit:${nugu_latestVersion}"
    implementation "com.skt.nugu:nugu-login-kit:${nugu_latestVersion}"
    implementation "com.skt.nugu:nugu-internal-library-porting:${nugu_latestVersion}"
    
    implementation "com.skt.nugu:keensense:${keensense_latestVersion}"
    implementation "com.skt.nugu:jademarble:${jademarble_latestVersion}"
    implementation "com.skt.nugu:silvertray:${silvertray_latestVersion}"
}
```

