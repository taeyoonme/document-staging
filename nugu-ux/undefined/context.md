# Context 유지 정책

정

info. 및 media layer 동작 후 해당 layer\(play명\)을 일정 시간 동안 저장\(유지\)하고, 해당 시간 내에 발화된 명령이 저장된 play에서 지원하는 명령이면 해당 play로 routing하는 정책

![](../../.gitbook/assets/image%20%289%29.png)

Context 구

Context는 Sound Context와 Display Context로 나뉨 스피커\(예:NU100\)에서는 Sound Context만 관리 Display가 있는 디바이스\(예:NU300\)에서는 Sound Context와 Display Context를 구분해서 관리

![](../../.gitbook/assets/image%20%2811%29.png)



![](../../.gitbook/assets/image%20%2812%29.png)

Context별 유지 시간

-Sound Context : TTS 종료 후 7초-Display Context : TTS 종료 후 7초\(Default display\)이나, 더 긴 시간을 유지하도록 지정 가능함 \(Medium display- 15초, Long display- 30초, Longest display- 10분\)

    : Medium/Long display 적용 case – TTS는 간략하게 제공하고 상세 정보를 화면으로 제공 하는 경우

    : Longest display 적용 case – 특정 모드로 진입하여 여러 목록상에서 선택해야 하는 경우\(예: setting drawer, 게임 목록 리스트\)

-   Sound와 Display Context 중 하나라도 있으면 최종 Context는 유지함

![](../../.gitbook/assets/image%20%288%29.png)



Layer별 Context 유지 정책 \(Single layer\)

![](../../.gitbook/assets/image%20%287%29.png)





Single layer : 대기상태에서 하나의 layer가 실행되는 경우

 Call layer : Call state가 idle이 아닌 상태 

Alert layer : Alert state가 idle이 아닌 상태 Info. layer : TTS가 재생 중인 상태 

Media layer : Streaming media가 재생 중인 상태

* 정지 계열 명령 : stop, cancel, close, turn\_off, reject 등 \(Context가 유지된 play에서 지원하지 않는 intent여서, general play로 routing된 경우\)

  정지 계열 명령의 판단은 클라이언트에서 하지 않음 

  General Play에서 정지 계열 명령 여부를 판단하여 클라이언트에 context를 유지 않지 않도록 response 보내서 처리함

* 화면 터치 동작 유형에 따라 TTS 중지 여부 구분 

  TTS 안내 중 Tab\(화면을 짧게 누르는 동작\)시에는 TTS를 중지

  TTS 안내 중 Tab이외의 모든 화면 터치 동작\(swipe, scroll, long press 등\) 시에는 TTS를 중지하지 않음



Multi-layer :실행 중인 layer를 일시정지한 상태에서 다른 layer가 실행되는 경우-

Multi-layer에서는 Info. layer의 Sound context 유지 없음

   \(info. layer의 TTS가 완료/중지된 경우에는 media를 바로 이어 재생함\)



![](../../.gitbook/assets/image%20%282%29.png)



Context 유지 상태에서 들어온 명령에 대한 play routing 정책

- 해당 명령을 지원하는 Context가 한 개인 경우

      :  해당 play로 routing 함

  - 해당 명령을 지원하는 Context가 여러 개인 경우

      : Display와 Sound Context인 경우 Display Context를 우선하며, 이외의 경우 가장 최신 Context로 routing 됨

![](../../.gitbook/assets/image%20%281%29.png)



![](../../.gitbook/assets/image%20%286%29.png)



