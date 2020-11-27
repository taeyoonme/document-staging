# Capability Interface

## Capability Interface

Capability Interface 는 Play 에서 디바이스의 기능을 제어하기 위한 규격으로 Event, Directive, Context 등으로 구성되어 있으며, Play 에서 제공하려는 기능에 따라 여러개의 Capability Interface 를 조합하여 디바이스로 전달할 수 있습니다.

### 공통 파라미터

Capability Interface 규격에서 공통적으로 사용되는 파라미터입니다.

* namespace: Capability Interface 의 이름입니다.
* name: Directive 또는 Event 의 이름입니다.
* messageId: 하나의 Directive 또는 Event 를 구분하기 위한 id 입니다.
* dialogRequestId: Event 와 Directive 를 mapping 하기 위한 id 입니다. 하나의 요청\(Event\) 과 응답\(Directive\) 은 동일한 dialogRequestId 를 가집니다.
* playServiceId: Play 의 고유 id 값입니다. Directive 또는 Event 에 포함되어 있습니다.
* version: Capability Interface 의 버전입니다.

## Capability Agent

Capability Interface 의 규격에서 정의하는 기능을 제공하기 위해 Capability Interface 와 1:1 로 매핑되는 Capability Agent 가 구현되어 있습니다.

Capability Agent 에서 미디어 재생과 같은 기능은 직접 실행하지만, UI 구성과 같이 직접 실행할 수 없는 기능을 Application 에 위임합니다.

## Event

디바이스에서 서버로 전달되는 JSON 형식의 데이터로 JSON 구조는 각 각의 Capability Interface 에 정의되어 있습니다.

## Directive

서버에서 디바이스로 전달되는 JSON 형식의 데이터로 JSON 구조는 각 각의 Capability Interface 에 정의되어 있습니다.

Event 요청에 대한 응답값으로 1개 이상의 Directive 가 전달됩니다.

## Context

Capability Agent 의 현재 상태를 의미하는 데이터로 Event 와 함께 서버로 전달됩니다.

### 구조

