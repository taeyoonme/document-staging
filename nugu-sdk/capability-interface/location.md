---
description: 디바이스 위치 정보를 Play 로 전달하기 위한 규격
---

# Location

## Version

최신 버전은 1.0 입니다.

## SDK Interface

### LocationAgent 사용

Location interface 규격에 따른 디바이스의 동작 제어는 LocationAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 LocationAgent instance 에 접근할 수 있습니다.

```text
val locationAgent = nuguAndroidClient.locationAgent
```
{% endtab %}

{% tab title="iOS" %}
NuguClient instance 를 통해 LocationAgent instance 에 접근할 수 있습니다.

```text
let locationAgent = nuguClient.locationAgent
```
{% endtab %}
{% endtabs %}

### Context 구성

Play 에서 위치 정보 기반의 정보를 제공 받기 위해서는 디바이스의 위치 정보를 [Context](location.md#context) 에 포함시켜 주어야 합니다.

{% tabs %}
{% tab title="Android" %}
LocationProvider 를 추가합니다.

```text
val provider = object: LocationProvider {
    override fun getLocation(): Location? {
        ...
    }
}
locationAgent.setLocationProvider(provider)
```
{% endtab %}

{% tab title="iOS" %}
LocationAgentDelegate 를 추가합니다.

```text
class MyLocationAgentDelegate: LocationAgentDelegate {
    func locationAgentRequestLocationInfo() -> LocationInfo? {
        ...
    }
}
locationAgent.delegate = MyLocationAgentDelegate()
```
{% endtab %}
{% endtabs %}

## Context

```text
{
  "Location": {
    "version": "1.0",
    "current": {
      "latitude": "{{STRING}}",
      "longitude": "{{STRING}}"
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
      <td style="text-align:left">current</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD604;&#xC7AC; &#xC704;&#xCE58;&#xC758; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>current.</p>
        <p>latitude</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC704;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>current.</p>
        <p>longitude</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xACBD;&#xB3C4;</td>
    </tr>
  </tbody>
</table>

