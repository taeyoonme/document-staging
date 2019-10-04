# 시작하기

## Introduction

NUGU SDK는 Linux 기반의 다양한 임베디드 장치에서 NUGU 서비스를 동작시키기 위해 Linux SDK를 제공합니다. 

또한, 개발자들이 NUGU SDK를 사용하여 손쉽게 원하는 기능을 구현할 수 있도록 C/C++ API와 문서를 제공하고 있으며, Sample application을 통해 쉽게 동작을 확인할 수 있습니다.

## Supported platforms

Ubuntu 리눅스를 공식적으로 지원하고 있습니다. 현재 지원하는 버전은 **Xenial**\(16.04\)과 **Bionic**\(18.04\)이고, 차후 Ubuntu에서 새로운 LTS\(Long Term Support\) 버전이 Release 될 경우 지원 목록에 추가될 수 있습니다.

그리고, 다양한 장치를 지원하기 위해 64bit x86, arm\(armhf, arm64\) architecture를 지원합니다.

{% hint style="info" %}
혹시 사용 중인 리눅스가 Ubuntu가 아닐 경우, Debian 계열의 리눅스\(deb 패키지 설치가 가능\)라면 NUGU SDK 설치가 가능 할 수 있습니다. 하지만 공식 지원 OS가 아니기 때문에 이슈에 대한 대응이 늦어질을 수 있습니다.
{% endhint %}

## Install the SDK

NUGU SDK는 개발에 필요한 Library와 Header 파일들을 deb 파일\(데비안 소프트웨어 패키지 포맷\) 형태로 배포하고 있습니다. 또한 개발자들이 deb 파일을 쉽게 설치하여 사용할 수 있도록 Ubuntu에서 제공하는 [PPA](https://launchpad.net/~nugulinux/+archive/ubuntu/sdk)\([https://launchpad.net](https://launchpad.net)\)를 사용하고 있습니다.

### PPA 추가하기

아래 명령을 통해 시스템에 NUGU SDK PPA를 추가할 수 있습니다.

{% tabs %}
{% tab title="Ubuntu" %}
```bash
sudo add-apt-repository ppa:nugulinux/sdk
sudo apt-get update
```
{% endtab %}

{% tab title="Debian" %}
사용하고 있는 Debian 버전에 따라 NUGU SDK의 Bionic 또는 Xenial PPA 주소를 추가해야 합니다.

```bash
# Debian 버전이 Buster일 경우
$ sudo vi /etc/apt/sources.list.d/nugu.list
deb http://ppa.launchpad.net/nugulinux/sdk/ubuntu bionic main

# Debian 버전이 Stretch일 경우
$ sudo vi /etc/apt/sources.list.d/nugu.list
deb http://ppa.launchpad.net/nugulinux/sdk/ubuntu xenial main
```

이제 NUGU SDK PPA에 대한 인증키를 설치해야 합니다.

```bash
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key 5DE933034EEA59C4
```
{% endtab %}
{% endtabs %}

### 설치하기

NUGU SDK는 아래의 패키지들을 제공하고 있습니다. 동작을 위해서는 기본으로 `libnugu`와 `libnugu-plugins-default` 패키지가 필요하고, 개발\(빌드\)을 할 경우에는 `libnugu-dev` 패키지가 추가로 필요합니다.

| 패키지 | 설 |
| :--- | :--- |
| libnugu | NUGU SDK 동작에 필요한 파일 - Shared library\(\*.so.{version} files\) |
| libnugu-plugins-default | NUGU SDK Default plugins - gstreamer, opus, portaudio  |
| libnugu-dev | NUGU SDK 개발에 필요한 파일 - header files\(\*.h, \*.hh\) 및 libnugu.so |
| libnugu-examples | NUGU SDK Examples \(콘솔 기반의 샘플 프로그램, OAuth2 클라이언트\) |

아래 명령을 통해 시스템에 설치할 수 있습니다.

```text
sudo apt install libnugu libnugu-plugins-default libnugu-dev libnugu-examples
```

## 

