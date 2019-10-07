# Voice Chrome

화면이 있는 기기는 NUGU Voice chrome을 표현해야 합니다.  
NUGU Voice chrome은 사용자의 음성 입력 수신, NUGU 음성 출력 등 NUGU 음성 동작과 관련된 상태를 버튼 및 그래픽과 색상으로 표현합니다.  
Voice chrome 외에 디스플레이 기능을 추가하기 위해 LED를 사용할 수도 있습니다.

## **NUGU Voice Chrome Color**

| Color | RGB | CMYK | Pantone |
| :--- | :--- | :--- | :--- |
| ![](../../.gitbook/assets/color_nugublue.png) NUGU Blue | 0,158, 255 \(\#009DFF\) | 85, 21, 0, 0 | 2925C |
| ![](../../.gitbook/assets/color_green.png) Green | 0, 230, 136 \(\#00E688\) | 48, 0, 45, 0 | 2412C |
| ![](../../.gitbook/assets/color_red.png) Red | 255, 58, 0 \(\#FF3A00\) | 0, 77, 100, 0 | 1655C |
| ![](../../.gitbook/assets/color_white.png) White | 255, 255, 255 \(\#FFFFFF\) | 0, 0, 0, 0 |  |

## **NUGU Voice Chrome State**

NUGU Voice chrome은 구분된 상태에 따라 표현이 달라집니다.  
Idle 상태는 Floating Action Button을 사용하고, 나머지 상태는 그래픽 애니메이션으로 표현합니다.  
Idle 상태의 버튼은 '**NUGU Voice button**'이며, 상태 그래픽은 '**Chrome indicator**'라고 말합니다.  
기기에 wake-up 버튼이 탑재해 있을 경우 NUGU Voice button은 미노출도 허용합니다.

| **State** | **동작** | **설명** |
| :--- | :--- | :--- |
| **Idle** |  ![](../../.gitbook/assets/00-idle%20%282%29.png) | Wake-up 가능한 대기 상태 |
| **Listening-Passive** |  ![](../../.gitbook/assets/01-listening-passive_128.gif) | 사용자 발화 입력 대기 상태 |
| **Listening-Active** |  ![](../../.gitbook/assets/02-listening-active_128.gif)  | 사용자 발화 입력 중 상태 |
| **Processing** |  ![](../../.gitbook/assets/03-processing_128.gif)  | 입력된 사용자 발화를 분석하는 상태 |
| **Speaking** | ![](../../.gitbook/assets/04-speaking_128.gif)  | 정보/동작에 대해서 TTS 답변하는 상태 |
| **Speaking-Error** | ![](../../.gitbook/assets/05-speaking-error_128.gif) | 에러로 인하여 정상 동작, 답변을 할 수 없는 상태 |

\[동작설명\]

* 사용자가 호출어를 부르거나 Idle 버튼을 눌러 클라이언트가 **사용자 발화 입력 대기 모드**로 진입하면 **Listening-Passive** 동작을 재생합니다.  \(사용자가 호출어를 부르는 동작만 수행하는 기기에는 Idle 버튼을 표시하지 않을 수도 있습니다.\)
* **Listening-Passive** 동작을 사용자의 실제 음성 입력이 시작되기 전까지 반복 재생합니다.
* 사용자의 실제 음성이 입력되기 시작하여 클라이언트가 **사용자 발화 입력 중** 모드로 진입하면 사용자의 음성 입력이 끝날 때까지 **Listening-Active** 동작을 반복 재생합니다.
* 사용자의 입력이 끝나고 클라이언트가 **입력된 사용자 발화를 분석하는 상태**로 진입하면 응답을 출력하거나 결과 화면을 보여주기 전까지 **Processing** 동작을 반복 재생합니다.
* 응답\(TTS\)을 출력할 때는 **Speaking** 동작을 TTS가 종료될 때까지 반복 재생합니다.  Speaking 및 Speaking-Error 상태 그래픽은 TTS로만 안내되는 경우에는 표출하지 않을 수 있습니다. 
* 사용자 요청에 대해 필요한 작업을 모두 수행하면 클라이언트가 **Idle** 상태로 진입하게 됩니다.

## **NUGU Voice Button**

NUGU Voice button은 음성 인풋이 가능한 대기 상태를 나타내는 버튼입니다.   
NUGU Voice chrome 상태 중에 Idle 상태에 적용되며, Floating Action Button\(FAB\) 타입으로 사용하는 것을 권장합니다.   
NUGU Voice button은 NUGU mic icon과 NUGU logo가 필수적으로 적용되어야 합니다. Container 사용을 권장하며, container 위에 NUGU mic icon과 NUGU logo의 위치는 가이드를 준수합니다.  

![](../../.gitbook/assets/fab%20%281%29.png)

## **NUGU Voice chrome 위치**

NUGU Voice button과 chrome indicator의 위치 기기의 화면 크기에 및 방향에 따라서 다르게 적용됩니다.

| Portrait | Landscape |
| :--- | :--- |
|  ![](../../.gitbook/assets/portrait.png)  | ![](../../.gitbook/assets/landscape.png)  |

