---
description: Play 와 Client 간의 세션을 유지하기 위한 규격
---

# Session

## Version

최신 버전은 1.0 입니다.

## SDK Interface

#### SessionAgent 사용

Session interface 규격에 따른 디바이스의 동작 제어는 SessionAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 SessionAgent instance 에 접근할 수 있습니다.

```text
val sessionAgent = nuguAndroidClient.getAgent(DefaultSoundAgent.NAMESPACE)
```

보이스 크롬 UI 구성을 위해 TTS interface, ASR interface, Chips interface, Session interface 를 병합해주는 DialogUXStateAggregator 를 제공합니다.
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 SessionAgent instance 에 접근할 수 있습니다.

```text
let sessionAgent = nuguClient.sessionAgent
```

보이스 크롬 UI 구성을 위해 TTS interface, ASR interface, Chips interface, Session interface 를 병합해주는 DisplayStateAggregator 를 제공합니다.

NuguClient instance 를 통해 DialogStateAggregator instance 에 접근할 수 있습니다.

```text
let dialogStateAggregator = nuguClient.dialogStateAggregator
```
{% endtab %}
{% endtabs %}

### 세션 상태 정보

세션 유지상태 정보를 확인할 수 있습니다.

{% tabs %}
{% tab title="Android" %}
DialogUXStateAggregatorInterface.Listener 를 추가합니다.

```text
val listener = object: DialogUXStateAggregatorInterface.Listener {
    override fun onDialogUXStateChanged(newState: DialogUXState, dialogMode: Boolean, chips: RenderDirective.Payload?, sessionActivated: Boolean) {
        ...
    }
}
nuguAndroidClient.addDialogUXStateListener(listener)
```
{% endtab %}

{% tab title="iOS" %}
DialogStateDelegate 를 추가합니다.

```text
class MyDialogStateDelegate: DialogStateDelegate {
    func dialogStateDidChange(_ state: DialogState, isMultiturn: Bool, chips: [ChipsAgentItem.Chip]?, sessionActivated: Bool) {
        ...
    }
}
dialogStateAggregator.add(delegate: MyDialogStateDelegate())
```
{% endtab %}
{% endtabs %}

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

