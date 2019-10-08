# 시작하기

## Install the SDK

Linux SDK는 `deb` 파일을 쉽게 다운로드 받아 설치하여 사용할 수 있도록 Ubuntu에서 제공하는 [PPA](https://launchpad.net/~nugulinux/+archive/ubuntu/sdk)\([https://launchpad.net](https://launchpad.net)\)를 사용하고 있습니다.

### PPA 추가하기

아래 명령을 통해 시스템에 Linux SDK PPA를 추가할 수 있습니다.

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

Linux SDK는 아래의 패키지들을 제공하고 있습니다. 기본적인 동작을 위해서 `libnugu`와 `libnugu-plugins-default` 패키지가 필요하며 개발시에는 빌드를 위해 `libnugu-dev` 패키지가 추가로 필요합니다.

| 패키지 | 설명 |
| :--- | :--- |
| `libnugu` | NUGU SDK 동작에 필요한 파일 - Shared library\(`*.so.{version}` files\) |
| `libnugu-plugins-default` | NUGU SDK Default plugins - `gstreamer.so`, `opus.so`, `portaudio.so` 등 |
| `libnugu-dev` | NUGU SDK 개발에 필요한 파일 - header files\(`*.h`, `*.hh`\), pkg-config\(`nugu.pc`\) 및 `libnugu.so` |
| `libnugu-examples` | NUGU SDK Examples \(콘솔 기반의 샘플 프로그램 및 OAuth2 클라이언트\) |

아래 명령을 통해 시스템에 설치할 수 있습니다.

```bash
sudo apt-get install libnugu libnugu-plugins-default libnugu-dev libnugu-examples
```

## Sample application

본격적으로 개발을 시작하기 전에 먼저 Linux SDK의 기능을 확인해 볼 수 있도록 아래와 같이 2가지 샘플을 제공하고 있습니다.

* 인증을 위한 OAuth2 예제 - Python으로 작성된 Web 기반의 OAuth2 client sample
* SDK 기능 동작을 테스트하기 위한 예제 - 콘솔에서 동작하는 텍스트 기반의 Sample application

위 샘플들은 `libnugu-examples` 패키지안에 모두 포함되어 있으며, 아래 파일들이 설치됩니다.

| 파일 | 설명 |
| :--- | :--- |
| `/usr/bin/nugu_oob_server` | OAuth2 인증을 위한 웹서버 - Python script, `8080` 포트 사용 |
| `/usr/bin/nugu_sample` | 콘솔 기반의 Sample application |
| `/usr/bin/nugusdk_start_sample` | 저장된 인증 토큰 값을 읽어서 환경 변수로 설정해주는 shell script |
| `/lib/systemd/system/nugu_oob.service` | 시스템 시작시 OAuth2 인증 웹서버를 자동으로 실행시키기 위한 systemd 설정 파일 |

### OAuth2 인증 예제

웹브라우저를 통해 [http://lvh.me:8080 ](http://lvh.me:8080%20)주소\(lvh.me는 localhost와 같습니다\)로 접속하면 아래와 같이 OAuth2 인증을 위한 샘플 화면이 나타납니다.

![](../../../.gitbook/assets/linux_oauth_capture_1.png)

인증을 위해 미리 발급받은 `poc_id`, `client_id`, `client_secret`을 입력하고, 테스트 하려는 디바이스를 구분하기 위해 `device serial`에 중복되지 않는 임의의 값\(예: mydevice1234\)을 입력 한 후 **Save** 버튼을 눌러 저장합니다.

![](../../../.gitbook/assets/linux_oauth_capture_2.png)

이제 **Get OAuth2 token** 링크를 눌러 인증을 진행하면, 아래와 같이최종적으로 `access_token`을 얻을 수 있습니다.

![](../../../.gitbook/assets/linux_oauth_capture_3.png)

위 정보들은 `/var/lib/nugu/nugu-auth.json` 파일에 아래와 같은 JSON 형태로 저장됩니다. 

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

### 음성 인식 처리를 위한 Model 파일 다운로드 받기

NUGU 서비스에서는 음성 인식 처리를 위해 아래의 음성 Model 파일을 필요로 합니다.

* Wake word\("아리아"\) detection을 위한 model 파일
* VAD\(voice activity detection\)을 위한 model 파일

위 파일들은 Nugu developers 사이트에서 사용 약관에 동의 후 다운로드 받으실 수 있습니다.

다운로드 받은 파일들을 Linux SDK에서 사용하기 위해서는, 디바이스에 임의의 디렉토리를 생성한 후 아래와 같은 파일명으로 복사해 주시면 됩니다.

* `nugu_model_wakeup_net.raw`  - wake word detection에 사용되는 model 파일 \(1/2\)
* `nugu_model_wakeup_search.raw`  - wake word detection에 사용되는 model 파일 \(2/2\)
* `nugu_model_epd.raw` - VAD에 사용되는 model 파일

### Sample application 실행하기

Sample application은 환경 변수\(`NUGU_TOKEN`\)를 통해 인증 정보를 전달 받아 실행합니다. 따라서, 직접 환경 변수의 값을를 설정한 후 실행하거나, `nugusdk_start_sample` shell script를 사용해서 실행할 수 있습니다.

{% tabs %}
{% tab title="Shell script 사용" %}
```bash
$ nugusdk_start_sample /usr/bin/nugu_sample -m {model-file-path}
```
{% endtab %}

{% tab title="직접 실행" %}
```bash
$ export NUGU_TOKEN=...
$ /usr/bin/nugu_sample -m {model-file-path}
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

사용할 수 있는 명령들에 대한 설명은 아래와 같습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xBA85;&#xB839;</th>
      <th style="text-align:left">&#xC124;&#xBA85;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><code>w</code> (start wakeup)</td>
      <td style="text-align:left">&#xC815;&#xD574;&#xC9C4; Wake word(&quot;&#xC544;&#xB9AC;&#xC544;&quot;)&#xB97C;
        &#xD1B5;&#xD574; wake-up &#xD558;&#xAE30; &#xC704;&#xD55C; &#xB300;&#xAE30;
        &#xC0C1;&#xD0DC;&#xB85C; &#xC9C4;&#xC785;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>l</code> (start listening)</td>
      <td style="text-align:left">
        <p>wake-up &#xC5C6;&#xC774; &#xBC14;&#xB85C; &#xC74C;&#xC131; &#xBC1C;&#xD654;&#xB97C;
          NUGU &#xC11C;&#xBE44;&#xC2A4;&#xC5D0; &#xC804;&#xB2EC;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xBC1C;&#xD654;&#xAC00; &#xB05D;&#xB098;&#xBA74; NUGU &#xC11C;&#xBE44;&#xC2A4;&#xB85C;&#xBD80;&#xD130;
          &#xC751;&#xB2F5;(TTS)&#xC744; &#xBC1B;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC704; &#xACFC;&#xC815;&#xC774; &#xB05D;&#xB098;&#xBA74; &#xC790;&#xB3D9;&#xC73C;&#xB85C;
          &#xB2E4;&#xC2DC; wake-up &#xB300;&#xAE30; &#xC0C1;&#xD0DC;&#xB85C; &#xC804;&#xD658;&#xB429;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><code>s</code> (stop listening)</td>
      <td style="text-align:left">&#xBC1C;&#xD654;&#xB97C; &#xAC15;&#xC81C;&#xB85C; &#xC911;&#xC9C0; &#xC2DC;&#xD0B5;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>t</code> (text input)</td>
      <td style="text-align:left">
        <p>&#xD14D;&#xC2A4;&#xD2B8;(&#xC608;: &quot;&#xC624;&#xB298; &#xBA70;&#xCE60;&#xC774;&#xC57C;&quot;)&#xB97C;
          NUGU &#xC11C;&#xBE44;&#xC2A4;&#xC5D0; &#xC804;&#xB2EC;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC74C;&#xC131; &#xBC1C;&#xD654;&#xC640; &#xB3D9;&#xC77C;&#xD558;&#xAC8C;
          NUGU &#xC11C;&#xBE44;&#xC2A4;&#xC5D0;&#xC11C; &#xC751;&#xB2F5;&#xC744;
          &#xBC1B;&#xC744; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><code>c</code> (connect)</td>
      <td style="text-align:left">
        <p>NUGU &#xC11C;&#xBE44;&#xC2A4;&#xC5D0; &#xB124;&#xD2B8;&#xC6CC;&#xD06C;&#xB97C;
          &#xC5F0;&#xACB0;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>(&#xCC38;&#xACE0;&#xB85C;, Sample application &#xC2E4;&#xD589;&#xC2DC;
          &#xC790;&#xB3D9;&#xC73C;&#xB85C; &#xC5F0;&#xACB0;&#xC744; &#xC2DC;&#xB3C4;&#xD569;&#xB2C8;&#xB2E4;.)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><code>d</code> (disconnect)</td>
      <td style="text-align:left">NUGU &#xC11C;&#xBE44;&#xC2A4;&#xC5D0; &#xC5F0;&#xACB0;&#xB41C; &#xB124;&#xD2B8;&#xC6CC;&#xD06C;&#xB97C;
        &#xB04A;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>q</code> (quit)</td>
      <td style="text-align:left">Sample application&#xC744; &#xC885;&#xB8CC;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
  </tbody>
</table>이제 `w` 명령을 통한 실제 사용 예제를 보여 드리겠습니다.

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

using namespace nuguClientSDK;

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

### Build & Run

이제 위에서 작성된 코드를 빌드해 보겠습니다.

Linux SDK는 빌드를 쉽게 하기 위해 `pkg-config` 파일을 제공합니다. 따라서, 아래와 같이 `nugu.pc`를 사용하면 include path와 library 이름이 자동으로 설정됩니다.

```bash
$ g++ -std=c++11 hello.cc `pkg-config --cflags --libs nugu` -o hello
```

이제 실행해 보겠습니다.

```bash
# 먼저 토큰을 설정합니다.
$ export NUGU_TOKEN=xxxx

# 프로그램 실행
$ ./hello
듣고 있습니다.
```

토큰 설정 후 프로그램을 실행하면 NUGU 서버에 연결한 후 음성 인식을 위한 대기상태로 진입합니다.

```bash
$ ./hello
듣고 있습니다.
발화를 인식중입니다.
처리중입니다.
오늘 며칠이야
```

이제 "오늘 며칠이야" 라고 발화를 하면, 발화를 인식중이라는 상태로 전환되고 인식 결과를 받으면 화면에 표시하게 됩니다. 그리고 NUGU 서버로부터 TTS 데이터를 받아 "오늘은 10월 16일 수요일 이에요"라는 음성이 스피커를 통해 출력됩니다.

## Download the SDK source code

아래 Github 주소를 통해 Linux SDK 소스 코드를 다운로드 받을 수 있습니다.

{% embed url="https://github.com/nugu-developers/nugu-linux" %}



