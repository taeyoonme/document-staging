# Android

## Introduction

NUGU SDK는 Android 환경에서 누구 서비스를 쉽게 사용할 수 있도록 Android SDK를 제공하며, 아래와 같은 특징을 가지고 있습니다.

* 기능은 모두 교체 가능한 구조로 특성에 따라 쉽게 변경 가능\(Media Player, Audio Source, Keyword Detector, End Point Detector 등의 기본 구현을 제공\)
* 외부 라이브러리 사용 최소화하여 기존 애플리케이션 적용에 용이
* 플랫폼 독립적/의존적 모듈을 명확히 분리하여 Android 이외의 플랫폼으로의 확장성

## 지원하는 디바이스

기본적으로 SDK의 모든 구성요소는 Android\(5.0 이상\)을 공식적으로 지원합니다.

그리고, 보다 다양한 디바이스를 지원하기 위해 SDK는 플랫폼 독립적인 부분과 플랫폼 의존적인 부분으로 분리되어 있습니다. SDK의 핵심 기능은 플랫폼 독립적으로 Java를 지원하는 임의의 디바이스에서 사용될 수 있습니다.

{% hint style="info" %}
Android Kitkat\(4.4\)에서도 동작하지만 TLS v1.2를 사용하도록 설정이 필요합니다.
{% endhint %}

