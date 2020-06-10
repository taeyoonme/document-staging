---
description: 디바이스의 볼륨을 제어하기 위한 규격
---

# Speaker

## Version

최신 버전은 1.0 입니다.

## SDK Interface

### Context 구성

디바이스의 볼륨 상태를 [Context](speaker.md#context) 에 포함시켜 주어야 합니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/speaker/Speaker.kt#L23)

### 볼륨 제어

디바이스의 볼륨 제어가 [SetVolume](speaker.md#setvolume) directive 로 요청될 수 있습니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/speaker/Speaker.kt#L58)

### 음소거 제어

디바이스의 볼륨 음소거 제어가 [SetMute](speaker.md#setmute) directive 로 요청될 수 있습니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/speaker/Speaker.kt#L66)



## Context

```text
{
  "Speaker": {
    "version": "1.0",
    "volumes": [
      {
        "name": "{{STRING}}",
        "volume": {{LONG}},
        "minVolume": {{LONG}},
        "maxVolume": {{LONG}},
        "defaultVolumeStep": {{LONG}},
        "muted": {{BOOLEAN}}
      }
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
      <td style="text-align:left">volumes</td>
      <td style="text-align:left">object array</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>-. <b>NUGU, CALL, ALARM</b>
        </p>
        <ul>
          <li>3&#xAC1C;&#xC758; &#xACE0;&#xC815;&#xAC12;&#xB9CC;&#xC744; &#xC0AC;&#xC6A9;</li>
          <li>&#xB514;&#xBC14;&#xC774;&#xC2A4; &#xAC1C;&#xBC1C; &#xC2DC; NUGU&#xB294;
            &#xD544;&#xC218; &#xC9C0;&#xC6D0; &#xAC12;</li>
          <li>&#xC9C0;&#xC6D0;&#xD558;&#xC9C0; &#xC54A;&#xB294; name&#xC740; NUGU&#xC640;
            &#xD1B5;&#xD569;&#xD558;&#xBA74; &#xB428;</li>
          <li>ex) CALL &#xC124;&#xC815;&#xC744; &#xC9C0;&#xC6D0;&#xD558;&#xC9C0; &#xC54A;&#xC73C;&#xBA74;
            NUGU, ALARM&#xB9CC; &#xC874;&#xC7AC;</li>
        </ul>
        <p>-. NUGU = Media, TTS</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />volume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xD604;&#xC7AC; &#xC124;&#xC815;&#xB41C; &#xBCFC;&#xB968;
        <br />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />minVolume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xC124;&#xC815; &#xAC00;&#xB2A5;&#xD55C; &#xCD5C;&#xB300; &#xBCFC;&#xB968;
        <br
        />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />maxVolume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xC124;&#xC815; &#xAC00;&#xB2A5;&#xD55C; &#xCD5C;&#xC18C; &#xBCFC;&#xB968;
        <br
        />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />defaultVolumeStep</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xAE30;&#xBCF8; &#xBCFC;&#xB968; &#xB2E8;&#xACC4;
        <br />-. &#xBCFC;&#xB968; &#xC870;&#xC808; &#xBD88;&#xAC00;&#xD55C; &#xACBD;&#xC6B0;&#xB294;
        &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
    <tr>
      <td style="text-align:left">volumes.
        <br />muted</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">-. &#xC74C;&#xC18C;&#xAC70; &#xC0C1;&#xD0DC;
        <br />-. &#xC74C;&#xC18C;&#xAC70; &#xC124;&#xC815;&#xC774; &#xBD88;&#xAC00;&#xD55C;
        &#xACBD;&#xC6B0;&#xB294; &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</td>
    </tr>
  </tbody>
</table>

## Directive

### SetVolume

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetVolume",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "rate": "{{STRING}}",
    "volumes": [
      {
        "name": "{{STRING}}",
        "volume": {{LONG}}
      }
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
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Context &#xCC38;&#xC870;</td>
    </tr>
    <tr>
      <td style="text-align:left">rate</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p><b>SLOW, FAST</b>
        </p>
        <ul>
          <li>SLOW - &#xC810;&#xC9C4;&#xC801;&#xC73C;&#xB85C; &#xBCC0;&#xACBD; (max
            &#xAC12;&#xC73C;&#xB85C; &#xC124;&#xC815;&#xD558;&#xB294; &#xC2DC;&#xB098;&#xB9AC;&#xC624;&#xC5D0;&#xC11C;
            &#xC0AC;&#xC6A9;)</li>
          <li>FAST - &#xBC14;&#xB85C; &#xBCC0;&#xACBD;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">volume</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC124;&#xC815;&#xD560; volume</td>
    </tr>
  </tbody>
</table>

### SetMute

```text
{
  "header": {
    "namespace": "Speaker",
    "name": "SetVolume",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "rate": "{{STRING}}",
    "volumes": [
      {
        "name": "{{STRING}}",
        "mute": {{BOOLEAN}}
      }
    ]
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| name | string | Y | Context 참조 |
| mute | boolean | Y | true / false |

