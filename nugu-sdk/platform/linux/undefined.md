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

Application 개발자를 위해 NuguClientKit, NuguInterface, NuguCore 모듈을 제공하고 있고, 디바이스 특성에 맞게 장치 연동 부분을 쉽게 개발할 수 있도록 Plug-in 개발 모듈을 제공하고 있습니다.

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

## Plug-in development

### Plug-in basic structure

기본적으로 Plug-in은 Shared library\(\*.so\) 파일로 존재해야 하고, 아래의 구조체 타입의 `nugu_plugin_define_desc` 이름을 가지고 있는 Symbol이 있어야 합니다.

```c
struct nugu_plugin_desc {
	const char *name;
	unsigned int priority;
	const char *version;
	int (*load)(void);
	void (*unload)(NuguPlugin *p);
	int (*init)(NuguPlugin *p);
};
```

Plug-in 정의를 쉽게 할 수 있도록 `NUGU_PLUGIN_DEFINE` 이라는 macro를 제공하고 있습니다.

아래는 Plug-in의 아주 기본적인 샘플 코드입니다.

```c
#include <nugu_log.h>
#include <nugu_plugin.h>

static int init(NuguPlugin *p)
{
	nugu_dbg("plugin-init '%s'", nugu_plugin_get_description(p)->name);

	return 0;
}

static int load(void)
{
	nugu_dbg("plugin-load");

	return 0;
}

static void unload(NuguPlugin *p)
{
	nugu_dbg("plugin-unload '%s'", nugu_plugin_get_description(p)->name);
}

NUGU_PLUGIN_DEFINE("dummy",
	NUGU_PLUGIN_PRIORITY_DEFAULT,
	"0.0.1",
	load,
	unload,
	init);
```

Plug-in이 처음 Load\(`dlopen`\)되면 `load()` 함수가 호출됩니다. 여러개의 Plug-in이 있을 경우, `load()` 함수의 호출 순서는 보장되지 않습니다.

모든 Plug-in의 Load 과정이 끝나면, 우선순위\(`proprity`\)에 의해 `init()` 함수가 차례대로 호출됩니다. 따라서 Plug-in 사이에 의존성이 있을 경우에는 우선순위 값을 이용해서 순서를 조정할 수 있습니다.

###  Supported drivers

Linux SDK는 아래와 같은 driver interface들을 제공합니다.

* `nugu_decoder_driver`
* `nugu_pcm_driver`
* `nugu_player_driver`
* `nugu_recorder_driver`

각 driver에 대한 세부 설명은 API 문서와 샘플을 참고 바랍니다. 