```text
{
  "supportedInterfaces": {
    "{{STRING}}": {}
  },
  "client": {
    "os": "{{STRING}}",
    "wakeupWord": "{{STRING}}",
    "playStack": [
      "{{STRING}}"
    ]
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
      <td style="text-align:left">supportedIntefacaces</td>
      <td style="text-align:left">map</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Capability interface &#xC758; Context &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>supportedIntefacaces.</p>
        <p>key</p>
      </td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Capability interface &#xC758; &#xC774;&#xB984;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>supportedIntefacaces.</p>
        <p>value</p>
      </td>
      <td style="text-align:left">Object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Capability interface &#xC758; Context</td>
    </tr>
    <tr>
      <td style="text-align:left">client</td>
      <td style="text-align:left">map</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD074;&#xB77C;&#xC774;&#xC5B8;&#xD2B8;&#xC758; &#xCEE8;&#xD14D;&#xC2A4;&#xD2B8;
        &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">client.os</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Android, iOS, Linux</td>
    </tr>
    <tr>
      <td style="text-align:left">client.wakeupWord</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC544;&#xB9AC;&#xC544;, &#xD305;&#xCEE4;&#xBCA8;</p>
        <p>&#xD074;&#xB77C;&#xC774;&#xC5B8;&#xD2B8;&#xC5D0; &#xC124;&#xC815;&#xB41C;
          wakeup word</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">client.playStack</td>
      <td style="text-align:left">Array&lt;String&gt;</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD074;&#xB77C;&#xC774;&#xC5B8;&#xD2B8;&#xC5D0;&#xC11C; &#xC2E4;&#xD589;&#xC911;&#xC778;
        playServiceId &#xBAA9;&#xB85D;</td>
    </tr>
  </tbody>
</table>

### supportedInterfaces 전송 규칙

* ASR.Recognize, Text.TextInput, System.SynchronizeState, Display.ElementSelected event
  * 전체 capability interface 의 context
* 그 외 event
  * 해당 capability interface 의 context
  * 다른 capability interface 의 context 중 version 만 포함

## Platform 에 따른 지원 현황

2020-11-26 기준

<table>
  <thead>
    <tr>
      <th style="text-align:left">Capability interface</th>
      <th style="text-align:left">Description</th>
      <th style="text-align:left">Android</th>
      <th style="text-align:left">iOS</th>
      <th style="text-align:left">Linux</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">AudioPlayer</td>
      <td style="text-align:left">&#xC74C;&#xC545; &#xC7AC;&#xC0DD;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Display</td>
      <td style="text-align:left">UI template data &#xC81C;&#xACF5;</td>
      <td style="text-align:left">&#xC9C0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xCD94;&#xD6C4; &#xC9C0;&#xC6D0; &#xC608;&#xC815;</td>
    </tr>
    <tr>
      <td style="text-align:left">System</td>
      <td style="text-align:left">
        <p>&#xB514;&#xBC14;&#xC774;&#xC2A4; &#xC804;&#xC6D0; &#xC81C;&#xC5B4;</p>
        <p>&#xB124;&#xD2B8;&#xC6CC;&#xD06C; &#xC5F0;&#xACB0; &#xC81C;&#xC5B4;</p>
      </td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">
        <p>&#xC77C;&#xBD80;&#xC9C0;&#xC6D0;</p>
        <ul>
          <li>
            <p>&#xB514;&#xBC14;&#xC774;&#xC2A4; &#xC804;&#xC6D0; &#xC81C;&#xC5B4;&#xB294;</p>
            <p>&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</p>
          </li>
        </ul>
      </td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">TTS</td>
      <td style="text-align:left">TTS &#xC7AC;&#xC0DD;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">ASR</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790; &#xC74C;&#xC131; &#xC778;&#xC2DD;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Text</td>
      <td style="text-align:left">&#xD14D;&#xC2A4;&#xD2B8; &#xBA85;&#xB839; &#xC218;&#xD589;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Location</td>
      <td style="text-align:left">&#xC704;&#xCE58; &#xC815;&#xBCF4; &#xC218;&#xC9D1;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Extension</td>
      <td style="text-align:left">&#xD655;&#xC7A5; &#xAE30;&#xB2A5; &#xC218;&#xD589;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Speaker</td>
      <td style="text-align:left">&#xBCFC;&#xB968; &#xC81C;&#xC5B4;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</td>
      <td
      style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Bluetooth</td>
      <td style="text-align:left">&#xBE14;&#xB8E8;&#xD22C;&#xC2A4; &#xC81C;&#xC5B4;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</td>
      <td
      style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Mic</td>
      <td style="text-align:left">&#xB9C8;&#xC774;&#xD06C; &#xC7A5;&#xCE58; &#xC81C;&#xC5B4;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</td>
      <td
      style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Screen</td>
      <td style="text-align:left">&#xB514;&#xC2A4;&#xD50C;&#xB808;&#xC774; &#xC7A5;&#xCE58; &#xC81C;&#xC5B4;</td>
      <td
      style="text-align:left">&#xC9C0;&#xC6D0;</td>
        <td style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</td>
        <td
        style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xD2B9;&#xC131;&#xC0C1; &#xBBF8;&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Battery</td>
      <td style="text-align:left">&#xBC30;&#xD130;&#xB9AC; &#xC815;&#xBCF4; &#xC218;&#xC9D1;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xCD94;&#xD6C4; &#xC9C0;&#xC6D0; &#xC608;&#xC815;</td>
      <td style="text-align:left">&#xBBF8;&#xC9C0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Sound</td>
      <td style="text-align:left">Beep &#xC74C; &#xC7AC;&#xC0DD;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Chips</td>
      <td style="text-align:left">&#xBC1C;&#xD654; &#xAC00;&#xC774;&#xB4DC; &#xC81C;&#xACF5;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xCD94;&#xD6C4; &#xC9C0;&#xC6D0; &#xC608;&#xC815;</td>
    </tr>
    <tr>
      <td style="text-align:left">Session</td>
      <td style="text-align:left">&#xC74C;&#xC131; &#xC778;&#xC2DD; &#xC138;&#xC158; &#xC81C;&#xC5B4;</td>
      <td
      style="text-align:left">&#xC9C0;&#xC6D0;</td>
        <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
        <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">PhoneCall</td>
      <td style="text-align:left">&#xD1B5;&#xD654; &#xAE30;&#xB2A5; &#xC81C;&#xC5B4;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xBBF8;&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">Message</td>
      <td style="text-align:left">&#xBB38;&#xC790; &#xAE30;&#xB2A5; &#xC81C;&#xC5B4;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xCD94;&#xD6C4; &#xC9C0;&#xC6D0; &#xC608;&#xC815;</td>
      <td style="text-align:left">&#xBBF8;&#xC9C0;&#xC6D0;</td>
    </tr>
    <tr>
      <td style="text-align:left">MediaPlayer</td>
      <td style="text-align:left">&#xC74C;&#xC545; &#xC571; &#xC81C;&#xC5B4;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xC9C0;&#xC6D0;</td>
      <td style="text-align:left">&#xBBF8;&#xC9C0;&#xC6D0;</td>
    </tr>
  </tbody>
</table>

