---
description: 음성인식 결과를 Play 로 전달하기 위한 규격
---

# ASR

## Version

최신 버전은 1.3 입니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Version</th>
      <th style="text-align:left">Date</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">1.0</td>
      <td style="text-align:left">2019.11.24</td>
      <td style="text-align:left">&#xADDC;&#xACA9; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.1</td>
      <td style="text-align:left">2020.04.29</td>
      <td style="text-align:left">
        <p>Recognize directive &#xC5D0; wakeup, timeout &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
        <p>Recognize directive, ExpechSpeech event &#xC5D0; asrContext &#xD544; &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.2</td>
      <td style="text-align:left">2020.06.05</td>
      <td style="text-align:left">
        <p></p>
        <p>Recognize directive, ExpectSpeech event &#xC758; asrContext &#xC5D0; playServiceId
          &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.3</td>
      <td style="text-align:left">2020.06.09</td>
      <td style="text-align:left">Recognize directive, ExpectSpeech event &#xC758; sessionId &#xD544;&#xB4DC;
        &#xC0AD;&#xC81C;</td>
    </tr>
  </tbody>
</table>

## State Diagram

![](../../.gitbook/assets/image%20%284%29.png)

## SDK Interface

### ASRAgent 사용

ASR interface 규격에 따른 디바이스의 동작 제어는 ASRAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 ASRAgent instance 에 접근할 수 있습니다.

```text
val asrAgent = nuguAndroidClient.asrAgent
```

Microphone 으로 부터 음성 데이터를 가져오기 위한 AudioSourceManager 를 생성합니다.

```text
val audioSourceManager = AudioSourceManager(AudioRecordSourceFactory())
```

음성인식에 필요한 학습 모델을 설정합니다.

```text
NuguAndroidClient.Builder(
    context,
    NuguOAuth.create(context),
    audioSourceManager
).endPointDetector(
    EndPointDetector(
        context.getDir(
            "skt_nugu_assets",
            Context.MODE_PRIVATE
        ).absolutePath + File.separator + "skt_epd_model.raw"
    )
)
```

AudioSourceManager, ASRAgent 를 연결해주기 위한 SpeechRecognizerAggregator 를 생성합니다.

```text
speechRecognizerAggregator = SpeechRecognizerAggregator(
    null,
    SpeechProcessorDelegate(asrAgent),
    audioSourceManager,
    Handler(Looper.getMainLooper())
)
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 ASRAgent instance 에 접근할 수 있습니다.

```text
let asrAgent = nuguClient.asrAgent
```

Microphone 으로 부터 음성 데이터를 가져오기 위한 MicInputProvider 를 생성합니다.

```text
let micInputProvider = MicInputProvider()
```

음성인식에 필요한 학습 모델을 설정합니다.

```text
let epdFile = Bundle.main.url(forResource: "skt_epd_model", withExtension: "raw")!
nuguClient.asrAgent.options = ASROptions(endPointing: .client(epdFile: epdFile))
```
{% endtab %}

{% tab title="Linux" %}
[CapabilityFactory::makeCapability](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1CapabilityFactory.html#a46d96b1bc96903f02905c92ba8794bf6) 함수로 [ASRAgent](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1IASRHandler.html) 를 생성하고 [NuguClient](https://nugu-developers.github.io/nugu-linux/classNuguClientKit_1_1NuguClient.html) 에 추가해 주어야합니다.

```text
auto asr_handler(std::shared_ptr<IASRHandler>(
        CapabilityFactory::makeCapability<ASRAgent, IASRHandler>()));

nugu_client->getCapabilityBuilder()
    ->add(asr_handler.get())
    ->construct();
```

음성인식에 필요한 학습 모델을 설정합니다.

```text
 asr_handler->setAttribute(ASRAttribute { "/var/lib/nugu/model", "CLIENT", "PARTIAL" });
