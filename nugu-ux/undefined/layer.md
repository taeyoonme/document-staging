# Layer 정책

NUGU 서비스가 수행하는 동작은 몇 가지 유형\(layer\)으로 나뉠 수 있으며, 특정 유형의 동작 수행 중 다른 유형의 동작이 실행될 경우, 동작 방식에 대한 정책을 NUGU layer 정책이라고 합니다.  

  
NUGU 서비스 Layer 정의는 다음과 같습니다.

| 정의 | 예시 |  |
| :--- | :--- | :--- |
| Alert | 특정 조건 부합 시 NUGU agent가 스스로 깨어나 알를 제공하고 있는 상태 | Alert: 알람 울림 / 타이머 울림 / Notification 울림 |
| Call \(In-call\) | 통화 중 상태 | 통화 상대와 대화 중 |
| Call \(Incoming call\) | 전화 수신 중 상태 | 전화수신음 표출 |
| Call \(Outgoing call\) | 전화 발신 중 상태 | 전화 발신음 표출 |
| Information | TTS로 정보를 제공하고 있는 상태 | 날씨/운세 등의 서비스에서 TTS로 정보를 제공 |
| Media | Streaming으로 미디어를 재생하고 있는 상태 | FLO/멜론/ASMR/라디오/오디오북/팟빵/뉴스 등의 서비스에서 미디어 재생하는 동작 |



- Alert 동작 중 다른 명령이 발화될 경우, Alert 종료 \(wake-up word 발화 시 알람음 mute 후 명령이 완료된 시점에 alert  종료\)

- Alert 동작 중 하드웨어 버튼 클릭 시 alert 종료

- Info. 동작 중 다른 명령이 발화될 경우, Info. 종료

- Media 동작 중 다른 명령이 발화될 경우, Media pause 상태에서 해당 동작 실행 후 Media resume

스피커 layer

![](../../.gitbook/assets/image.png)

NU300 layer

![](../../.gitbook/assets/image%20%286%29.png)

Btv layer 정

![](../../.gitbook/assets/image%20%2811%29.png)

T map layer 정

![](../../.gitbook/assets/image%20%283%29.png)

