---
description: 음악 앱을 제어하기 위한 규격
---

# MediaPlayer

## Version

최신 버전은 1.0 입니다.

## SDK Interface

### MediaPlayerAgent 사용

MediaPlayer interface 규격에 따른 디바이스의 동작 제어는 MediaAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient 생성시 MediaPlayerAgent 를 추가합니다.

```text
val mediaPlayer = object : MediaPlayer {
    ...
}
NuguAndroidClient().Builder()
            .addAgentFactory(MediaPlayerAgent.NAMESPACE, object : AgentFactory<MediaPlayerAgent> {
                override fun create(container: SdkContainer): MediaPlayerAgent = with(container) {
                    MediaPlayerAgent(
                        mediaPlayer,
                        getMessageSender(),
                        getContextManager(),
                        getContextManager(),
                        getDirectiveSequencer()
                    )
                }
            })
```

NuguAndroidClient instance 를 통해 MediaPlayerAgent instance 에 접근할 수 있습니다.

```text
val mediaPlayerAgent = nuguAndroidClient.mediaPlayerAgent
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 MediaPlayerAgent instance 에 접근할 수 있습니다.

```text
let mediaPlayerAgent = nuguClient.mediaPlayerAgent
```
{% endtab %}
{% endtabs %}

### 제어 명령

`사용자 발화`에 의해 음악 [검색](mediaplayer.md#search)/[재생](mediaplayer.md#play)/[중지](mediaplayer.md#stop)/[다음](mediaplayer.md#next)/[이전](mediaplayer.md#previous)/[탐색](mediaplayer.md#move)/[일시정지](mediaplayer.md#pause)/[계속재생](mediaplayer.md#resume)/[다시재생](mediaplayer.md#rewind)/[반복](mediaplayer.md#toggle)/[즐겨찾기](mediaplayer.md#toggle)/[셔플](mediaplayer.md#toggle) 이 directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
MediaPlayer 의 search, play, stop, next, previous, move, pause, resume, rewind, toggle 함수에서 각 각의 기능을 구현합니다.
{% endtab %}

{% tab title="iOS" %}
음악을 제어려면 MediaPlayerAgentDelegate를 추가합니다.

```text
mediaPlayerAgent.delegate = self
```

MediaPlayerAgentDelegate 의 mediaPlayerAgentReceiveSearch/Play/stop/next/previous/move/pause/resume/rewind/toggle 함수에서 각 각의 기능을 구현합니다.
{% endtab %}
{% endtabs %}

### 재생중인 곡 정보 요청

재생중인 곡 정보가 [GetInfo](mediaplayer.md#getinfo) directive 로 요청될 수 있습니다.

{% tabs %}
{% tab title="Android" %}
MediaPlayer.getInfo\(\) 에서 곡 정보를 전달합니다.
{% endtab %}

{% tab title="iOS" %}
MediaPlayerAgentDelegate.mediaPlayerAgentReceiveGetInfo 에서 곡 정보를 전달합니다.
{% endtab %}
{% endtabs %}

## Context

```text
{
  "MediaPlayer": {
    "version": "1.0",
    "appStatus": "{{STRING}}",
    "playerActivity": "{{STRING}}",
    "user": {
      "isLogIn": "{{STRING}}",
      "hasVoucher": "{{STRING}}"
    },
    "currentSong": Song,
    "playlist": {
      "name": "{{STRING}}",
      "number": "{{STRING}}",
      "length": "{{STRING}}",
      "currentSongOrder": "{{STRING}}"
    },
    "toggle": {
      "repeat": "{{STRING}}",
      "shuffle": "{{STRING}}"
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
      <th style="text-align:left">Play Builder Precondition</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">appStatus</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <ul>
          <li><b>NOT_RUNNING</b>
          </li>
          <li><b>NORMAL (&#xC815;&#xC0C1; &#xC0C1;&#xD0DC; &#xB514;&#xD3F4;&#xD2B8;)</b>
          </li>
          <li><b>... (&#xC9C0;&#xC815;&#xB41C; &#xC5D0;&#xB7EC;&#xCF54;&#xB4DC;)</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playerActivity</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>Y</b>
      </td>
      <td style="text-align:left">
        <p>&#xC571;&#xC758; &#xD604;&#xC7AC; &#xC7AC;&#xC0DD; &#xC0C1;&#xD0DC;</p>
        <ul>
          <li><b>STOPPED</b>
          </li>
          <li><b>PLAYING</b>
          </li>
          <li><b>PAUSED</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">user</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">user.
        <br />isLogIn</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xB85C;&#xADF8;&#xC778; &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>TRUE</b>
          </li>
          <li><b>FALSE</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">user.
        <br />hasVoucher</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC7AC;&#xC0DD; &#xAC00;&#xB2A5; &#xC774;&#xC6A9;&#xAD8C; &#xBCF4;&#xC720;
          &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>TRUE</b>
          </li>
          <li><b>FALSE</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">currentSong</td>
      <td style="text-align:left"><a href="mediaplayer.md#song">Song</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD604;&#xC7AC; &#xC7AC;&#xC0DD; &#xC911;&#xC774;&#xAC70;&#xB098; &#xB9C8;&#xC9C0;&#xB9C9;&#xC5D0;
        &#xC7AC;&#xC0DD;&#xD55C; &#xACE1;&#xC758; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">playlist</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Play List&#xAC00; &#xD604;&#xC7AC; &#xC7AC;&#xC0DD; &#xC0C1;&#xD0DC;&#xC774;&#xAC70;&#xB098;
        &#xBA48;&#xCDB0;&#xC788;&#xB294; &#xACBD;&#xC6B0;</td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD604;&#xC7AC; &#xC7AC;&#xC0DD; &#xB9AC;&#xC2A4;&#xD2B8;&#xC758; &#xD0C0;&#xC785;</p>
        <ul>
          <li><b>CHART</b> - &#xCC28;&#xD2B8; &#xB9AC;&#xC2A4;&#xD2B8; &#xC7AC;&#xC0DD;
            &#xC911;</li>
          <li><b>PLAYLIST</b> - &#xC0AC;&#xC6A9;&#xC790; &#xC800;&#xC7A5; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;
            &#xC7AC;&#xC0DD; &#xC911;</li>
          <li><b>THEMELIST - &#xD14C;&#xB9C8;&#xB9AC;&#xC2A4;&#xD2B8;&#xC758; &#xACBD;&#xC6B0;</b>
          </li>
          <li><b>DEFAULT</b> - &#xC704;&#xC5D0; &#xD574;&#xB2F9; &#xC0AC;&#xD56D;&#xC774;
            &#xC5C6;&#xB294; &#xACBD;&#xC6B0;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC01; &#xD0C0;&#xC785; &#xB0B4;&#xC5D0;&#xC11C;&#xC758; &#xC774;&#xB984;
        (PLAYLIST, THEMELIST&#xC758; &#xACBD;&#xC6B0;)</td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />number</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>type&#xC774; &quot;PLAYLIST&quot;&#xC778; &#xACBD;&#xC6B0; mandantory,</p>
        <p>&#xC7AC;&#xC0DD; &#xC911;&#xC778; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xC758;
          &#xBC88;&#xD638;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />length</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC804;&#xCCB4; &#xACE1; &#xC218;</td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />currentSongOrder</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD604;&#xC7AC; &#xC7AC;&#xC0DD; &#xACE1; &#xC21C;&#xC11C; (&#xC804;&#xCCB4;&#xAC00;
        N&#xC774;&#xBA74;, current &#xAC12;&#xC740; 1(&#xCCAB;&#xACE1;), ... N(&#xB9C8;&#xC9C0;&#xB9C9;&#xACE1;)
        &#xAE4C;&#xC9C0; &#xB098;&#xC62C; &#xC218; &#xC788;&#xC74C;)</td>
    </tr>
    <tr>
      <td style="text-align:left">toggle</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Toggle Directive&#xC5D0;&#xC11C; &#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xAE30;&#xB2A5;&#xC758;
          &#xC0C1;&#xD0DC; &#xC815;&#xBCF4;</p>
        <p>repeat, shuffle &#xC911; &#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xAE30;&#xB2A5;&#xB9CC;
          &#xD3EC;&#xD568;&#xD574;&#xC57C; &#xD568; (&#xD3EC;&#xD568;&#xB418;&#xC9C0;
          &#xC54A;&#xC740; &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xB294; Play&#xC5D0;&#xC11C;
          &#xBBF8;&#xC9C0;&#xC6D0;&#xC73C;&#xB85C; &#xD310;&#xB2E8;)</p>
        <p>&#xBAA8;&#xB450; &#xC9C0;&#xC6D0;&#xD558;&#xC9C0; &#xC54A;&#xC73C;&#xBA74;
          toggle &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xAC00; &#xC5C6;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">toggle.
        <br />repeat</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>ALL</b> - &#xC804;&#xCCB4; &#xBC18;&#xBCF5;</li>
          <li><b>ONE</b> - &#xD55C;&#xACE1; &#xBC18;&#xBCF5;</li>
          <li><b>NONE</b> - &#xBC18;&#xBCF5; &#xC5C6;&#xC74C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">toggle.
        <br />shuffle</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC154;&#xD50C; &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>ON</b>
          </li>
          <li><b>OFF</b>
          </li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Common Objects

### Song

```text
{
  "category": "{{STRING}}",
  "theme": "{{STRING}}",
  "genre": [String],
  "artist": [String],
  "album": "{{STRING}}",
  "title": "{{STRING}}",
  "duration": "{{STRING}}",
  "issueDate": "{{STRING}}",
  "etc": { # arbitrary object }
}
```



<table>
  <thead>
    <tr>
      <th style="text-align:left">pamateter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">mandatory</th>
      <th style="text-align:left">description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">category</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ol>
          <li><b>NONE</b>
          </li>
          <li><b>RECOMMEND</b>
          </li>
          <li><b>POPULAR</b>
          </li>
          <li><b>NEW</b>
          </li>
          <li><b>CHART</b>
          </li>
          <li><b>RECENT_PLAYED</b>
          </li>
          <li><b>FAVORITE</b>
          </li>
          <li><b>LIKE_SONG</b>
          </li>
          <li><b>LIKE_ALBUM</b>
          </li>
          <li><b>LIKE_ARTIST</b>
          </li>
          <li><b>LIKE_THEME</b>
          </li>
          <li><b>PLAYLIST</b>
          </li>
          <li><b>NOWPLAYING</b>
          </li>
        </ol>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">theme</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD14C;&#xB9C8;</td>
    </tr>
    <tr>
      <td style="text-align:left">genre</td>
      <td style="text-align:left">array of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7A5;&#xB974;</td>
    </tr>
    <tr>
      <td style="text-align:left">artist</td>
      <td style="text-align:left">array of string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC544;&#xD2F0;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">album</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC568;&#xBC94;</td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC81C;&#xBAA9;</td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD; &#xC2DC;&#xAC04; (&#xB2E8;&#xC704;: msec)</td>
    </tr>
    <tr>
      <td style="text-align:left">issueDate</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">ISO 8601 &#xD3EC;&#xB9F7;
        <br />2020-06-01</td>
    </tr>
    <tr>
      <td style="text-align:left">etc</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAE30;&#xD0C0; &#xC815;&#xBCF4;&#xB97C; key:value &#xD615;&#xD0DC;&#xB85C;
        &#xCD94;&#xAC00; &#xAC00;&#xB2A5;</td>
    </tr>
  </tbody>
</table>

## Directives

### Play

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Play",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "action": "{{STRING}}",
    "asrText": "{{STRING}}",
    "song": Song,
    "toggle": {
      "repeat": "{{STRING}}",
      "shuffle": "{{STRING}}"
    },
    "data": { # arbitrary object }
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">action</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC571;&#xC758; &#xB3D9;&#xC791; &#xAC00;&#xB2A5; &#xC5EC;&#xBD80;&#xB97C;
          &#xBAA8;&#xB97C; &#xC218; &#xC788;&#xAE30; &#xB54C;&#xBB38;&#xC5D0; &#xC0C1;&#xD0DC;&#xB97C;
          &#xD30C;&#xC545;&#xD558;&#xACE0; &#xC2E4;&#xD589;&#xD558;&#xB294; &#xB3D9;&#xC791;&#xC744;
          &#xAD6C;&#xBD84;&#xD558;&#xAE30; &#xC704;&#xD574; &#xC815;&#xC758;</p>
        <ul>
          <li><b>CHECK</b> - &#xCD5C;&#xCD08; &#xD638;&#xCD9C; &#xC2DC;</li>
          <li><b>EXECUTE</b> - suspended&#xB97C; &#xD1B5;&#xD574; &#xC0C1;&#xD0DC;&#xAC00;
            &#xD655;&#xC778;&#xB418;&#xACE0; &#xB09C; &#xD6C4; &#xB2E4;&#xC2DC; &#xC694;&#xCCAD;&#xD558;&#xB294;
            &#xACBD;&#xC6B0;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">asrText</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC694;&#xCCAD;&#xB41C; &#xBC1C;&#xD654;&#xBB38;</td>
    </tr>
    <tr>
      <td style="text-align:left">song</td>
      <td style="text-align:left"><a href="mediaplayer.md#song">Song</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">toggle</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>repeat, shuffle &#xC911; &#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xAE30;&#xB2A5;&#xB9CC;
          &#xD3EC;&#xD568;&#xD574;&#xC57C; &#xD568; (&#xD3EC;&#xD568;&#xB418;&#xC9C0;
          &#xC54A;&#xC740; &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xB294; Play&#xC5D0;&#xC11C;
          &#xBBF8;&#xC9C0;&#xC6D0;&#xC73C;&#xB85C; &#xD310;&#xB2E8;)</p>
        <p>&#xBAA8;&#xB450; &#xC9C0;&#xC6D0;&#xD558;&#xC9C0; &#xC54A;&#xC73C;&#xBA74;
          toggle &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xAC00; &#xC5C6;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">toggle.
        <br />repeat</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>ALL</b> - &#xC804;&#xCCB4; &#xBC18;&#xBCF5;</li>
          <li><b>ONE</b> - &#xD55C;&#xACE1; &#xBC18;&#xBCF5;</li>
          <li><b>NONE</b> - &#xBC18;&#xBCF5; &#xC5C6;&#xC74C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">toggle.
        <br />shuffle</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC154;&#xD50C; &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>ON</b>
          </li>
          <li><b>OFF</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">data</td>
      <td style="text-align:left">obejct</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Play Directive &#xCC98;&#xB9AC; &#xACB0;&#xACFC;&#xC5D0; &#xB530;&#xB77C;
        Suspended &#xC774;&#xBCA4;&#xD2B8;&#xB97C; &#xBC1B;&#xC744; &#xC218; &#xC788;&#xB294;&#xB370;,
        &#xC5F0;&#xC18D;&#xB41C; &#xC694;&#xCCAD;&#xC744; &#xC704;&#xD574; &#xCD5C;&#xCD08;
        &#xC694;&#xCCAD;&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xB41C; &#xC815;&#xBCF4;&#xB97C;
        &#xC774;&#xD6C4; flow&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xD558;&#xB294;
        &#xC6A9;&#xB3C4;&#xB85C; &#xC0AC;&#xC6A9;</td>
    </tr>
  </tbody>
</table>

### Stop

```text
{
  "header": {
    "namespace": "MediaPlayer",
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

### Search

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Search",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "asrText": "{{STRING}}",
    "song": Song
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">asrText</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC694;&#xCCAD;&#xB41C; &#xBC1C;&#xD654;&#xBB38;</td>
    </tr>
    <tr>
      <td style="text-align:left">song</td>
      <td style="text-align:left"><a href="mediaplayer.md#song">Song</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

### Previous

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Previous",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "action": "{{STRING}}",
    "target": "{{STRING}}",
    "data": { # arbitrary object }
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">action</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC571;&#xC758; &#xB3D9;&#xC791; &#xAC00;&#xB2A5; &#xC5EC;&#xBD80;&#xB97C;
          &#xBAA8;&#xB97C; &#xC218; &#xC788;&#xAE30; &#xB54C;&#xBB38;&#xC5D0; &#xC0C1;&#xD0DC;&#xB97C;
          &#xD30C;&#xC545;&#xD558;&#xACE0; &#xC2E4;&#xD589;&#xD558;&#xB294; &#xB3D9;&#xC791;&#xC744;
          &#xAD6C;&#xBD84;&#xD558;&#xAE30; &#xC704;&#xD574; &#xC815;&#xC758;</p>
        <ul>
          <li><b>CHECK</b> - &#xCD5C;&#xCD08; &#xD638;&#xCD9C; &#xC2DC;</li>
          <li><b>EXECUTE</b> - suspended&#xB97C; &#xD1B5;&#xD574; &#xC0C1;&#xD0DC;&#xAC00;
            &#xD655;&#xC778;&#xB418;&#xACE0; &#xB09C; &#xD6C4; &#xB2E4;&#xC2DC; &#xC694;&#xCCAD;&#xD558;&#xB294;
            &#xACBD;&#xC6B0;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">target</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>TRACK, PLAYLIST</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">data</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Previous Directive &#xCC98;&#xB9AC; &#xACB0;&#xACFC;&#xC5D0; &#xB530;&#xB77C;
        Suspended &#xC774;&#xBCA4;&#xD2B8;&#xB97C; &#xBC1B;&#xC744; &#xC218; &#xC788;&#xB294;&#xB370;,
        &#xC5F0;&#xC18D;&#xB41C; &#xC694;&#xCCAD;&#xC744; &#xC704;&#xD574; &#xCD5C;&#xCD08;
        &#xC694;&#xCCAD;&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xB41C; &#xC815;&#xBCF4;&#xB97C;
        &#xC774;&#xD6C4; flow&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xD558;&#xB294;
        &#xC6A9;&#xB3C4;&#xB85C; &#xC0AC;&#xC6A9;</td>
    </tr>
  </tbody>
</table>

### Next

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Next",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "action": "{{STRING}}",
    "target": "{{STRING}}",
    "data": { # arbitrary object }
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">action</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC571;&#xC758; &#xB3D9;&#xC791; &#xAC00;&#xB2A5; &#xC5EC;&#xBD80;&#xB97C;
          &#xBAA8;&#xB97C; &#xC218; &#xC788;&#xAE30; &#xB54C;&#xBB38;&#xC5D0; &#xC0C1;&#xD0DC;&#xB97C;
          &#xD30C;&#xC545;&#xD558;&#xACE0; &#xC2E4;&#xD589;&#xD558;&#xB294; &#xB3D9;&#xC791;&#xC744;
          &#xAD6C;&#xBD84;&#xD558;&#xAE30; &#xC704;&#xD574; &#xC815;&#xC758;</p>
        <ul>
          <li><b>CHECK</b> - &#xCD5C;&#xCD08; &#xD638;&#xCD9C; &#xC2DC;</li>
          <li><b>EXECUTE</b> - suspended&#xB97C; &#xD1B5;&#xD574; &#xC0C1;&#xD0DC;&#xAC00;
            &#xD655;&#xC778;&#xB418;&#xACE0; &#xB09C; &#xD6C4; &#xB2E4;&#xC2DC; &#xC694;&#xCCAD;&#xD558;&#xB294;
            &#xACBD;&#xC6B0;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">target</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>TRACK, PLAYLIST</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">data</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Next Directive &#xCC98;&#xB9AC; &#xACB0;&#xACFC;&#xC5D0; &#xB530;&#xB77C;
        Suspended &#xC774;&#xBCA4;&#xD2B8;&#xB97C; &#xBC1B;&#xC744; &#xC218; &#xC788;&#xB294;&#xB370;,
        &#xC5F0;&#xC18D;&#xB41C; &#xC694;&#xCCAD;&#xC744; &#xC704;&#xD574; &#xCD5C;&#xCD08;
        &#xC694;&#xCCAD;&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xB41C; &#xC815;&#xBCF4;&#xB97C;
        &#xC774;&#xD6C4; flow&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xD558;&#xB294;
        &#xC6A9;&#xB3C4;&#xB85C; &#xC0AC;&#xC6A9;</td>
    </tr>
  </tbody>
</table>

### Move

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Move",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "direction": "{{STRING}}",
    "sec": {{LONG}}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| direction | string | Y | **FORWARD, BACKWARD** |
| sec | string | Y | 이동 시간 \(단위 - 초\) |

### Pause

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Pause",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
  </tbody>
</table>

### Resume

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Resume",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
  </tbody>
</table>

### Rewind

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Rewind",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
  </tbody>
</table>

### Toggle

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "Toggle",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "repeat": "{{STRING}}",
    "like": "{{STRING}}",
    "shuffle": "{{STRING}}"
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
      <td style="text-align:left">version</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC778;&#xD130;&#xD398;&#xC774;&#xC2A4; &#xBC84;&#xC804;, &#xAE30;&#xBCF8;
        &#xAC12;&#xC740; 1.0</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>Directive &#xB97C; &#xC804;&#xB2EC;&#xD55C; Play &#xC815;&#xBCF4;.</p>
        <p>PlayRouter&#xAC00; &#xC0DD;&#xC131;&#xD558;&#xAE30; &#xB54C;&#xBB38;&#xC5D0;
          NPK &#xADDC;&#xACA9;&#xC5D0;&#xB294; &#xD3EC;&#xD568;&#xB418;&#xC9C0; &#xC54A;&#xC74C;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">repeat</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>ALL</b> - &#xC804;&#xCCB4; &#xBC18;&#xBCF5;</li>
          <li><b>ONE</b> - &#xD55C;&#xACE1; &#xBC18;&#xBCF5;</li>
          <li><b>NONE</b> - &#xBC18;&#xBCF5; &#xC5C6;&#xC74C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">like</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xC88B;&#xC544;&#xC694; &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>TRUE</b>
          </li>
          <li><b>FALSE</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">shuffle</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <p>&#xC154;&#xD50C; &#xC5EC;&#xBD80;</p>
        <ul>
          <li><b>ON</b>
          </li>
          <li><b>OFF</b>
          </li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### GetInfo

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "GetInfo",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xB2EC;&#xD558;&#xB294; Directive&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD55C; unique string</p>
        <p>&#xACB0;&#xACFC; &#xC774;&#xBCA4;&#xD2B8;&#xC5D0; &#xC774; token&#xC744;
          &#xADF8;&#xB300;&#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC8FC;&#xC5B4;&#xC57C;
          &#xD568;</p>
      </td>
    </tr>
  </tbody>
</table>

## Events

### PlaySucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "PlaySucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### PlaySuspended

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "PlaySuspended",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "song": Song,
    "playlist": {
      "name": "{{STRING}}",
      "number": "{{STRING}}"
    },
    "issueCode": "{{STRING}}",
    "data": { # arbitrary object }
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">song</td>
      <td style="text-align:left"><a href="mediaplayer.md#song">Song</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">playlist</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li>&#xC7AC;&#xC0DD;&#xD560; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xBA85;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>playlist.</p>
        <p>number</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li>&#xC7AC;&#xC0DD;&#xD560; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xC758;
            &#xBC88;&#xD638;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">issueCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li>&#xC7AC;&#xC0DD;&#xC744; &#xC218;&#xD589;&#xD558;&#xC9C0;&#xB9CC;, &#xC544;&#xB798;&#xC640;
            &#xAC19;&#xC740; &#xD2B9;&#xC218; &#xB3D9;&#xC791; &#xBC0F; prompt&#xB97C;
            &#xBD84;&#xAE30;&#xD558;&#xB294; &#xACBD;&#xC6B0;
            <ul>
              <li>onlyAdult : &#xCCAB;&#xACE1;&#xC774; &apos;&#xC131;&#xC778; &#xC778;&#xC99D;&apos;&#xC774;
                &#xD544;&#xC694;&#xD55C; &#xC74C;&#xC545;&#xC73C;&#xB85C;, &gt; skip&#xD558;&#xC5EC;
                &#xC7AC;&#xC0DD;</li>
              <li>disable : &#xCCAB;&#xACE1;&#xC774; &#xC11C;&#xBE44;&#xC2A4;&#xAC00; &#xC911;&#xC9C0;&#xB41C;
                &#xACE1; &gt;skip&#xD558;&#xC5EC; &#xC7AC;&#xC0DD;</li>
              <li>notAllowed : &#xCCAB; &#xACE1;&#xC774; &#xC81C;&#xACF5;&#xC0AC; &#xC0AC;&#xC815;&#xC73C;&#xB85C;
                &#xC7AC;&#xC0DD;&#xD560; &#xC218; &#xC5C6;&#xC74C;. &gt; skip&#xD558;&#xC5EC;
                &#xC7AC;&#xC0DD;</li>
              <li>onlyPreview : &#xCCAB; &#xACE1;&#xC774; &#xAD8C;&#xB9AC;&#xC0AC; &#xC694;&#xCCAD;&#xC73C;&#xB85C;
                &#xBBF8;&#xB9AC;&#xB4E3;&#xAE30;&#xB9CC; &#xAC00;&#xB2A5;&#xD55C; &#xC74C;&#xC545;
                &gt; &#xBBF8;&#xB9AC;&#xB4E3;&#xAE30;&#xB9CC; &#xC7AC;&#xC0DD;</li>
              <li>noRecentPlayed : &#xCD5C;&#xADFC;&#xB4E4;&#xC740; &#xACE1; &#xC694;&#xCCAD;&#xC2DC;,
                &#xCD5C;&#xADFC;&#xB4E4;&#xC740; &#xC774;&#xB825;&#xC774; &#xC5C6;&#xC5B4;&#xC11C;
                &#xC2E4;&#xC2DC;&#xAC04; &#xCC28;&#xD2B8;&#xB85C; &#xB300;&#xC548; &#xC7AC;&#xC0DD;&#xD558;&#xB294;
                &#xACBD;&#xC6B0;</li>
              <li>noFavoritePlayed : &#xB9CE;&#xC774; &#xB4E4;&#xC740; &#xACE1; &#xC694;&#xCCAD;&#xC2DC;,
                &#xB9CE;&#xC774;&#xB4E4;&#xC740; &#xC774;&#xB825;&#xC774; &#xC5C6;&#xC5B4;&#xC11C;
                &#xC2E4;&#xC2DC;&#xAC04; &#xCC28;&#xD2B8;&#xB85C; &#xB300;&#xC548; &#xC7AC;&#xC0DD;&#xD558;&#xB294;
                &#xACBD;&#xC6B0;</li>
            </ul>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">data</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Play Directive&#xC5D0;&#xC11C; data &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xAC00;
        &#xC874;&#xC7AC;&#xD558;&#xBA74; &#xADF8; object&#xB97C; &#xADF8;&#xB300;&#xB85C;
        &#xBCF4;&#xB0B4;&#xC918;&#xC57C; &#xD568;</td>
    </tr>
  </tbody>
</table>

### PlayFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "PlayFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>noPlaylist : &#xC7AC;&#xC0DD; &#xAC00;&#xB2A5; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;
          &#xC5C6;&#xC74C;</p>
        <p>toBeReleased : &#xC74C;&#xC545;&#xC774; &#xBC1C;&#xB9E4;&#xB420; &#xC608;&#xC815;,
          &#xD604;&#xC7AC;&#xB294; &#xBBF8;&#xBC1C;&#xB9E4; &#xC0C1;&#xD0DC;</p>
        <p>searchFailed : &#xAC80;&#xC0C9; &#xC2E4;&#xD328;, &#xBA54;&#xD0C0;&#xC0C1;&#xC5D0;
          &#xC5C6;&#xC74C;</p>
        <p>disableAll : &#xC7AC;&#xC0DD; &#xBAA9;&#xB85D;&#xC5D0; &#xC7AC;&#xC0DD;&#xAC00;&#xB2A5;
          &#xC0C1;&#xD0DC; &#xC74C;&#xC6D0;&#xC774; &#xC5C6;&#xC74C;</p>
        <p>noLikeSong : &#xC88B;&#xC544;&#xC694;&#xD55C; &#xACE1;&#xC774; &#xC5C6;&#xC74C;</p>
        <p>noNowlist : &#xD604;&#xC7AC;&#xC7AC;&#xC0DD;&#xBAA9;&#xB85D; &#xC694;&#xCCAD;&#xD588;&#xC73C;&#xB098;
          &#xBAA9;&#xB85D;&#xC5D0; &#xACE1;&#xC5C6;&#xC74C;</p>
        <p>noLikeAlbum : &#xC88B;&#xC544;&#xC694;&#xD55C; &#xC568;&#xBC94; &#xC5C6;&#xC74C;</p>
        <p>noLikeTheme : &#xC88B;&#xC544;&#xC694;&#xD55C; &#xD14C;&#xB9C8; &#xC5C6;&#xC74C;</p>
        <p>noLikeArtist : &#xC88B;&#xC544;&#xC694;&#xD55C; &#xAC00;&#xC218;&#xC5C6;&#xC74C;</p>
        <p>multiPlayingStop : &#xBA40;&#xD2F0; &#xB514;&#xBC14;&#xC774;&#xC2A4; &#xC911;&#xBCF5;
          &#xC7AC;&#xC0DD;&#xC73C;&#xB85C; &#xC778;&#xD55C; autonext &#xC2DC;</p>
        <p>&#xC7AC;&#xC0DD; &#xC911;&#xB2E8; &#xBC1C;&#xC0DD; &#xC2DC;</p>
        <p>requireLogin : &#xB85C;&#xADF8;&#xC778; &#xAE30;&#xB2A5;&#xC774; &#xD544;&#xC218;&#xC778;
          &#xB3D9;&#xC791;&#xC774;&#xB098;, &#xBE44;&#xB85C;&#xADF8;&#xC778;&#xC0C1;&#xD0DC;&#xB85C;
          &#xC778;&#xD55C; &#xC2E4;&#xD328;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### StopSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "StopSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |

### StopFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "StopFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}ㅊ}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### SearchSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "SearchSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### SearchFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "SearchFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### PreviousSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "PreviousSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### PreviousSuspended

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "PreviousSuspended",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "song": Song,
    "target": "{{STRING}}",
    "playlist": {
      "name": "{{STRING}}",
      "number": "{{STRING}}"
    },
    "data": { # arbitrary object}
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">song</td>
      <td style="text-align:left"><a href="mediaplayer.md#song">Song</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD;&#xD558;&#xB294; &#xC74C;&#xC6D0;&#xC758; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">target</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>PLAYLIST : &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8; &#xC774;&#xB3D9;
          &#xC131;&#xACF5;&#xD55C; &#xACBD;&#xC6B0;</p>
        <p>TRACK : &#xD2B8;&#xB799; &#xC774;&#xB3D9; &#xC131;&#xACF5;&#xD55C; &#xACBD;&#xC6B0;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playlist</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD;&#xD560; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xBA85;</td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />number</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD;&#xD560; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xC758;
        &#xBC88;&#xD638;</td>
    </tr>
    <tr>
      <td style="text-align:left">data</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Play Directive&#xC5D0;&#xC11C; data &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xAC00;
        &#xC874;&#xC7AC;&#xD558;&#xBA74; &#xADF8; object&#xB97C; &#xADF8;&#xB300;&#xB85C;
        &#xBCF4;&#xB0B4;&#xC918;&#xC57C; &#xD568;</td>
    </tr>
  </tbody>
</table>

### PreviousFailed

```text
{
  "header": {
    "namespace": "PreviousFailed",
    "name": "PlayFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>noPreviousPlaylist : &#xB2E4;&#xC74C; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;
          &#xC694;&#xCCAD; &#xC2DC;,</p>
        <p>&#xC7AC;&#xC0DD; &#xAC00;&#xB2A5;&#xD55C; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xAC00;
          &#xC5C6;&#xB294; &#xACBD;&#xC6B0;</p>
        <p>noPreviousTrack : &#xB2E4;&#xC74C; &#xACE1; &#xC694;&#xCCAD; &#xC2DC;,
          &#xC7AC;&#xC0DD; &#xAC00;&#xB2A5;&#xD55C; &#xB2E4;&#xC74C;&#xACE1;&#xC774;
          &#xC5C6;&#xB294; &#xACBD;&#xC6B0;,</p>
        <p>noTargetSong : &#xD50C;&#xB808;&#xC774;&#xC5B4;&#xC5D0; &#xC7AC;&#xC0DD;&#xAC00;&#xB2A5;&#xD55C;
          &#xACE1;&#xC774; &#xC5C6;&#xB294; &#xB300;&#xAE30;&#xC0C1;&#xD0DC;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### NextSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "NextSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### NextSuspended

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "NextSuspended",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "song": "{ #Song object }",
    "target": "{{STRING}}",
    "playlist": {
      "name": "{{STRING}}",
      "number": "{{STRING}}"
    },
    "data": "{ # arbitrary object}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">song</td>
      <td style="text-align:left"><a href="mediaplayer.md#song">Song</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD;&#xD558;&#xB294; &#xACE1; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">target</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>PLAYLIST : &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8; &#xC774;&#xB3D9;
          &#xC131;&#xACF5;&#xD55C; &#xACBD;&#xC6B0;</p>
        <p>TRACK : &#xD2B8;&#xB799; &#xC774;&#xB3D9; &#xC131;&#xACF5;&#xD55C; &#xACBD;&#xC6B0;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">playlist</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD;&#xD560; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xBA85;</td>
    </tr>
    <tr>
      <td style="text-align:left">playlist.
        <br />number</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC7AC;&#xC0DD;&#xD560; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xC758;
        &#xBC88;&#xD638;</td>
    </tr>
    <tr>
      <td style="text-align:left">data</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Play Directive&#xC5D0;&#xC11C; data &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xAC00;
        &#xC874;&#xC7AC;&#xD558;&#xBA74; &#xADF8; object&#xB97C; &#xADF8;&#xB300;&#xB85C;
        &#xBCF4;&#xB0B4;&#xC918;&#xC57C; &#xD568;</td>
    </tr>
  </tbody>
</table>

### NextFailed

```text
{
  "header": {
    "namespace": "NextFailed",
    "name": "PlayFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>noNextPlaylist : &#xB2E4;&#xC74C; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;
          &#xC694;&#xCCAD; &#xC2DC;,</p>
        <p>&#xC7AC;&#xC0DD; &#xAC00;&#xB2A5;&#xD55C; &#xD50C;&#xB808;&#xC774;&#xB9AC;&#xC2A4;&#xD2B8;&#xAC00;
          &#xC5C6;&#xB294; &#xACBD;&#xC6B0;</p>
        <p>noNextTrack : &#xB2E4;&#xC74C; &#xACE1; &#xC694;&#xCCAD; &#xC2DC;, &#xC7AC;&#xC0DD;
          &#xAC00;&#xB2A5;&#xD55C; &#xB2E4;&#xC74C;&#xACE1;&#xC774; &#xC5C6;&#xB294;
          &#xACBD;&#xC6B0;,</p>
        <p>noTargetSong : &#xD50C;&#xB808;&#xC774;&#xC5B4;&#xC5D0; &#xC7AC;&#xC0DD;&#xAC00;&#xB2A5;&#xD55C;
          &#xACE1;&#xC774; &#xC5C6;&#xB294; &#xB300;&#xAE30;&#xC0C1;&#xD0DC;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### MoveSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "MoveSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### MoveFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "MoveFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### PauseSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "PauseSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### PauseFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "PauseFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
        <p>noTargetSong : &#xD50C;&#xB808;&#xC774;&#xC5B4;&#xC5D0; &#xC7AC;&#xC0DD;&#xAC00;&#xB2A5;&#xD55C;
          &#xACE1;&#xC774; &#xC5C6;&#xB294; &#xB300;&#xAE30;&#xC0C1;&#xD0DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### ResumeSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "ResumeSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### ResumeFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "ResumeFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
        <p>noTargetSong : &#xD50C;&#xB808;&#xC774;&#xC5B4;&#xC5D0; &#xC7AC;&#xC0DD;&#xAC00;&#xB2A5;&#xD55C;
          &#xACE1;&#xC774; &#xC5C6;&#xB294; &#xB300;&#xAE30;&#xC0C1;&#xD0DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### RewindSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "RewindSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| message | string | N | 임의의 string으로 특정 정보를 전달하여 Play에서 활용하고자 하는 경우 사용 가능 |

### RewindFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "RewindFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>noTargetSong : &#xD50C;&#xB808;&#xC774;&#xC5B4;&#xC5D0; &#xC7AC;&#xC0DD;&#xAC00;&#xB2A5;&#xD55C;
          &#xACE1;&#xC774; &#xC5C6;&#xB294; &#xB300;&#xAE30;&#xC0C1;&#xD0DC;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### ToggleSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "ToggleSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "message": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">message</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC784;&#xC758;&#xC758; string&#xC73C;&#xB85C; &#xD2B9;&#xC815; &#xC815;&#xBCF4;&#xB97C;
          &#xC804;&#xB2EC;&#xD558;&#xC5EC; Play&#xC5D0;&#xC11C; &#xD65C;&#xC6A9;&#xD558;&#xACE0;&#xC790;
          &#xD558;&#xB294; &#xACBD;&#xC6B0; &#xC0AC;&#xC6A9; &#xAC00;&#xB2A5;</p>
        <p>shuffleOn : &#xC154;&#xD50C; on</p>
        <p>shuffleOff : &#xC154;&#xD50C; of</p>
        <p>repeatSongOn : &#xACE1; &#xBC18;&#xBCF5; on</p>
        <p>repeatAllOn : &#xC804;&#xCCB4; &#xBC18;&#xBCF5; on</p>
        <p>repeatOff : &#xBC18;&#xBCF5; &#xD574;&#xC81C;</p>
        <p>addLikeSong : &#xC88B;&#xC544;&#xC694; &#xCD94;&#xAC00; &#xC131;&#xACF5;</p>
        <p>removeLikeSong : &#xC88B;&#xC544;&#xC694; &#xC81C;&#xAC70; &#xC131;&#xACF5;</p>
      </td>
    </tr>
  </tbody>
</table>

### ToggleFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "ToggleFailed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>addLikeAlreadySong : &#xC774;&#xBBF8; &#xC88B;&#xC544;&#xC694;&#xD55C;
          &#xACE1;&#xC744; &#xC88B;&#xC544;&#xC694; &#xCD94;&#xAC00;</p>
        <p>addLikeExceedSong : &#xC88B;&#xC544;&#xC694; &#xCD5C;&#xB300;&#xB4F1;&#xB85D;
          &#xC218;&#xB7C9; &#xCD08;&#xACFC;</p>
        <p>removeLikeNoSong : &#xC88B;&#xC544;&#xC694; &#xC0C1;&#xD0DC;&#xAC00; &#xC544;&#xB2CC;
          &#xACE1; &#xC88B;&#xC544;&#xC694; &#xD574;&#xC81C; &#xC2DC;&#xB3C4;</p>
        <p>noTargetSong : &#xD50C;&#xB808;&#xC774;&#xC5B4;&#xC5D0; &#xC7AC;&#xC0DD;&#xAC00;&#xB2A5;&#xD55C;
          &#xACE1;&#xC774; &#xC5C6;&#xB294; &#xB300;&#xAE30;&#xC0C1;&#xD0DC;</p>
        <p>requireLogin : &#xB85C;&#xADF8;&#xC778; &#xAE30;&#xB2A5;&#xC774; &#xD544;&#xC218;&#xC778;
          &#xB3D9;&#xC791;&#xC774;&#xB098;, &#xBE44;&#xB85C;&#xADF8;&#xC778;&#xC0C1;&#xD0DC;&#xB85C;
          &#xC778;&#xD55C; &#xC2E4;&#xD328;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

### GetInfoSucceeded

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "GetInfoSucceeded",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "info": {
      "song": "{ #Song name }",
      "issueDate": "{{STRING}}",
      "playTime": "{{STRING}}",
      "playlistName": "{{STRING}}"
    }
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | Directive에서 전달한 token |
| info | object | Y | GetInfo directive에 전달된 "info"의 리스트에 포함된 필드 정보 |

### GetInfoFailed

```text
{
  "header": {
    "namespace": "MediaPlayer",
    "name": "ResponseInfo",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "errorCode": "{{STRING}}"
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
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; token</td>
    </tr>
    <tr>
      <td style="text-align:left">errorCode</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC2E4;&#xD328; &#xC6D0;&#xC778;&#xC744; &#xC758;&#xBBF8;&#xD558;&#xBA70;,
          &#xC5EC;&#xAE30;&#xC5D0; &#xC804;&#xB2EC;&#xD558;&#xB294; string &#xAC12;&#xC744;
          &#xAE30;&#xBC18;&#xC73C;&#xB85C; &#xC751;&#xB2F5; TTS &#xC0DD;&#xC131;</p>
        <p>appInternalServerError : CP&#xC758; &#xB0B4;&#xBD80; &#xC11C;&#xBC84;
          &#xC5F0;&#xB3D9;&#xAC04;&#xC758; &#xC774;&#xC288;&#xB85C; &#xC751;&#xB2F5;&#xC2E4;&#xD328;
          &#xBC1C;&#xC0DD; &#xC2DC;</p>
      </td>
    </tr>
  </tbody>
</table>

