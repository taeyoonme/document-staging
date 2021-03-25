---
description: Play 에서 전달하는 음원을 재생하기 위한 규격
---

# AudioPlayer

## Version

최신 버전은 1.6 입니다.

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
      <td style="text-align:left">2019.11.13</td>
      <td style="text-align:left">&#xADDC;&#xACA9; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.1</td>
      <td style="text-align:left">2020.03.03</td>
      <td style="text-align:left">lyric, favorite, repeat, shuffle, template.settings &#xAD00;&#xB828; directive/event
        &#xCD94;&#xAC00;
        <br />AudioPlayer.Template1 &#xC5D0; lyrics, settings, badge &#xAD00;&#xB828;
        &#xD544;&#xB4DC; &#xCD94;&#xAC00;
        <br />AudioPlayer.Play &#xC5D0; cacheKey &#xD544;&#xB4DC; &#xCD94;&#xAC00;
        <br
        />AudioPlayer.UpdateMetadata directive &#xCD94;&#xAC00;
        <br />AudioPlayer.Template1&#xC758; content.imageUrl&#xC744; Mandatory&#xB85C;
        &#xC218;&#xC815;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.2</td>
      <td style="text-align:left">2020.03.12</td>
      <td style="text-align:left">Request{Play/Resume/Next/Previous/Pause/Stop}Command Directive
        <br />Request{Play/Resume/Next/Previous/Pause/Stop}CommandIssued Event &#xCD94;&#xAC00;.</td>
    </tr>
    <tr>
      <td style="text-align:left">1.3</td>
      <td style="text-align:left">2020.06.05</td>
      <td style="text-align:left">PlaybackStopped event &#xC5D0; reason &#xD544;&#xB4DC; &#xCD94;&#xAC00;.
        <br
        />RequestCommandFailed event &#xCD94;&#xAC00;.</td>
    </tr>
    <tr>
      <td style="text-align:left">1.4</td>
      <td style="text-align:left">2020.08.12</td>
      <td style="text-align:left">Context &#xC5D0; playServiceId &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.5</td>
      <td style="text-align:left">2020.12.09</td>
      <td style="text-align:left">PlaybackStopped event &#xC758; reason &#xD544;&#xB4DC; &#xAC12;&#xC5D0;
        &#xB300;&#xD55C; &#xC870;&#xAC74; &#xC218;&#xC815;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.6</td>
      <td style="text-align:left">2021.03.05</td>
      <td style="text-align:left">
        <p>AudioPlayer.Template1 &#xC758; lyrics &#xC5D0; showButton &#xD544;&#xB4DC;
          &#xCD94;&#xAC00;</p>
        <p>AudioPlayer.Template2 &#xC5D0; lyrics &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
        <p>AudioPlayer.Template2 &#xC5D0; subtitle1 &#xD544;&#xB4DC; &#xCD94;&#xAC00;</p>
      </td>
    </tr>
  </tbody>
</table>

## State Diagram

![](../../.gitbook/assets/assets_image__5.png)

## SDK Interface

### AudioPlayerAgent 사용

AudioPlayer interface 규격에 따른 디바이스의 동작 제어는 AudioPlayerAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 AudioPlayerAgent instance 에 접근할 수 있습니다.

```text
val audioPlayerAgent = nuguAndroidClient.audioPlayerAgent
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 AudioPlayerAgent instance 에 접근할 수 있습니다.

```text
let audioPlayerAgent = nuguClient.audioPlayerAgent
```
{% endtab %}

{% tab title="Linux" %}
[CapabilityFactory::makeCapability](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1CapabilityFactory.html#a46d96b1bc96903f02905c92ba8794bf6) 함수로 [AudioPlayerAgent](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1IAudioPlayerHandler.html) 를 생성하고 [NuguClient](https://nugu-developers.github.io/nugu-linux/classNuguClientKit_1_1NuguClient.html) 에 추가해 주어야합니다.

```text
auto audio_player_handler(std::shared_ptr<IAudioPlayerHandler>(
        CapabilityFactory::makeCapability<AudioPlayerAgent, IAudioPlayerHandler>()));

nugu_client->getCapabilityBuilder()
    ->add(audio_player_handler.get())
    ->construct();
