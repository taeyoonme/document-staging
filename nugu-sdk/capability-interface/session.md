---
description: Play 와 Client 간의 세션을 유지하기 위한 규격
---

# Session

## Version

최신 버전은 1.0 입니다.

## SDK Interface

### 세션 상태 정보

세션 유지상태 정보를 확인할 수 있습니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/dialog/DialogUXStateAggregatorInterface.kt#L64)

[iOS reference](https://github.com/nugu-developers/nugu-ios/blob/master/NuguClientKit/Sources/Business/DialogStateDelegate.swift#L30)

## Context

```text
{
  "Session": {
    "version": "1.1",
    "list": [
      {
        "sessionId": "{{STRING}}",
        "playServiceId": "{{STRING}}"
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
      <td style="text-align:left">list</td>
      <td style="text-align:left">Array</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD604;&#xC7AC; &#xD65C;&#xC131;&#xD654; &#xB418;&#xC5B4; &#xC788;&#xB294;
        &#xC138;&#xC158; &#xB9AC;&#xC2A4;&#xD2B8;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>list.</p>
        <p>sessionId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>list.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>

## Directives

### Set

```text
{
  "Session": {
    "namespace": "Session",
    "name": "Set",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "sessionId": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| sessionId | string | Y | \*\*\*\* |

