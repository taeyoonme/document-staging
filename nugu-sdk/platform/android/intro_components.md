# 구성요소 소개

### Overview

NUGU SDK는 총 7개의 다음과 같은 모듈들로 구성되어 있습니다. 

* **안드로이드 의존적인 Nugu SDK 모듈 \(4가지\)**
* **플랫폼 독립적인 Nugu SDK 모듈 \(3가지\)**
* Nugu SDK를 사용하는데 필요한 기타 내부 라이브러리\(변경 가능\)
* Nugu SDK를 사용하는 애플리케이션

![](../../../.gitbook/assets/android-components-diagram.png)

1. Nugu Interface : Nugu SDK를 구성하는 필수 요소에 대한 인터페이스와 데이터 타입 등을 제공합니다. 
2. Nugu Core : Nugu 서비스 이용에 필요한 구성요소들의 기본 구현을 제공합니다.
3. Nugu Client Kit : 플랫폼 독립적인 어플리케이션에 쉽게 Nugu를 적용할 수 있도록 도와줄 수 있는 클래스들을 제공합니다.
4. Nugu Android Helper : 안드로이드 어플리케이션에 쉽게 Nugu를 적용할 수 있도록 도와줄 수 있는 클래스들을 제공합니다. 여기에는 안드로이드 프레임웍에서 제공하는 다양한 요소\(미디어 플레이어, 오디오 녹음, 로그, 볼륨 제어\)에 대한 이식 구현도 포함됩니다.
5. Nugu Internal Library Porting : Nugu 서비스를 사용하기 위해서는 다양한 요소\(발화 키워드 인식, 발화 시작/끝 인식 등\)들이 필요합니다. 이에 대한 모든 요소를 SDK에서 직접 제공하지 않기에 다른 라이브러리를 이용합니다. 이 라이브러리들을 Nugu에서 사용할 수 있도록 Nugu Interface를 준수한 이식 구현을 제공합니다.
6. Nugu UX Kit : Nugu의 디자인 가이드를 준수하는 UX 요소를 포함합니다.
7. Nugu Login Kit : Nugu에 쉽게 로그인할 수 있도록 도와주는 기능을 제공합니다.

위 구성요소 중 Nugu 서비스 개발에 필요한 **필수 모듈은 Nugu Interface와 Nugu Core 두 가지** 로 **Java를 지원하는 모든 기기에서 동작할 수 있게 이루어져 있습니다.**