```
{% endtab %}
{% endtabs %}

### 재생 상태 모니터링

[Play](audioplayer.md#play) directive 로 전달된 음원에 대한 재생 상태를 모니터링 할 수 있습니다.

{% tabs %}
{% tab title="Android" %}
AudioPlayerAgentInterface.Listener 를 추가합니다.

```text
val listener = object: AudioPlayerAgentInterface.Listener {
    override fun onStateChanged(activity: State, context: Context) {
        ...
    }
}
audioPlayerAgent.addListener(listener)
```
{% endtab %}

{% tab title="iOS" %}
AudioPlayerAgentDelegate 를 추가합니다.

```text
class MyAudioPlayerAgentDelegate: AudioPlayerAgentDelegate {
    func audioPlayerAgentDidChange(state: AudioPlayerState, dialogRequestId: String) {
        ...
    }
}

audioPlayerAgent.add(delegate: MyAudioPlayerAgentDelegate())
```
{% endtab %}

{% tab title="Linux" %}
[IAudioPlayerListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1IAudioPlayerListener.html) 를 추가합니다.

```text
class MyAudioPlayerListener : public IAudioPlayerListener {
public:
    ...

    void mediaStateChanged (AudioPlayerState state, const std::string &dialog_id) override
    {
        ...
    }

    ...
};
auto audio_player_listener(std::make_shared<MyAudioPlayerListener>());
CapabilityFactory::makeCapability<AudioPlayerAgent, IAudioPlayerHandler>(audio_player_listener.get());
```
{% endtab %}
{% endtabs %}

### UI 구성 및 제어

AudioPlayer 로 음원을 재생할 때 화면을 구성하기 위해 필요한 데이터는 [Play](audioplayer.md#play) directive 의 `audioItem.metadata.template` 에 포함되어 전달됩니다.

[Stop](audioplayer.md#stop) directive 또는 SDK 내부 timer 등에 의해 종료될 수 있으며, [UpdateMetadata](audioplayer.md#updatemetadata) directive 에 의해 변경될 수 있습니다.

[AudioPlayer.Template1](audioplayer.md#audioitem-metadata-template-audioplayer-template1) 에 포함된 가사의 화면은 `사용자 발화` 에 따라 [ShowLyrics](audioplayer.md#showlyrics), [HideLyrics](audioplayer.md#hidelyrics), [ControlLyricsPage](audioplayer.md#controllyricspage) directive 로 제어될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
DisplayAggregatorInterface.Renderer 를 추가합니다.

```text
val renderer = object: DisplayAggregatorInterface.Renderer {
    override fun render(templateId: String, templateType: String, templateContent: String, dialogRequestId: String, displayType: Type): Boolean {
        ...
    }

    ...
}
nuguAndroidClient.setDisplayRenderer(renderer)
```

UI 제어 요청을 처리하려면 LyricsPresenter 를 추가합니다.

```text
val presenter = object: LyricsPresenter {
    override fun show(): Boolean {
        ...
    }

    override fun hide(): Boolean {
        ...
    }

    ...
}
audioPlayerAgent.setLyricsPresenter(presenter)
```
{% endtab %}

{% tab title="iOS" %}
AudioPlayerDisplayDelegate 를 추가합니다.

```text
class MyAudioPlayerDisplayDelegate: AudioPlayerDisplayDelegate {
    func audioPlayerDisplayShouldRender(template: AudioPlayerDisplayTemplate, completion: @escaping (AnyObject?) -> Void) {
        ...
    }

    func audioPlayerDisplayShouldShowLyrics(completion: @escaping (Bool) -> Void) {
        ...
    }

    func audioPlayerDisplayShouldHideLyrics(completion: @escaping (Bool) -> Void) {
        ...
    }

    ...
}

audioPlayerAgent.displayDelegate = MyAudioPlayerDisplayDelegate()
```
{% endtab %}

{% tab title="Linux" %}
[IAudioPlayerListener](https://nugu-developers.github.io/nugu-linux/classNuguCapability_1_1IAudioPlayerListener.html) 를 추가합니다.

```text
class MyAudioPlayerListener : public IAudioPlayerListener {
public:
    ...

    void renderDisplay(const std::string& id, const std::string& type, const std::string& json_payload, const std::string& dialog_id) override
    {
        ...
    }

    bool showLyrics(const std::string& id) override
    {
        ...
    }

    bool hideLyrics(const std::string& id) override
    {
        ...
    }