```
{% endtab %}
{% endtabs %}

### 음성 인식 요청

`아리아` 발화 또는 NUGU Button 선택 시 [Recognize](asr.md#recognize) event 를 전달하여 음성인식을 시작할 수 있습니다.

{% tabs %}
{% tab title="Android" %}
```text
speechRecognizerAggregator.startListening()
```
{% endtab %}

{% tab title="iOS" %}
```text
try micInputProvider.start { (buffer, _) in
    asrAgent.putAudioBuffer(buffer: buffer)
}
asrAgent.startRecognition(initiator: .user)
```
{% endtab %}

{% tab title="Linux" %}
```
asr_handler->startRecognition()
```
{% endtab %}
{% endtabs %}

### 음성인식 진행 상태 모니터링

음성인식에 대한 진행 상태를 모니터링 할 수 있습니다.

음성인식에 대한 STT\(SpeechToText\) 결과가 [NotifyResult](asr.md#notifyresult) directive 로 전달됩니다.

{% tabs %}
{% tab title="Android" %}
SpeechRecognizerAggregatorInterface.OnStateChangeListener 를 추가합니다.

```text
val listener = object: SpeechRecognizerAggregatorInterface.OnStateChangeListener {
    override fun onStateChanged(state: State) {
        ...
    }
}
speechRecognizerAggregator.addListener(listener)
```

ASRAgentInterface.OnResultListener 를 추가합니다.

```text
val resultListener = object: ASRAgentInterface.OnResultListener {
    fun onPartialResult(result: String, dialogRequestId: String) {
        // STT 중간 결과
        ...
    }
    
    fun onCompleteResult(result: String, dialogRequestId: String) {
        // STT 최종 결과
        ...
    }
    
    ...
}
asrAgent.addOnResultListener(resultListener)
```
{% endtab %}

{% tab title="iOS" %}
ASRAgentDelegate 를 추가합니다.

```text
class MyASRAgentDelegate: ASRAgentDelegate {
    func asrAgentDidChange(state: ASRState) {
        ...
    }
    
    func asrAgentDidReceive(result: ASRResult, dialogRequestId: String) {
        // NotifyResult 결과 확인
        ...
    }
}
asrAgent.add(delegate: MyASRAgentDelegate())
```
{% endtab %}

{% tab title="Linux" %}
음성인식 진행 상태를 모니터링 하려면 [IASRListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1IASRListener.html) 를 추가합니다.

```text
class MyASRListener : public IASRListener {
public:
    ...

    void onState(ASRState state, const std::string &dialog_id) override
    {
        ...
    }
    
    void onPartial(const std::string &text, const std::string &dialog_id) override
    {
        // STT 중간 결과
        ...
    }
    
    void onComplete(const std::string &text, const std::string &dialog_id) override
    {
        // STT 최종 결과
        ...
    }
    
