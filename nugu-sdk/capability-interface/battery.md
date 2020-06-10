---
description: 디바이스 배터리 정보를 Play 로 전달하기 위한 규격
---

# Battery

## Version

최신 버전은 1.1 입니다.

## SDK Interface

### Context 구성

디바이스 배터리 정보를 [Context](battery.md#context) 에 포함시켜 주어야 합니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/battery/BatteryStatusProvider.kt#L21)

## Context

```text
{
  "Location": {
    "version": "1.1",
    "level": {{LONG}},
    "charging": {{BOOLEAN}},
    "approximateLevel": {{BOOLEAN}}
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
      <td style="text-align:left">level</td>
      <td style="text-align:left">Long</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC30;&#xD130;&#xB9AC; &#xC794;&#xB7C9;(0 ~ 100)</td>
    </tr>
    <tr>
      <td style="text-align:left">charging</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xCDA9;&#xC804; &#xC5EC;&#xBD80;</td>
    </tr>
    <tr>
      <td style="text-align:left">approximateLevel</td>
      <td style="text-align:left">boolean</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBC30;&#xD130;&#xB9AC; &#xC794;&#xB7C9;&#xC758; &#xADFC;&#xC0AC;&#xCE58;
          &#xC5EC;&#xBD80;</p>
        <p>( &#xC77C;&#xBD80; &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC758; &#xACBD;&#xC6B0;
          &#xC815;&#xD655;&#xD55C; &#xBC30;&#xD130;&#xB9AC; &#xC794;&#xB7C9;&#xC744;
          &#xCE21;&#xC815;&#xD560; &#xC218; &#xC5C6;&#xC74C;)</p>
      </td>
    </tr>
  </tbody>
</table>

