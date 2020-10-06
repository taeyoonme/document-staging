---
description: 음악 앱을 제어하기 위한 규격
---

# MediaPlaer

## Version

최신 버전은 1.0 입니다.

## SDK Interface

### MediaPlayerAgent 사용

MediaPlayer interface 규격에 따른 디바이스의 동작 제어는 MediaAgent 가 처리합니다.

{% tabs %}
{% tab title="Android" %}
NuguAndroidClient instance 를 통해 MediaPlayerAgent instance 에 접근할 수 있습니다.

```text
val mediaPlayerAgent = nuguAndroidClient.mediaPlayerAgent
```
{% endtab %}

{% tab title="Second Tab" %}

{% endtab %}
{% endtabs %}