    ...
};
auto asr_listener(std::make_shared<MyASRListener>());
CapabilityFactory::makeCapability<ASRAgent, IASRHandler>(asr_listener.get());
```
{% endtab %}
{% endtabs %}

### 음성 인식 중단

사용자가 음성 인식 중단 요청을 [StopRecognize](asr.md#stoprecognize) event 로 전달할 수 있습니다.

{% tabs %}
{% tab title="Android" %}
```text
speechRecognizerAggregator.stopListening
```
{% endtab %}

{% tab title="iOS" %}
```text
asrAgent.stopRecognition()
```
{% endtab %}

{% tab title="Linux" %}
```text
asr_handler->stopRecognition()
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "ASR": {
    "version": "1.2",
    "engine": "{{STRING}}"
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">engine</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Device &#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xD558;&#xB294; &#xC74C;&#xC131;&#xC778;&#xC2DD;
          engine &#xC744; &#xBA85;&#xC2DC;</p>
        <p>NUGU &#xC74C;&#xC131;&#xC778;&#xC2DD; engine &#xC744; &#xC0AC;&#xC6A9;&#xD558;&#xB294;
          &#xACBD;&#xC6B0; &quot;skt&quot;</p>
        <p>(&#xAC12;&#xC744; &#xCC44;&#xC6B0;&#xC9C0; &#xC54A;&#xC73C;&#xBA74; default
          &quot;skt&quot;)</p>
      </td>
    </tr>
  </tbody>
</table>

## Directives

### ExpectSpeech

```text
{
  "header": {
    "namespace": "ASR",
    "name": "ExpectSpeech",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "domainTypes": ["{{STRING}}"],
    "asrContext": {
      "task": "{{STRING}}",
      "sceneId": "{{STRING}}",
      "sceneText": [
        "{{STRING}}"
      ],
      "playServiceId" : "playServiceId"
    }
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Y: &#xD68C;&#xC2E0;&#xBC1B;&#xC544;&#xC57C; &#xD558;&#xB294; &#xACBD;&#xC6B0;,
        N: &#xB9C8;&#xC774;&#xD06C;&#xB9CC; &#xC5F4;&#xACE0; &#xC2F6;&#xC740;&#xACBD;&#xC6B0;
        <br
        />default: N</td>
    </tr>
    <tr>
      <td style="text-align:left">property</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>NORMAL</b> - &#xC77C;&#xBC18; &#xBC1C;&#xD654;&#xB97C; &#xC785;&#xB825;&#xC73C;&#xB85C;
          &#xBC1B;&#xC74C;</p>
        <p><b>DICTATION</b> - dictation &#xC11C;&#xBC84;&#xB85C; &#xB77C;&#xC6B0;&#xD305;&#xD558;&#xC5EC;
          &#xCC98;&#xB9AC;</p>
        <p>&#xD544;&#xB4DC;&#xAC00; &#xC5C6;&#xB294; &#xACBD;&#xC6B0; default &#xAC12;&#xC740;
          NORMAL</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">domainTypes</td>
      <td style="text-align:left">Array&lt;String&gt;</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC2DC;&#xC5D0; NLU&#xC5D0;&#xC11C;
        &#xC0AC;&#xC6A9;&#xD560; domainType &#xC14B;&#xD305; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">asrContext</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>task</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>sceneId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>sceneText</p>
      </td>
      <td style="text-align:left">Array&lt;String&gt;</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

### NotifyResult

* 음성 인식 결과 전달

```text
{
  "header": {
    "namespace": "ASR",
    "name": "NotifyResult",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "token": "{{STRING}}",
    "result": "{{STRING}}",
    "state": "{{STRING}}"
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Recognize Event&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xD55C; token &#xAC12;
        (&#xC5B4;&#xB5A4; &#xBC1C;&#xD654;&#xC5D0; &#xB300;&#xD55C; &#xBD84;&#xC11D;
        &#xACB0;&#xACFC;&#xC778;&#xC9C0; &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C;
        &#xC6A9;&#xB3C4;)</td>
    </tr>
    <tr>
      <td style="text-align:left">result</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC778;&#xC2DD; &#xACB0;&#xACFC;&#xB97C; &#xC804;&#xC1A1;</td>
    </tr>
    <tr>
      <td style="text-align:left">state</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p><b>PARTIAL</b> : &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC758; &#xC77C;&#xBD80;&#xBD84;</p>
        <p><b>COMPLETE</b> : &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC758; &#xC804;&#xCCB4;
          &#xBB38;&#xC7A5;</p>
        <p><b>NONE</b> : &#xC74C;&#xC131; &#xC778;&#xC2DD; &#xACB0;&#xACFC; &#xC5C6;&#xC74C;</p>
        <p><b>ERROR</b> : Error &#xBC1C;&#xC0DD;</p>
        <p><b>SOS</b> : SOS(Start of Speech)</p>
        <p><b>EOS</b> : EOS(End of Speech)</p>
        <p><b>FA</b> : Wakeup False Acceptance</p>
      </td>
    </tr>
  </tbody>
</table>

### CancelRecognize

```text
{
  "header": {
    "namespace": "ASR",
    "name": "CancelRecognize",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "cause": "{{STRING}}"
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">cause</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>WAKEUP_POWER: &#xB2E4;&#xB978; wakeup&#xBCF4;&#xB2E4; power&#xAC00; &#xC801;&#xC5B4;&#xC11C;
            &#xCDE8;&#xC18C;&#xB428;</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Events

### Recognize

```text
{
  "header": {
    "namespace": "ASR",
    "name": "Recognize",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {
    "codec": "{{STRING}}",
    "playServiceId": "{{STRING}}",
    "domainTypes": ["{{STRING}}"],
    "language": "{{STRING}}",
    "endpointing": "{{STRING}}",
    "encoding": "{{STRING}}",
    "wakeup": {
      "word": "{{STRING}}",
      "boundary": {
        "start": {{LONG}},
        "end": {{LONG}},
        "detection": {{LONG}}
      },
      "power": {
        "noise": {{LONG}},
        "speech": {{LONG}}
      }
    },
    "asrContext": {
      "task": "{{STRING}}",
      "sceneId": "{{STRING}}",
      "sceneText": [
        "{{STRING}}"
      ],
      "playServiceId" : "playServiceId"
    },
    "timeout": {
      "listen": {{LONG}},
      "maxSpeech": {{LONG}},
      "response": {{LONG}}
    }
  }
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">codec</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>SPEEX</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech&#xC5D0; &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        ExpectSpeech&#xC5D0;&#xC11C; &#xBC1B;&#xC740; playServiceId&#xB97C; &#xC801;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">property</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech&#xC5D0; &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        ExpectSpeech&#xC5D0;&#xC11C; &#xBC1B;&#xC740; property&#xB97C; &#xC801;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">domainTypes</td>
      <td style="text-align:left">Array&lt;String&gt;</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech&#xC5D0; &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        ExpectSpeech&#xC5D0;&#xC11C; &#xBC1B;&#xC740; domainTypes&#xB97C; &#xC801;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">language</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>KOR, ENG, JPN, CHN, ...</b>
        </p>
        <p>default &#xAC12;&#xC740; KOR</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">endpointing</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p><b>CLIENT</b> - &#xD074;&#xB77C;&#xC774;&#xC5B8;&#xD2B8; EPD(EndPointDetector)
          &#xC0AC;&#xC6A9;</p>
        <p><b>SERVER</b> - &#xC11C;&#xBC84; EPD &#xC0AC;&#xC6A9;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">encoding</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>PARTIAL</b> - &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC758; &#xC77C;&#xBD80;&#xBD84;</p>
        <p><b>COMPLETE</b> - &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC758; &#xC804;&#xCCB4;
          &#xBB38;&#xC7A5; (default)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">wakeup</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC11C;&#xBC84; EPD &#xC0AC;&#xC6A9;&#xC2DC; &#xD544;&#xC218; &#xAC12;.</p>
        <p>wakeup&#xC744; &#xD3EC;&#xD568;&#xD574;&#xC11C; &#xC11C;&#xBC84;&#xC5D0;
          &#xC804;&#xB2EC;&#xD558;&#xB294; &#xACBD;&#xC6B0; &#xD3EC;&#xD568;</p>
        <p>wakeup &#xC815;&#xBCF4;&#xB97C; &#xC804;&#xB2EC;&#xD558;&#xB294; &#xACBD;&#xC6B0;
          &#xD3EC;&#xD568; (&#xC804;&#xB2EC;&#xD558;&#xB294; pcm&#xC5D0; wakeup&#xC774;
          &#xD3EC;&#xD568;&#xB418;&#xC9C0; &#xC54A;&#xB354;&#xB77C;&#xB3C4; &#xD544;&#xC694;&#xD55C;
          &#xACBD;&#xC6B0; &#xC804;&#xB2EC;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>word</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC804;&#xC1A1;&#xD558;&#xB294; stream&#xC5D0; &#xD3EC;&#xD568;&#xB41C;
        wakeup word( ex &quot;&#xC544;&#xB9AC;&#xC544;&quot;)</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>boundary</p>
      </td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC804;&#xC1A1;&#xD558;&#xB294; stream&#xC5D0;&#xC11C; wakeup word&#xC5D0;
        &#xB300;&#xD55C; boundary &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>boundary.</p>
        <p>start</p>
      </td>
      <td style="text-align:left">LONG</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>wakeup module &#xC5D0;&#xC11C; &#xC5BB;&#xC740; milliseconds &#xB97C;
          sample count &#xB85C; &#xBCC0;&#xD658;&#xD574;&#xC11C; &#xC804;&#xC1A1;&#xD574;&#xC57C;
          &#xD568;.</p>
        <p>sample count for start time</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>boundary.</p>
        <p>end</p>
      </td>
      <td style="text-align:left">LONG</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>wakeup module &#xC5D0;&#xC11C; &#xC5BB;&#xC740; milliseconds &#xB97C;
          sample count &#xB85C; &#xBCC0;&#xD658;&#xD574;&#xC11C; &#xC804;&#xC1A1;&#xD574;&#xC57C;
          &#xD568;.</p>
        <p>sample count for end time</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>boundary.</p>
        <p>detection</p>
      </td>
      <td style="text-align:left">LONG</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>wakeup module &#xC5D0;&#xC11C; &#xC5BB;&#xC740; milliseconds &#xB97C;
          sample count &#xB85C; &#xBCC0;&#xD658;&#xD574;&#xC11C; &#xC804;&#xC1A1;&#xD574;&#xC57C;
          &#xD568;.</p>
        <p>sample count for detection time</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>boundary.</p>
        <p>metric</p>
      </td>
      <td style="text-align:left">STRING</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>sample(default) / byte / frame / time</b>
        </p>
        <p>&#xD604;&#xC7AC; sample &#xB9CC; &#xC9C0;&#xC6D0;&#xB418;&#xBA70;, &#xCD94;&#xD6C4;
          byte / frame / time &#xC18D;&#xC131; &#xC9C0;&#xC6D0; &#xC608;&#xC815;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>power</p>
      </td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC804;&#xC1A1;&#xD558;&#xB294; stream&#xC5D0; &#xD3EC;&#xD568;&#xB41C;
        wakeup pcm&#xC758; power&#xAC12;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>power.</p>
        <p>noise</p>
      </td>
      <td style="text-align:left">Float</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">wakeup pcm&#xC758; power&#xC911; noise&#xB97C; &#xC758;&#xBBF8;&#xD558;&#xB294;
        &#xAC12; (&#xC8FC;&#xB85C; min&#xAC12;)</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>wakeup.</p>
        <p>power.</p>
        <p>speech</p>
      </td>
      <td style="text-align:left">Float</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">wakeup pcm&#xC758; power&#xC911; speech&#xB97C; &#xC758;&#xBBF8;&#xD558;&#xB294;
        &#xAC12; (&#xC8FC;&#xB85C; max&#xAC12;)</td>
    </tr>
    <tr>
      <td style="text-align:left">asrContext</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ExpectSpeech&#xC5D0; &#xC758;&#xD55C; &#xBC1C;&#xD654;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB9CC;
        ExpectSpeech&#xC5D0;&#xC11C; &#xBC1B;&#xC740; asrContext&#xB97C; &#xC801;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>task</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>sceneId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>sceneText</p>
      </td>
      <td style="text-align:left">Array&lt;String&gt;</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>asrContext.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">timeout</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Server EPD &#xC0AC;&#xC6A9;&#xC2DC; &#xD544;&#xC218; &#xAC12;.</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>timeout.</p>
        <p>listen</p>
      </td>
      <td style="text-align:left">LONG</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>SOS &#xB97C; &#xAE30;&#xB2E4;&#xB9AC;&#xB294; &#xC2DC;&#xAC04;</p>
        <p>milliseconds</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>timeout.</p>
        <p>maxSpeech</p>
      </td>
      <td style="text-align:left">LONG</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>SOS&#xC774;&#xD6C4; EOS&#xB97C; &#xAE30;&#xB2E4;&#xB9AC;&#xB294; &#xC2DC;&#xAC04;</p>
        <p>milliseconds</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>timeout.</p>
        <p>response</p>
      </td>
      <td style="text-align:left">LONG</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>EOS &#xC774;&#xD6C4; &#xC751;&#xB2F5;&#xC744; &#xAE30;&#xB2E4;&#xB9AC;&#xB294;
          &#xC2DC;&#xAC04;</p>
        <p>milliseconds</p>
      </td>
    </tr>
  </tbody>
</table>

### ResponseTimeout

* Recognize Event가 전달되고 사용자 발화도 모두 전달이 완료된 이후 응답을 받지 못한 경우

```text
{
  "header": {
    "namespace": "ASR",
    "name": "ResponseTimeout",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| playServiceId | string | N | ExpectSpeech에 의한 발화인 경우에만 ExpectSpeech에서 받은 playServiceId를 적용 |

### ListenTimeout

* Recognize event가 전달되고 사용자 발화가 발화하지 않은 경우

```text
{
  "header": {
    "namespace": "ASR",
    "name": "ListenTimeout",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| playServiceId | string | N | ExpectSpeech에 의한 발화인 경우에만 ExpectSpeech에서 받은 playServiceId를 적용 |

### StopRecognize

* Recognize event 취소

```text
{
  "header": {
    "namespace": "ASR",
    "name": "StopRecognize",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| playServiceId | string | N | ExpectSpeech에 의한 발화인 경우에만 ExpectSpeech에서 받은 playServiceId를 적용 |

### ListenFailed

* Recognize event 이후 클라이언트에서 에러\(마이크를 열지 못하는 등\)가 발생한 경우

```text
{
  "header": {
    "namespace": "ASR",
    "name": "ListenFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| playServiceId | string | N | ExpectSpeech에 의한 발화인 경우에만 ExpectSpeech에서 받은 playServiceId를 적용 |

