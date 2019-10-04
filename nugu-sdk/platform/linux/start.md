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

```bash
sudo apt-get install libnugu libnugu-plugins-default libnugu-dev libnugu-examples
```

## Sample application

본격적으로 개발을 시작하기 전에 먼저 NUGU SDK의 기능을 확인해 볼 수 있도록 아래와 같이 2가지 샘플을 제공하고 있습니다.

* 인증을 위한 OAuth2 예제 - Python으로 작성된 Web 기반의 OAuth2 client sample
* 기능 동작 확인을 위한 예제 - 콘솔에서 동작하는 텍스트 기반의 Sample application

위 샘플들은 `libnugu-examples` 패키지안에 모두 포함되어 있으며, 아래 파일들이 설치됩니다.

| 파 | 설 |
| :--- | :--- |
| /usr/bin/nugu\_oob\_server | OAuth2 인증을 위한 웹서버 - Python script, 8080 포트 사용 |
| /usr/bin/nugu\_sample | 콘솔 기반의 Sample application |
| /usr/bin/nugusdk\_start\_sample | 저장된 인증 토큰 값을 읽어서 환경 변수로 설정해주는 Shell script |
| /lib/systemd/system/nugu\_oob.service | 시스템 시작시 OAuth2 인증 웹서버를 자동으로 실행시키기 위한 systemd 설정 파일 |

### OAuth2 인증

웹브라우저를 통해 [http://lvh.me:8080 ](http://lvh.me:8080%20)주소\(lvh.me는 localhost와 같습니다\)로 접속하면 아래와 같이 OAuth2 인증을 위한 샘플 화면이 나타납니다.

... {이미지 캡쳐 삽입} ...

인증을 위해 미리 발급받은 `poc_id`, `client_id`, `client_secret`을 입력하고, 테스트 하려는 디바이스를 구분하기 위해 `device serial`에 중복되지 않는 임의의 값\(예: mydevice1234\)을 입력 한 후 **Save** 버튼을 눌러 저장합니다.

... {이미지 캡쳐 삽입} ...

이제 **Get OAuth2 token** 링크를 눌러 인증을 진행하면, 아래와 같이최종적으로 `access_token`을 얻을 수 있습니다.

... {이미지 캡쳐 삽입} ...

위 정보들은 `/var/lib/nugu/nugu-auth.json` 파일에 아래 JSON 형태로 저장됩니다. 따라서, 필요시 아래 파일에서 원하는 값을 읽어서 사용할 수 있습니다.

```javascript
{
    "refresh_token" : "...",
    "access_token" : "...",
    "expires_in" : ...,
    "token_type" : "Bearer",
    "expires_at" : ...,
    "jti" : "..."
}
```

### Sample application

Sample application은 환경 변수를 통해 인증 정보를 전달받아서 실행합니다. 따라서, 아래와 같이 직접 환경 변수를 설정한 뒤 실행하거나, nugusdk\_start\_sample Shell script를 사용해서 실행할 수 있습니다.

{% tabs %}
{% tab title="Shell script 사용" %}
```bash
$ nugusdk_start_sample /usr/bin/nugu_sample
```
{% endtab %}

{% tab title="직접 실행" %}
```bash
$ export NUGU_TOKEN=...
$ /usr/bin/nugu_sample
```
{% endtab %}
{% endtabs %}

정상적으로 실행이 되면, 아래와 같이 텍스트 기반의 UI가 콘솔에 표시됩니다.

```bash
=======================================================
NUGU SDK Command (Connected)
=======================================================
w : start wakeup
l : start listening
s : stop listening
t : text input
c : connect
d : disconnect
q : quit
-------------------------------------------------------
Select Command >
```

각 명령에 대한 설명은 아래와 같습니다.

| 명령 | 설명 |
| :--- | :--- |
| `w` | 정해진 Wake word\('아리아'\)를 통해 wake-up 하기 위한 상태로 진입합니다. |
| `l` | wake-up 없이 바로 음성 발화를 NUGU 서비스에 전달합니다. 발화가 끝나면 NUGU 서비스에서 응답\(TTS\)이 오고, 자동으로 wake-up 대기 상태로 전환됩니다. |
| `s` | 발화를 강제로 중지 시킵니다. |
| `t` | 텍스트\(예: "오늘 며이야"\)를 NUGU 서비스에 전달합니다. 음성 발화와 동일하게 NUGU 서비스에서 응답을 받을 수 있습니다. |
| `c` | NUGU 서비스와 네트워크를 연결합니다. 참고로, Sample application 실행시 자동으로 연결을 시도합니다. |
| `d` | NUGU 서비스와 네트워크 연결을 끊습니다. |
| `q` | Sample application을 종료합니다. |

이제 `w` 명령을 통한 실제 사용 예제를 보여 드리겠습니다.

```bash
Select Command > w
[Wakeup] wakeup detecting...
```

상태가 wakeup detecting 모드로 전환된 것을 확인할 수 있습니다. 이제 "**아리아**" 라고 발화를 하면 아래와 같이 wakeup이 되고, 자동으로 사용자의 음성을 듣기 위해 Listening 모드로 전환됩니다.

```bash
[Wakeup] wakeup detected
[ASR] LISTENING
```

이제 "**오늘 며칠이야**" 라고 발화를 하면 Recognizing으로 상태로 바뀌면서 음성 데이터를 NUGU 서비스로 전송하게 됩니다. 사용자 발화가 다 끝나면 NUGU 서비스로부터 응답을 받기 위해 Busy 상태로 전환됩니다.

```bash
[ASR] RECOGNIZING
[ASR] BUSY
```

NUGU 서비스로부터 응답이 오면 해당 발화에 대한 인식 결과를 보여주고 자동으로 다시 Wakeup 대기 상태로 전환됩니다. 그리고 발화에 대한 결과로 TTS 음성을 출력합니다.

```bash
[ASR] onComplete : 오늘 며칠이야
[ASR] IDLE
[Wakeup] wakeup detecting...
[TTS] tts playing...
[TTS] text : 오늘은 10월 4일 금요일입니다.
[TTS] tts playing finished
```

## Create your first application

API ...

Build ...





