# 구성요소

## Overview

Linux SDK는 크게 아래와 같이 구성되어 있습니다.

```text
/------------------------------------\
|                                    |
|             Application            |
|                                    |
\------------------------------------/

                                       ---\
/------------------------------------\    |
|                                    |    |
|            NuguClientKit           |    |
|                                    |    |
\------------------------------------/    |
                                          | C/C++
/-----------------\     /------------\    |
|                 |     |            |    |
|  NuguInterface  |     |  NuguCore  |    |
|                 |     |            |    |
\-----------------/     \------------/    |
                                       ---/

/------------------------------------\
|                                    |
|              Plug-in               +----- C
|                                    |
|    GStreamer PortAudio Opus ...    |
\------------------------------------/
```

Application 개발자를 위해 `NuguClientKit`, `NuguInterface`, `NuguCore` 모듈을 제공하고 있고, 디바이스 특성에 맞게 장치 연동 부분을 쉽게 개발할 수 있도록 Plug-in 개발 모듈을 제공하고 있습니다.

| 모듈 | 설명 |
| :--- | :--- |
| `NuguClientKit` | TODO |
| `NuguInterface` | TODO |
| `NuguCore` | TODO |

## Dependency

Linux SDK는 아래의 외부 library를 사용하고 있습니다. 때문에 사용하고 있는 Linux 시스템에 아래 패키지들이 설치되어 있어야 합니다.

| 이름 | 패키지명 |
| :--- | :--- |
| PortAudio | portaudio19-dev |
| Alsa | libasound2-dev |
| GStreamer | libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev |
| GLib | libglib2.0-dev |
| SSL | libssl-dev |
| UUID | uuid-dev |
| ZLib | zlib1g-dev |

또한, 오래된 Linux 배포판의 HTTP/2 지원을 위해 내부적으로 아래 Open-source들을 코드 수정 없이 Linux SDK 빌드에 포함하여 배포하고 있습니다.

| 이름 | 주소 |
| :--- | :--- |
| libcurl | [https://github.com/curl/curl.git](https://github.com/curl/curl.git) |
| nghttp2 | [https://github.com/nghttp2/nghttp2.git](https://github.com/nghttp2/nghttp2.git) |
| jsoncpp | [https://github.com/open-source-parsers/jsoncpp.git](https://github.com/open-source-parsers/jsoncpp.git) |





