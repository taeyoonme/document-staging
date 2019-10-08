# Linux

## Introduction

NUGU SDK는 Linux 기반의 다양한 임베디드 장치에 NUGU 서비스를 쉽게 동작시키기 위해 Linux SDK를 제공합니다. 

Linux SDK는 개발자들이 원하는 기능을 구현할 수 있도록 C/C++ API와 문서를 제공하고 있으며, 아래와 같은 특징을 가지고 있습니다.

* deb 패키지\(Debian Package\)로 배포하여 쉽게 설치 가능.
* SDK 자체에서 plug-in 구조를 지원하여, 디바이스 특성에 따라 쉽게 Porting 가능. \(GStreamer, PortAudio, Opus decoder 등의 기본 plug-in 함께 제공\)
* GMainloop 기반으로 구현되어 event-driven 방식의 Application 개발 용이.

## Supported platforms

Linux SDK는 현재 Ubuntu Linux를 공식적으로 지원하고 있습니다. 지원하는 버전은 **Xenial**\(16.04\)과 **Bionic**\(18.04\)이고, 차후 Ubuntu에서 새로운 LTS\(Long Term Support\) 버전이 Release 될 경우 지원 목록에 추가될 수 있습니다.

그리고, 다양한 장치를 지원하기 위해 64bit x86, arm\(armhf, arm64\) architecture를 지원합니다.

{% hint style="info" %}
사용 중인 Linux가 Debian 계열의 Linux\(deb 패키지 설치가 가능\)일 경우, NUGU SDK 설치가 가능 할 수 있습니다. 하지만 현재는 Ubuntu만 공식적으로 지원하고 있기 때문에 다른 배포판에 대한 이슈 대응은 늦어질 수 있습니다.
{% endhint %}