    ...
};
auto audio_player_listener(std::make_shared<MyAudioPlayerListener>());
CapabilityFactory::makeCapability<AudioPlayerAgent, IAudioPlayerHandler>(audio_player_listener.get());
```
{% endtab %}
{% endtabs %}

### 제어 명령

PUI, GUI 등으로 사용자가 [다음](audioplayer.md#nextcommandissued)/[이전](audioplayer.md#previouscommandissued)/[즐겨찾기](audioplayer.md#favoritecommandissued)/[반복](audioplayer.md#repeatcommandissued)/[셔플](audioplayer.md#shufflecommandissued) 요청을 event 로 전달할 수 있습니다.

{% tabs %}
{% tab title="Android" %}
```text
// 다음
audioPlayerAgent.next()
// 이전
audioPlayerAgent.prev()
// 즐겨찾기
audioPlayerAgent.requestFavoriteCommand(false)
// 반복
audioPlayerAgent.requestRepeatCommand(RepeatMode.NONE)
// 셔플
audioPlayerAgent.requestShuffleCommand(false)
```
{% endtab %}

{% tab title="iOS" %}
```text
// 다음 
audioPlayerAgent.next()
// 이전
audioPlayerAgent.prev()
// 즐겨찾기
audioPlayerAgent.requestFavoriteCommand(false)
// 반복
audioPlayerAgent.requestRepeatCommand(.none)
// 셔플
audioPlayerAgent.requestShuffleCommand(false)
```
{% endtab %}

{% tab title="Linux" %}
```text
// 다음
audio_player_handler->next()
// 이전
audio_player_handler->prev()
// 즐겨찾기
audio_player_handler->requestFavoriteCommand(false)
// 반복
audio_player_handler->requestRepeatCommand(RepeatType.NONE)
// 셔플
audio_player_handler->requestShuffleCommand(false)
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "AudioPlayer": {
    "version": "1.4",
    "playServiceId":{{STRING}}",
    "playerActivity":{{STRING}}",
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "durationInMilliseconds": {{LONG}},
    "lyricsVisible": {{BOOLEAN}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| playServiceId | string | N | 현재 사용 중인 음원의 playServiceId |
| playerActivity | string | Y | 현재 state |
| token | string | N | 현재 사용 중인 음원의 토큰 |
| offsetInMilliseconds | long | Y | 현재 사용 중인 음원의 offset |
| durationInMilliseconds | long | N | 현재 사용 중인 음원의 전체 재생시간\(알수 없으면 보내주지 않음\) |
| lyricsVisible | boolean | N | AudioPlayer에서 가사 화면이 보여지고 있는지 여부 가사를 보여줄 수 없는 Device에서는 lyricsVisible를 보내지 않음 |

## Directives

### Play

새로운 음원 또는 현재 음원 재생 요청입니다.\(Play, Resume, Seek 요청이 포함되어 있습니다.\)

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "Play",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "sourceType": "{{STRING}}",
    "cacheKey": "{{STRING}}",
    "audioItem": {
      "stream": {
        "url": "{{STRING}}",
        "offsetInMilliseconds": {{LONG}},
        "progressReport": {
          "progressReportDelayInMilliseconds": {{LONG}},
          "progressReportIntervalInMilliseconds": {{LONG}}
        },
        "token": "{{STRING}}",
        "expectedPreviousToken": "{{STRING}}"
      },
      "metadata": {
        "template": {}
      }
    }
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| sourceType | string | N | URL or ATTACHMENT\(default 는 URL\)  - ATTACHMENT 일 경우 stream에 url이 존재 하지 않음 |
| cacheKey | string | N | 디바이스에서 미디어 캐시를 위한 unique key\(디바이스 캐시 기능은 필수가 아님\) 캐시가 불가능한 미디어 이면 디바이스로 내려주지 않음 |
| audioItem.stream | object | Y | - |
| audioItem.stream.url | string | N | 오디오 컨텐츠의 URL \(URL에 의한 streaming만 지원\) sourceType 이 ATTACHMENT일 경우 없음 |
| audioItem.stream. offsetInMilliseconds | long | Y | 시작부터 얼마만큼의 offset부터 재생할지 설정. 0이면 처음부터 재생 |
| audioItem.stream. progressReport. progressReportDelayInMilliseconds | long | N | 재생을 시작해서 지정된 시간 뒤에 한 번 progressReportDelayElapsed Event가 발생 \(offsetInMilliseconds 값과는 무관하게 컨텐츠 시작 시간 기준으로 절대값을 의미\) |
| audioItem.stream. progressReport. progressReportIntervalInMilliseconds | long | N | 재생을 시작해서 지정된 주기마다 progressReportIntervalElapsed Event가 발생 \(offsetInMilliseconds 값과는 무관하게 컨텐츠 시작 시간 기준으로 절대값을 의미\) |
| audioItem.stream.token | string | Y | 현재 stream을 나타내는 token Resume 을 판단하기 위한 key 값으로 사용되기 때문에, Play 에서 제공하는 미디어 내에서 unique 함이 보장되어야 함. |
| audioItem.stream. expectedPreviousToken | string | N | 이전 stream을 나타내는 token |
| audioItem.metadata | object | N | - |
| audioItem.metadata.template | object | N | 각 type별 포맷은 아래에 기술 template이 정의되지 않은 경우 Display를 포함하는 디바이스는 Default 화면을 보여주어야 함 |

#### audioItem.metadata.template - AudioPlayer.Template1

```text
{
  "metadata": {
    "disableTemplate": {{BOOLEAN}},
    "template": {
      "type": "AudioPlayer.Template1",
      "title": {
        "iconUrl": "{{STRING}}",
        "text": "{{{STRING}}"
      },
      "grammarGuide": ["{{STRING}}"],
      "content": {
        "title": "{{STRING}}",
        "subtitle1": "{{STRING}}",
        "subtitle2": "{{STRING}}",
        "imageUrl": "{{STRING}}",
        "durationSec": "{{STRING}}",
        "backgroundImageUrl": "{{STRING}}",
        "backgroundColor": "{{STRING}}",
        "badgeImageUrl": "{{String}}",
        "badgeMessage": "{{String}}",
        "lyrics": {
          "title": "{{String}}",
          "lyricsType": "{{String}}",
          "lyricsInfoList": [
            {
              "time": {{Integer}},
              "text": "{{String}}"
            }
          ],
          "showButton": {
            "text": "{{String}}"
          }
        },
        "settings": {
          "favorite": {{BOOLEAN},
          "repeat": "{{String}}",
          "shuffle": {{BOOLEAN}}
        }
      }
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
      <td style="text-align:left">disableTemplate</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">true&#xBA74; &#xC2A4;&#xD06C;&#xB9B0;&#xC744; &#xAC00;&#xC9C4; &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;
        AudioPlayer &#xC7AC;&#xC0DD; &#xC2DC; template&#xC744; display&#xD558;&#xC9C0;
        &#xC54A;&#xC74C;
        <br />default - false</td>
    </tr>
    <tr>
      <td style="text-align:left">template.type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">AudioPlayer template type
        <br />- AudioPlayer.Template1
        <br />- AudioPlayer.Template2</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />title.
        <br />iconUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">icon image url</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />title.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">title text</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />title</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">content &#xC601;&#xC5ED;&#xC758; title</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.
          <br />content.</p>
        <p>subtitle1</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">subtitle1</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />subtitle2</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">subtitle2</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />imageUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">image url</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />durationSec</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">content duration in sec
        <br /><b>&#xC5C6;&#xAC70;&#xB098; 0, &#xC74C;&#xC218;, null&#xC774;&#xBA74; progress&#xB97C; disabled &#xCC98;&#xB9AC;</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />backgroundImageUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">background image url</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />backgroundColor</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">background color
        <br />default - &quot;#000&quot;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />badgeImageUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC774;&#xBBF8;&#xC9C0;(content.imageUrl)&#xC758; &#xC624;&#xB978;&#xCABD;
        &#xC0C1;&#xB2E8;&#xC5D0; &#xD45C;&#xC2DC;&#xB420; Badge Image&#xC758; URL</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />badgeMessage</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC774;&#xBBF8;&#xC9C0;(content.imageUrl)&#xC758; &#xC67C;&#xCABD; &#xD558;&#xB2E8;&#xC5D0;
        &#xD45C;&#xC2DC;&#xB420; Badge Message</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics</td>
      <td style="text-align:left">obejct</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xD654;&#xBA74;&#xC744; &#xD45C;&#xC2DC;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.title</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xD654;&#xBA74;&#xC5D0;&#xC11C; &#xBCF4;&#xC5EC;&#xC9C8;
        &#xC81C;&#xBAA9;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.
          <br />content.
          <br />lyrics.</p>
        <p>lyricsType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xAC00;&#xC0AC;&#xC758; &#xC885;&#xB958;
        <br />- <b>NONE</b> : &#xC790;&#xB9C9; &#xC5C6;&#xC74C;
        <br />- <b>SYNC</b> : &#xC790;&#xB9C9; &#xB3D9;&#xAE30;&#xD654;
        <br />- <b>NON_SYNC</b> : &#xC790;&#xB9C9; &#xB3D9;&#xAE30;&#xD654; &#xC5C6;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.
        <br />lyricsInfoList</td>
      <td style="text-align:left">array of lyricsInfo</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xB0B4;&#xC6A9;(lyricsInfo)&#xC758; &#xBAA9;&#xB85D;
        <br
        />&#xAE30;&#xBCF8; &#xAC12;&#xC740; &#xBE48; &#xBC30;&#xC5F4;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.
        <br />lyricsInfoList.
        <br />time</td>
      <td style="text-align:left">integer</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">lyricsTyps &#xC774; SYNC &#xC774;&#xBA74; mandatory
        <br />lyricsInfo&#xAC00; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; &#xC2DC;&#xC810;&#xC758;
        millisecond &#xB2E8;&#xC704;&#xC758; &#xC2DC;&#xAC04; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.
        <br />lyricsInfoList.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">lyricsInfo&#xAC00; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; &#xC2DC;&#xC810;&#xC758;
        &#xAC00;&#xC0AC; &#xB0B4;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />lyrics.
        <br />showButton</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xD654;&#xBA74;&#xC744; &#xD45C;&#xC2DC;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xBC84;&#xD2BC;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />lyrics.
        <br />showButton.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC84;&#xD2BC; text</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />settings</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC124;&#xC815;&#xD55C; &#xC815;&#xBCF4;&#xB97C;
        &#xD45C;&#xC2DC;&#xD568; - Play&#xC5D0;&#xC11C;&#xB294; &#xD45C;&#xC2DC;&#xD560;
        &#xD558;&#xC704; field&#xB97C; &#xC124;&#xC815;&#xD560; &#xC218; &#xC788;&#xC74C;
        - &#xC124;&#xC815;&#xD55C; field&#xC5D0; &#xB300;&#xD55C; Event&#xC640;
        Directive&#xB97C; &#xC0AC;&#xC6A9;&#xD560; &#xC218; &#xC788;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />settings.
        <br />favorite</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD; &#xC911;&#xC778; &#xC74C;&#xC6D0;&#xC5D0; &#xB300;&#xD55C;
        &#xC88B;&#xC544;&#xC694; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />settings.
        <br />repeat</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD; &#xBAA9;&#xB85D;&#xC5D0; &#xB300;&#xD55C; &#xBC18;&#xBCF5;
        &#xC124;&#xC815; - <b>ALL</b> : &#xC804;&#xACE1; &#xBC18;&#xBCF5; - <b>ONE</b> :
        &#xD55C;&#xACE1; &#xBC18;&#xBCF5; - <b>NONE</b> : &#xBC18;&#xBCF5; &#xC5C6;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />settings.
        <br />shuffle</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD; &#xBAA9;&#xB85D;&#xC758; &#xC74C;&#xC6D0;&#xC744; &#xC784;&#xC758;&#xC758;
        &#xC21C;&#xC11C;&#xB85C; &#xC7AC;&#xC0DD;&#xD560;&#xC9C0; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />grammarGuide</td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBC1C;&#xD654; &#xB3C4;&#xC6C0;&#xB9D0;</td>
    </tr>
  </tbody>
</table>

#### audioItem.metadata.template - AudioPlayer.Template2

```text
{
  "metadata": {
    "disableTemplate": {{BOOLEAN}},
    "template": {
      "type": "AudioPlayer.Template2",
      "title": {
        "iconUrl": "{{STRING}}",
        "text": "{{STRING}}"
      },
      "grammarGuide": ["{{STRING}}"],
      "content": {
        "title": "{{STRING}}",
        "subtitle": "{{STRING}}",
        "subtitle1": "{{STRING}}",
        "imageUrl": "{{STRING}}",
        "durationSec": "{{STRING}}",
        "backgroundColor": "{{STRING}}",
        "lyrics" : {
          "title" : "{{String}}",
          "lyricsType" : "{{String}}",
          "lyricsInfoList" : [
            {"time":"{{Integer}}","text": "{{String}}"}
          ],
          "showButton": {
            "text": "{{String}}"
          }
        }
      }
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
      <td style="text-align:left">disableTemplate</td>
      <td style="text-align:left">bool</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">true&#xBA74; &#xC2A4;&#xD06C;&#xB9B0;&#xC744; &#xAC00;&#xC9C4; &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;
        AudioPlayer &#xC7AC;&#xC0DD; &#xC2DC; template&#xC744; display&#xD558;&#xC9C0;
        &#xC54A;&#xC74C;
        <br />default : false</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>type</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">AudioPlayer template type
        <br />- AudioPlayer.Template1
        <br />- AudioPlayer.Template2</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>title.</p>
        <p>iconUrl</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">icon image url</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>title.</p>
        <p>text</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">title text</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>content.
          <br />title</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">content &#xC601;&#xC5ED;&#xC758; title</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>content.
          <br />subtitle</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">subtitle</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.
          <br />content.</p>
        <p>subtitle1</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">lyrics&#xAC00; &#xC788;&#xB294; &#xACBD;&#xC6B0;, &#xAC00;&#xC0AC;&#xD654;&#xBA74;
        &#xC81C;&#xBAA9; &#xC6B0;&#xCE21;&#xC758; &#xC18C;&#xC81C;&#xBAA9;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>content.
          <br />imageUrl</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">background image url</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>content.
          <br />durationSec</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">content duration in sec
        <br />&#xC5C6;&#xAC70;&#xB098; 0, &#xC74C;&#xC218;, null&#xC774;&#xBA74; progress&#xB97C;
        &#xD654;&#xBA74;&#xC5D0;&#xC11C; disabled &#xCC98;&#xB9AC;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>content.
          <br />backgroundColor</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">background color
        <br />default : &quot;#000&quot;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics</td>
      <td style="text-align:left">obejct</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xD654;&#xBA74;&#xC744; &#xD45C;&#xC2DC;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.title</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xD654;&#xBA74;&#xC5D0;&#xC11C; &#xBCF4;&#xC5EC;&#xC9C8;
        &#xC81C;&#xBAA9;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.
          <br />content.
          <br />lyrics.</p>
        <p>lyricsType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xAC00;&#xC0AC;&#xC758; &#xC885;&#xB958;
        <br />- <b>NONE</b> : &#xC790;&#xB9C9; &#xC5C6;&#xC74C;
        <br />- <b>SYNC</b> : &#xC790;&#xB9C9; &#xB3D9;&#xAE30;&#xD654;
        <br />- <b>NON_SYNC</b> : &#xC790;&#xB9C9; &#xB3D9;&#xAE30;&#xD654; &#xC5C6;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.
        <br />lyricsInfoList</td>
      <td style="text-align:left">array of lyricsInfo</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xB0B4;&#xC6A9;(lyricsInfo)&#xC758; &#xBAA9;&#xB85D;
        <br
        />&#xAE30;&#xBCF8; &#xAC12;&#xC740; &#xBE48; &#xBC30;&#xC5F4;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.
        <br />lyricsInfoList.
        <br />time</td>
      <td style="text-align:left">integer</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">lyricsTyps &#xC774; SYNC &#xC774;&#xBA74; mandatory
        <br />lyricsInfo&#xAC00; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; &#xC2DC;&#xC810;&#xC758;
        millisecond &#xB2E8;&#xC704;&#xC758; &#xC2DC;&#xAC04; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">template.
        <br />content.
        <br />lyrics.
        <br />lyricsInfoList.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">lyricsInfo&#xAC00; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294; &#xC2DC;&#xC810;&#xC758;
        &#xAC00;&#xC0AC; &#xB0B4;&#xC6A9;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />lyrics.
        <br />showButton</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC00;&#xC0AC; &#xD654;&#xBA74;&#xC744; &#xD45C;&#xC2DC;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xBC84;&#xD2BC;</td>
    </tr>
    <tr>
      <td style="text-align:left">content.
        <br />lyrics.
        <br />showButton.
        <br />text</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC84;&#xD2BC; text</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>grammarGuide</p>
      </td>
      <td style="text-align:left">list of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBC1C;&#xD654; &#xB3C4;&#xC6C0;&#xB9D0;</td>
    </tr>
  </tbody>
</table>

### Stop

음원 재생 중지 요청입니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "Stop",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Pause

음원 일시정지 요청입니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "Pause",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### UpdateMetadata

음원의 Metadata UI 설정 정보를 갱신 요청입니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "UpdateMetadata",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "metadata": {
      "template": {
        "content": {
          "settings": {
            "favorite": {{BOOLEAN}},
            "repeat": "{{STRING}}",
            "shuffle": {{BOOLEAN}}
          }
        }
      }
    }
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| metadata.template. content.settings.favorite | boolean | N | AudioPlayer.Template1의 settings.favorite 와 연동 |
| metadata.template. content.settings.repeat | string | N | AudioPlayer.Template1의 settings.repeat 과 연동  - **ALL** : 전곡 반복  - **ONE** : 한곡 반복  - **NONE** : 반복 없음 |
| metadata.template. content.settings.shuffle | boolean | N | AudioPlayer.Template1의 settings.shuffle 과 연동 |

### ShowLyrics

가사화면 표시 요청입니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ShowLyrics",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### HideLyrics

가사화면 닫기 요청입니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "HideLyrics",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ControlLyricsPage

가사화면 스크롤 위치 이동 요청입니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ControlLyricsPage",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | Y | 이전과 다음 PREVIOUS, NEXT |

### RequestPlayCommand

* Nugu mobile application 에서 새로운 곡 재생을 요청하기 위한 Directive.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestPlayCommand",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {}
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| payload | object | Y | Play 에서 곡 재생을 위해 필요한 정보 |

### RequestResumeCommand

* Nugu mobile application 에서 현재 재생중인 play 에 대한 제어를 위한 Directive.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestResumeCommand",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {}
}
```

### RequestNextCommand

* Nugu mobile application 에서 현재 재생중인 play 에 대한 제어를 위한 Directive.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestNextCommand",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {}
}
```

### RequestPreviousCommand

* Nugu mobile application 에서 현재 재생중인 play 에 대한 제어를 위한 Directive.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestPreviousCommand",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {}
}
```

### RequestPauseCommand

* Nugu mobile application 에서 현재 재생중인 play 에 대한 제어를 위한 Directive.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestPauseCommand",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {}
}
```

### RequestStopCommand

* Nugu mobile application 에서 현재 재생중인 play 에 대한 제어를 위한 Directive.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestStopCommand",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.2"
  },
  "payload": {}
}
```

## Events

### PlaybackStarted

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "PlaybackStarted",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### PlaybackPaused

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "PlaybackPaused",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### PlaybackResumed

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "PlaybackResumed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### PlaybackFinished

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "PlaybackFinished",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### PlaybackStopped

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "PlaybackStopped",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}",
    "reason": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |
| reason | string | N | 이 이벤트가 만들어진 이유를 명시하기 위한 객체 **STOP**, **PLAY\_ANOTHER** 중 하나.  - **PLAY\_ANOTHER** : 동일 play 내에서 다른 곡 재생을 위해 이전에 재생하던 곡을 정지했을 때 올려주는 값.  - **STOP** : 그 외 정지의 경우. |

### PlaybackFailed

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "PlaybackFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "error": {
      "type": "{{STRING}}",
      "message": "{{STRING}}"
    },
    "currentPlaybackState": {
      "token": "{{STRING}}",
      "offsetInMilliseconds": {{LONG}},
      "playerActivity": "{{STRING}}"
    },
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 재생에 실패한 stream의 token |
| offsetInMilliseconds | long | Y | PlaybackFailed를 보낼 때 재생 중인 stream의 offset 값 |
| error.type | string | Y | **MEDIA\_ERROR\_UNKNOWN** **MEDIA\_ERROR\_INVALID\_REQUEST** **MEDIA\_ERROR\_SERVICE\_UNAVAILABLE** **MEDIA\_ERROR\_INTERNAL\_SERVER\_ERROR** **MEDIA\_ERROR\_INTERNAL\_DEVICE\_ERROR** |
| error.message | string | Y | 에러에 대해 자세히 기술 |
| currentPlaybackState.token | string | Y | 현재 재생 중인 stream의 token으로 위에 있는 token과 다를 수 있음 |
| currentPlaybackState. offsetInMilliseconds | long | Y | 에러가 발생했을 때 현재 재생 중인 stream의 offset 값 |
| currentPlaybackState. playActivity | string | Y | player의 상태 **PLAYING**, **PAUSED**, **FINISHED**, **IDLE** |

### ProgressReportDelayElapsed

* Play directive로 전달된 stream이 재생을 시작한 뒤 progressReportDelayInMilliseconds
* **offsetInMilliseconds는 stream의 시작을 기준으로 offset을 의미 \(컨텐츠 재생 시간 0부터 절대값을 의미\)**

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ProgressReportDelayElapsed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### ProgressReportIntervalElapsed

* Play directive로 전달된 stream이 재생을 시작한 뒤 progressIntervalDelayInMilliseconds 주기마다 Event 전달
* **offsetInMilliseconds는 stream의 시작을 기준으로 offset을 의미 \(컨텐츠 재생 시간 0부터 절대값을 의미\)**

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ProgressReportIntervalElapsed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### NextCommandIssued

사용자가 다음 음원 재생을 요청하면 전송됩니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "NextCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### PreviousCommandIssued

사용자가 이전 음원 재생을 요청하면 전송됩니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "PreviousCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### FavoriteCommandIssued

사용자가 현재 음원 즐겨찾기\(좋아요 포함\)를 요청하면 전송됩니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "FavoriteCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "favorite": {{BOOLEAN}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| favorite | boolean | Y | 재생 중인 음원에 대한 좋아요 여부 |

### RepeatCommandIssued

사용자가 현재 음원 반복 재생을 요청하면 전송됩니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RepeatCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "repeat": {{BOOLEAN}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| repeat | boolean | Y | 재생 목록에 대한 반복 설정  - **ALL** : 전곡 반복  - **ONE** : 한곡 반복  - **NONE** : 반복 없음 |

### ShuffleCommandIssued

사용자가 셔플 재생을 요청하면 전송됩니다.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ShuffleCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "shuffle": {{BOOLEAN}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| shuffle | boolean | Y | 재생 목록의 음원을 임의의 순서로 재생할지 여부 |

### ShowLyricsSucceeded

* ShowLyrics Directive가 발생하여 가사화면을 성공적으로 띄운다음 발생되는 Event

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ShowLyricsSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ShowLyricsFailed

* ShowLyrics Directive가 발생하였는데 가사화면을 띄우지 못한 경우 발생되는 Event

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ShowLyricsFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### HideLyricsSucceeded

* HideLyrics Directive가 발생하여 가사화면을 성공적으로 닫은 다음 발생되는 Event

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "HideLyricsSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### HideLyricsFailed

* HideLyrics Directive가 발생하였는데 가사화면을 닫지 못한 경우 발생되는 Event

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "HideLyricsFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ControlLyricsPageSucceeded

* ControlLyricsPage Directive가 발생하여 가사화면을 성공적으로 이동한 다음 발생되는 Event

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ControlLyricsPageSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | Y | 이전과 다음을 수행한 결과 PREVIOUS, NEXT |

### ControlLyricsPageFailed

* ControlLyricsPage Directive가 발생하였는데 가사화면을 이동하지 못한 경우 발생되는 Event

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "ControlLyricsPageFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "direction": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | Y | 이전과 다음을 수행한 결과 PREVIOUS, NEXT |

### RequestPlayCommandIssued

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestPlayCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {}
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| payload | string | **Y** | RequestPlayCommand Directive 에 포함되어 있는 payload 를  그대로 포함. |

### RequestResumeCommandIssued

* RequestResumeCommand Directive 를 받은 디바이스가 발생시키는 Event.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestResumeCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### RequestNextCommandIssued

* RequestNextCommand Directive 를 받은 디바이스가 발생시키는 Event.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestNextCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### RequestPreviousCommandIssued

* RequestPreviousCommand Directive 를 받은 디바이스가 발생시키는 Event.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestPreviousCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### RequestPauseCommandIssued

* RequestPauseCommand Directive 를 받은 디바이스가 발생시키는 Event.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestPauseCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### RequestStop CommandIssued

* RequestStopCommand Directive 를 받은 디바이스가 발생시키는 Event.

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestStopCommandIssued",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "token": "{{STRING}}",
    "offsetInMilliseconds": {{LONG}},
    "playServiceId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | 현재 재생 중인 stream의 token |
| offsetInMilliseconds | long | Y | 현재 재생 중인 stream의 offset 값 |

### RequestCommandFailed

```text
{
  "header": {
    "namespace": "AudioPlayer",
    "name": "RequestCommandFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.4"
  },
  "payload": {
    "error": {
      "type": "{{STRING}}",
      "message": "{{STRING}}"
    }
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| error.type | string | Y | **에러 타입 코드**  - **INVALID\_COMMAND** : **IDLE/STOP** 상태일때 Request Pause/Resume/Next/Previous/Stop Command Directive 수신한 경우 \(**STOP/IDLE 일때 RequestPlayCommand 는 정상요청이므로 제외에 유의**\)  - **UNKNOWN\_ERROR** : 그 이외에 처리중 에러난 경우 |
| error.message | string | Y | STOP/IDLE 상태에서는 Request XXX Command 를 처리할 수 없음. |

