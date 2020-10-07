---
description: 보이스 크롬에 노출되는 발화 가이드를 제공하기 위한 규격
---

# Chips

## Version

최신 버전은 1.1 입니다.

## SDK Interface

### ChipsAgent 사용

Chips interface 규격에 따른 디바이스의 동작 제어는 ChipsAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 ChipsAgent instance 에 접근할 수 있습니다.

```text
val chipsAgent = nuguAndroidClient.getAgent(ChipsAgent.NAMESPACE)
```

보이스 크롬 UI 구성을 위해 TTS interface, ASR interface, Chips interface, Session interface 를 병합해주는 DialogUXStateAggregator 를 제공합니다.
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 ChipsAgent instance 에 접근할 수 있습니다.

```text
let chipsAgent = nuguClient.chipsAgent
```

보이스 크롬 UI 구성을 위해 TTS interface, ASR interface, Chips interface, Session interface 를 병합해주는 DisplayAggregatorInterface 를 제공합니다.

NuguClient instance 를 통해 DialogStateAggregator instance 에 접근할 수 있습니다.

```text
let dialogStateAggregator = nuguClient.dialogStateAggregator
```
{% endtab %}
{% endtabs %}

### UI 구성

보이스 크롬에 노출하기 위한 데이터는 Render directive 에 포함되어 전달됩니다.

{% tabs %}
{% tab title="Android" %}
발화 가이드를 전달 받으려면 DialogUXStateAggregatorInterface.Listener 를 추가합니다.

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
발화 가이드를 전달 받으려면 DialogStateDelegate 를 추가합니다.

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
  "Chips": {
    "version": "1.1"
  }
}
```

## Directives

### Render

```text
{
  "header": {
    "namespace": "Chips",
    "name": "Render",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.1"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "target": "{{STRING}}",
    "chips": [
      {
        "type": "{{STRING}}",
        "text": "{{STRING}}",
        "token": "{{STRING}}"
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
      <td style="text-align:left">target</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p><b>DM</b>
        </p>
        <ul>
          <li><b>ASR.ExpectSpeech, Session.Set &#xC640; &#xAC19;&#xC774; &#xC804;&#xB2EC;&#xB418;&#xB294; &#xBC1C;&#xD654;&#xAC00;&#xC774;&#xB4DC;</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">chips</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBC1C;&#xD654; &#xAC00;&#xC774;&#xB4DC; &#xBAA9;&#xB85D;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>chips.</p>
        <p>type</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>ACTION, GENERAL</p>
        <p>ACTION: &#xBCF4;&#xC774;&#xC2A4;&#xD06C;&#xB86C; &#xAC00;&#xC774;&#xB4DC;&#xC758;
          &apos;&#xC561;&#xC158;&#xBC84;&#xD2BC;&apos;&#xC73C;&#xB85C; &#xAE30;&#xB2A5;
          &#xB2E8;&#xC704;&#xC758; &#xB3D9;&#xC791; &#xCC98;&#xB9AC;&#xB97C; &#xC704;&#xD55C;
          &#xBC1C;&#xD654; &#xAC00;&#xC774;&#xB4DC;.</p>
        <p>GENERAL: &#xAE30;&#xBCF8; &#xBC1C;&#xD654; &#xAC00;&#xC774;&#xB4DC;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>chips.</p>
        <p>text</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xBC84;&#xD2BC; &#xD14D;&#xC2A4;&#xD2B8;</p>
        <ul>
          <li>Text.TextInput event &#xB97C; &#xBCF4;&#xB0B4;&#xAE30; &#xC704;&#xD55C;
            &#xD14D;&#xC2A4;&#xD2B8; &#xBA85;&#xB839; &#xBB38;&#xC790;&#xC5F4;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>chips.</p>
        <p>token</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Text.TextInput event &#xC758; &#xCD9C;&#xCC98;&#xB97C; &#xAD6C;&#xBD84;&#xD558;&#xAE30;
        &#xC704;&#xD55C; &#xAC12;</td>
    </tr>
  </tbody>
</table>

