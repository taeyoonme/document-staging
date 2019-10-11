# 시작하기

## Step 1: Install the SDK

Linux SDK는 패키지\(`*.deb` 파일\)들을 쉽게 다운로드 받아 설치할 수 있도록 Ubuntu에서 제공하는 [PPA](https://launchpad.net/~nugulinux/+archive/ubuntu/sdk)\([https://launchpad.net](https://launchpad.net)\)에 관련 파일들을 올려 놓았습니다.

### PPA 추가하기

아래 명령을 통해 시스템에 PPA를 추가할 수 있습니다.

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
sudo apt-get update
```
{% endtab %}
{% endtabs %}

### 패키지 설치하기

Linux SDK는 아래의 패키지들로 구성되어 있습니다.

| 패키지 | 설명 |
| :--- | :--- |
| `libnugu` | NUGU SDK 동작에 필요한 파일 - Shared library\(`*.so.{version}` files\) |
| `libnugu-plugins-default` | NUGU SDK Default plugins - `gstreamer.so`, `opus.so`, `portaudio.so` 등 |
| `libnugu-dev` | NUGU SDK 개발에 필요한 파일 - header files\(`*.h`, `*.hh`\), pkg-config\(`nugu.pc`\) 및 `libnugu.so` |
| `libnugu-examples` | NUGU SDK Examples \(콘솔 기반의 샘플 프로그램 및 OAuth2 클라이언트\) |

기본적인 동작을 위해서 `libnugu`와 `libnugu-plugins-default` 패키지가 필요하며, 개발시에는 빌드를 위해 `libnugu-dev` 패키지가 추가로 필요합니다.

아래 명령을 통해 시스템에 설치할 수 있습니다.

```bash
sudo apt-get install libnugu libnugu-plugins-default libnugu-dev libnugu-examples
```

## Step 2: Sample application

Linux SDK는 아래와 같이 2가지 샘플을 제공하고 있습니다.

* 인증을 위한 OAuth2 예제 - Python으로 작성된 Web 기반의 OAuth2 client sample
* SDK 기능 동작을 테스트하기 위한 예제 - 콘솔에서 동작하는 텍스트 기반의 Sample application

위 샘플들은 `libnugu-examples` 패키지안에 모두 포함되어 있으며, 아래 파일들이 설치됩니다.

| 파일 | 설명 |
| :--- | :--- |
| `/usr/bin/nugu_oob_server` | OAuth2 인증을 위한 웹서버 - Python script, `8080` 포트 사용 |
| `/usr/bin/nugu_sample` | 콘솔 기반의 Sample application |
| `/usr/bin/nugusdk_start_sample` | 저장된 인증 토큰 값을 읽어서 환경 변수로 설정해주는 shell script |
| `/lib/systemd/system/nugu_oob.service` | 시스템 시작시 OAuth2 인증 웹서버를 자동으로 실행시키기 위한 systemd 설정 파일 |

### 음성 인식 처리를 위한 Model 파일 다운로드 받기

NUGU 서비스에서는 음성 인식 처리를 위해 아래의 음성 Model 파일을 필요로 합니다.

* Wake word\("아리아"\) detection을 위한 model 파일
* VAD\(voice activity detection\)을 위한 model 파일

위 파일들은 Nugu developers 사이트에서 사용 약관에 동의 후 다운로드 받으실 수 있습니다.

다운로드 받은 파일들을 Linux SDK에서 사용하기 위해서는, 디바이스에 임의의 디렉토리를 생성한 후 아래와 같은 파일명으로 복사해 주시면 됩니다.

* `nugu_model_wakeup_net.raw`  - wake word detection에 사용되는 model 파일 \(1/2\)
* `nugu_model_wakeup_search.raw`  - wake word detection에 사용되는 model 파일 \(2/2\)
* `nugu_model_epd.raw` - VAD에 사용되는 model 파일

## Step 3: Create your first application

### Linux SDK API를 사용하여 코드 작성

간략하게 사용자의 음성을 인식해서 NUGU 서버에 전송하고, TTS 응답을 받아 출력하는 Sample application을 개발해 보겠습니다.

먼저, 사용자의 음성을 인식하기 위해 `ASR Capability`를 사용해야 합니다. 아래와 같이 ASR 상태 변화 이벤트를 받을 수 있는 Listener를 작성합니다.

```cpp
class MyASR : public IASRListener {
public:
    virtual ~MyASR() = default;

    void onState(ASRState state)
    {
        switch (state) {
        case ASRState::IDLE:
            std::cout << "대기 상태" << std::endl;
            break;
        case ASRState::EXPECTING_SPEECH:
            std::cout << "추가 발화 요청" << std::endl;
            break;
        case ASRState::LISTENING:
            std::cout << "듣고 있습니다." << std::endl;
            break;
        case ASRState::RECOGNIZING:
            std::cout << "발화를 인식중입니다." << std::endl;
            break;
        case ASRState::BUSY:
            std::cout << "처리중입니다." << std::endl;
            break;
        }
    }

    void onNone()
    {
        std::cout << "인식 결과가 없습니다." << std::endl;
    }

    /* 중간 인식 결과 */
    void onPartial(const std::string& text)
    {
        std::cout << text << std::endl;
    }

    /* 최종 인식 결과 */
    void onComplete(const std::string& text)
    {
        std::cout << text << std::endl;
    }

    void onError(ASRError error)
    {
        std::cout << "에러가 발생하였습니다." << std::endl;
    }

    void onCancel()
    {
        std::cout << "취소되었습니다." << std::endl;
    }

    void setExpectSpeechState(bool is_es_state)
    {
        std::cout << "말씀해 주세요." << std::endl;
    }
};
```

이제 서버와의 연결 상태 이벤트를 받을 수 있는 Listener를 구현합니다. 네트워크가 정상적으로 연결되면 `ASR Capability`에 음성 인식을 시작시키는 `startRecognition()` API를 호출합니다.

```cpp
class MyNetwork : public INetworkManagerListener {
public:
    void onConnected()
    {
        nugu_client->getASRHandler()->startRecognition();
    }

    void onDisconnected()
    {
    }

    void onError(NetworkError error)
    {
        switch (error) {
        case NetworkError::TOKEN_ERROR:
            break;
        case NetworkError::UNKNOWN:
            break;
        }
    }
};
```

이제 필요한 부분은 거의 다 작성되었습니다. Application을 동작시키기 위해 `NuguClient`를 생성하고 `GMainLoop`에 연결시키기 위해 아래와 같이 `main()` 함수를 작성합니다.

```cpp
#include <glib.h>
#include <interface/capability/asr_interface.hh>
#include <interface/nugu_client.hh>
#include <interface/nugu_configuration.hh>

using namespace NuguClientKit;

/* MyASR */
class MyASR : public IASRListener {
    ...
}

/* MyNetwork */
class MyNetwork : public INetworkManagerListener {
    ...
}

int main()
{
    std::unique_ptr<MyASR> my_asr_listener;
    my_asr_listener = std::unique_ptr<MyASR>(new MyASR());

    nugu_client = std::unique_ptr<NuguClient>(new NuguClient());

    /* Token 설정 */
    nugu_client->setAccessToken(getenv("NUGU_TOKEN"));

    /* 음성 인식을 위한 Model 파일 설정 */
    nugu_client->setConfig(NuguConfig::Key::MODEL_PATH, "/home/work/model");

    /* Capability 등록 */
    nugu_client->getCapabilityBuilder()
        ->add(CapabilityType::ASR, my_asr_listener.get())
        ->construct();

    nugu_client->initialize();

    /* Network manager */
    std::unique_ptr<MyNetwork> network_manager_listener;
    network_manager_listener = std::unique_ptr<MyNetwork>(new MyNetwork());

    INetworkManager* network_manager = nugu_client->getNetworkManager();
    network_manager->addListener(network_manager_listener.get());

    network_manager->connect();

    /* GMainLopp 시작 */
    GMainLoop* loop = g_main_loop_new(NULL, FALSE);
    g_main_loop_run(loop);

    g_main_loop_unref(loop);

    nugu_client->deInitialize();

    return 0;
}
```

### Build

이제 위에서 작성된 코드를 빌드해 보겠습니다.

Linux SDK는 빌드를 쉽게 하기 위해 `pkg-config` 파일을 제공합니다. 따라서, 아래와 같이 `nugu.pc`를 사용하면 include path와 library 이름이 자동으로 설정됩니다.

```bash
$ g++ -std=c++11 hello.cc `pkg-config --cflags --libs nugu` -o hello
```

## 더 알아보기

### Download the SDK source code

아래 Github 주소를 통해 Linux SDK 소스 코드를 다운로드 받을 수 있습니다.

{% embed url="https://github.com/nugu-developers/nugu-linux" caption="" %}

