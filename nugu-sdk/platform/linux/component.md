# 구성요소

## Overview

Linux SDK는 크게 아래와 같이 구성되어 있습니다.

![](../../../.gitbook/assets/open-sdk-architecture-linux.png)

Application 개발자를 위해 `NuguClientKit`, `NuguInterface`, `NuguCore` 모듈을 제공하고 있고, 디바이스 특성에 맞게 장치 연동 부분을 쉽게 개발할 수 있도록 `Plug-in` 개발 모듈을 제공하고 있습니다.

| 모듈 | 설명 |
| :--- | :--- |
| `NuguClientKit` | NUGU 서비스를 쉽게 개발할 수 있는 API를 제공합니다. |
| `NuguInterface` | Capability를 쉽게 제어할 수 있는 API를 제공합니다. |
| `NuguCore` | NUGU 서비스 개발에 필요한 구성요소들을 제공합니다. |

## Dependency

Linux SDK는 아래의 외부 library를 사용하고 있습니다. 때문에 사용하고 있는 Linux 시스템에 아래 패키지들이 설치되어 있어야 합니다.

| 이름 | 패키지명 |
| :--- | :--- |
| PortAudio | portaudio19-dev |
| Alsa | libasound2-dev |
| GStreamer | libgstreamer1.0-dev, libgstreamer-plugins-base1.0-dev |
| GLib | libglib2.0-dev |
| SSL | libssl-dev |
| UUID | uuid-dev |
| ZLib | zlib1g-dev |
| nugu-wwd | libnugu-wwd-dev |
| nugu-epd | libnugu-epd-dev |

또한, 오래된 Linux 배포판의 HTTP/2 지원을 위해 내부적으로 아래 Open-source들을 코드 수정 없이 Linux SDK 빌드에 포함하여 배포하고 있습니다.

| 이름 | 주소 |
| :--- | :--- |
| libcurl | [https://github.com/curl/curl.git](https://github.com/curl/curl.git) |
| nghttp2 | [https://github.com/nghttp2/nghttp2.git](https://github.com/nghttp2/nghttp2.git) |
| jsoncpp | [https://github.com/open-source-parsers/jsoncpp.git](https://github.com/open-source-parsers/jsoncpp.git) |

