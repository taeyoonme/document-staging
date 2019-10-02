# NUGU Device

NUGU 에이전트를 탑재한 기기의 상태에 따른 동작, 제공하는 물리적 버튼, 조명, 소리에 대한 가이드는 다음과 같습니다.

## Device States

NUGU 서비스와 관련한 기기의 상태에 대한 정의는 다음과 같습니다.

#### **음소거 \(Mute\)**

기기의 소리가 출력되지 않는 상태입니다. 음소거 상태는 기기의 비프음이나 사운드, Prompt 등 기기에서 제공하는 모든 소리에 적용이 됩니다. 따라서 음소거 상태일 때는 speaking 또는 playing 상태가 되었을 때 Prompt나 사운드, 비프음을 볼륨 레벨 0으로 출력합니다. 단, alert형 안내\(알람 울림, 타이머 울림, Notification 울림, 전화벨 울림\)가 실행될 때는 음소거 상태일지라로 원래 음량으로 실행됩니다.

#### \*\*\*\*

#### **마이크 켜짐/꺼짐 \(Microphone on/off\)**

NUGU 디바이스의 음성인식 마이크가 꺼져 있는 상태로, 이 상태에서는 음성으로 에이전트를 wake up할 수 없습니다. 마이크가 꺼져 있는 상태에서 wake-up 버튼을 누를 경우, 마이크가 켜지고 listening - passive 상태로 변경됩니다. 한번 마이크가 켜지면 해당 상태는 유지됩니다.

#### \*\*\*\*

#### **야간 모드 \(Night mode\)**

디스플레이가 있는 디바이스에서 전원 절약을 위하 스크린 표시가 최소화된 상태입니다.

#### \*\*\*\*

#### **화면 켜짐/꺼짐 \(Screen on/off\)**

디스플레이가 있는 디바이스에서 화면이 켜져있거나 꺼져있는 상태입니다.

#### \*\*\*\*

#### **무드등 켜짐/꺼짐 \(Moodlight on/off\)**

조명 기능이 있는 디바이스에서 조명이 켜져있거나 꺼져있는 상태입니다.

#### \*\*\*\*

#### **네트워크 미연결 \(Disconnected network\)**

기기가 네트워크에 연결되지 않은 상태를 말합니다. 이 상태에서는 wake up시 곧바로 네트워크가 연결되어 있지 않음을 알려주는 Prompt를 제공합니다.

#### \*\*\*\*

#### **초기 기기 상태**

NUGU 기기의 초기 상태는 다음과 같습니다. 

마이크\(Microphone\) on / 와이파이 on / 블루투스 off / 볼륨 unmute / 무드등 off

## 버튼

NUGU 기기에서 제공하는 물리적 버튼들은 다음과 같습니다. 기기에 따라 제공되지 않거나 추가적인 버튼이 제공될 수 있습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xBC84;&#xD2BC; &#xC720;</b>
      </th>
      <th style="text-align:left">&#xAE30;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><b>&#xC804;&#xC6D0; &#xBC84;&#xD2BC;</b>
      </td>
      <td style="text-align:left">
        <p>&#xAE30;&#xAE30;&#xC758; &#xC804;&#xC6D0;&#xC744; &#xCF1C;&#xAC70;&#xB098;
          &#xB055;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC758;&#xB3C4;&#xCE58; &#xC54A;&#xAC8C; &#xB3D9;&#xC791;&#xB418;&#xB294;
          &#xAC83;&#xC744; &#xB9C9;&#xAE30; &#xC704;&#xD574; 3&#xCD08; &#xC774;&#xC0C1;
          &#xAE38;&#xAC8C; &#xB20C;&#xB7EC; &#xB3D9;&#xC791;&#xD558;&#xB3C4;&#xB85D;
          &#xD569;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xD638;&#xCD9C; &#xBC84;&#xD2BC;</b>
      </td>
      <td style="text-align:left">
        <p>&#xD638;&#xCD9C;&#xC5B4;&#xB97C; &#xB9D0;&#xD558;&#xB294; &#xAC83;&#xACFC;
          &#xB3D9;&#xC77C;&#xD558;&#xAC8C;, NUGU &#xC5D0;&#xC774;&#xC804;&#xD2B8;&#xB97C;
          listening-passive &#xC0C1;&#xD0DC;&#xAC00; &#xB418;&#xB3C4;&#xB85D; &#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>microphone off &#xC0C1;&#xD0DC;&#xC5D0;&#xC11C;&#xB294; &#xD638;&#xCD9C;&#xC5B4;&#xB97C;
          &#xBC1C;&#xD654;&#xD558;&#xC5EC; &#xAE30;&#xAE30;&#xB97C; listening &#xC0C1;&#xD0DC;&#xB85C;
          &#xB9CC;&#xB4E4; &#xC218; &#xC5C6;&#xC9C0;&#xB9CC;, &#xD638;&#xCD9C; &#xBC84;&#xD2BC;&#xC744;
          &#xB204;&#xB974;&#xBA74; &#xAC00;&#xB2A5;&#xD569;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xB9C8;&#xC774;&#xD06C; &#xBC84;&#xD2BC;                      </b>
      </td>
      <td style="text-align:left">
        <p>&#xAE30;&#xAE30;&#xC758; &#xB9C8;&#xC774;&#xD06C;&#xB97C; &#xB044;&#xAC70;&#xB098;
          &#xB2C8;&#xB2E4;.</p>
        <p>&#xB9C8;&#xC774;&#xD06C;&#xAC00; &#xAEBC;&#xC9C4; &#xC0C1;&#xD0DC; (microphone
          off) &#xC0C1;&#xD0DC;&#xC5D0;&#xC11C; &#xD638;&#xCD9C;&#xC5B4;&#xB97C;
          &#xBC1C;&#xD654;&#xD558;&#xC5EC;&#xB3C4; &#xAE30;&#xAE30;&#xAC00; wake
          up&#xB418;&#xC9C0; &#xC54A;&#xC2B5;&#xB2C8;&#xB2E4;. &#xD638;&#xCD9C; &#xBC84;&#xD2BC;&#xC744;
          &#xB20C;&#xB7EC; wake up &#xAC00;&#xB2A5;&#xD569;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xBCFC;&#xB968; &#xC870;&#xC808; &#xBC84;&#xD2BC;                   </b>
      </td>
      <td style="text-align:left">
        <p>&#xBCFC;&#xB968; &#xC870;&#xC808; &#xBC84;&#xD2BC;&#xC740; &#xC99D;&#xAC00;
          &#xBC84;&#xD2BC;&#xACFC; &#xAC10;&#xC18C; &#xBC84;&#xD2BC;&#xC774; &#xAC01;&#xAC01;
          &#xC81C;&#xACF5;&#xB418;&#xBA70;, &#xD55C; &#xBC88; &#xB204;&#xB97C; &#xB54C;&#xB9C8;&#xB2E4;
          &#xC74C;&#xB7C9;&#xC744; &#xC99D;&#xAC10;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xAE38;&#xAC8C; &#xB204;&#xB974;&#xBA74; &#xC5F0;&#xC18D;&#xC801;&#xC73C;&#xB85C;
          &#xC74C;&#xB7C9;&#xC744; &#xC99D;&#xAC00; &#xB610;&#xB294; &#xAC10;&#xC18C;&#xC2DC;&#xD0B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC774; &#xBC84;&#xD2BC;&#xC774; &#xB3D9;&#xC791;&#xB420; &#xB54C;&#xB294;
          &#xC99D;&#xAC10;&#xB41C; &#xC74C;&#xB7C9;&#xC774; &#xC5B4;&#xB290; &#xC815;&#xB3C4;&#xC778;&#xC9C0;&#xB97C;
          &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC54C; &#xC218; &#xC788;&#xB3C4;&#xB85D;
          &#xC18C;&#xB9AC; &#xD53C;&#xB4DC;&#xBC31;&#xC774; &#xC81C;&#xACF5;&#xB429;&#xB2C8;&#xB2E4;.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xC74C;&#xC18C;&#xAC70; &#xBC84;&#xD2BC;</b>
      </td>
      <td style="text-align:left">&#xAE30;&#xAE30;&#xB97C; mute &#xC0C1;&#xD0DC;&#xB85C; &#xC124;&#xC815;&#xD558;&#xAC70;&#xB098;
        &#xD574;&#xC81C;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xBE14;&#xB8E8;&#xD22C;&#xC2A4; &#xBC84;&#xD2BC;</b>
      </td>
      <td style="text-align:left">&#xBE14;&#xB8E8;&#xD22C;&#xC2A4;&#xB85C; &#xB2E4;&#xB978; &#xAE30;&#xAE30;&#xC640;
        &#xD398;&#xC5B4;&#xB9C1;&#xC744; &#xD558;&#xAC70;&#xB098; &#xD574;&#xC81C;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
  </tbody>
</table>버튼을 제공할 때에는 다음과 같은 사항을 고려합니.

* 자주 사용하는 버튼은 기기의 상단 부에 배치하여 누르기 용이하도록 합니다.
* 서로 대응되는 버튼\(예: 볼륨 증가, 볼륨 감소 버튼\)은 가까운 곳에 배치하여 사용자가 위치를 쉽게 인지할 수 있도록 합니다.
* 버튼을 눌렀을 때 버튼이 눌렸다는 것을 사용자가 소리 또는 LED를 통해 알 수 있도록 합니다.
* 버튼을 길게 누르거나, 2개 이상의 버튼 조합으로 기능이 실행되도록 할 수 있습니다. 이렇게 동작하는 방식은 사용자가 인지하고 사용하기 어려우므로 자주 사용하지 않는 기능이나, 쉽게 실행되어서는 안 되는 기능을 제공할 때 사용하도록 합니다.

## 조명

NUGU 에이전트를 탑재한 기기는 조명을 이용하여 현재의 상태 및 사용자 요청에 대한 결과를 피드백할 수 있습니다.

다음은 NUGU 에이전트 기기 모델 별로 사용되고 있는 조명 색상 및 그 의미입니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xB3D9;&#xC791;&#xC0C1;</th>
      <th style="text-align:center"><b>NU100</b>
      </th>
      <th style="text-align:center"><b>NU110</b>
      </th>
      <th style="text-align:center"><b>NU200</b>
      </th>
      <th style="text-align:left">&#xC758;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><b>&#xC804;&#xC6D0; &#xCF1C;&#xC9D0; / &#xAEBC;&#xC9D0;</b>
      </td>
      <td style="text-align:center">
        <p>Emerald</p>
        <p>Green</p>
      </td>
      <td style="text-align:center">
        <p>Default</p>
        <p>White</p>
      </td>
      <td style="text-align:center">White</td>
      <td style="text-align:left">&#xAE30;&#xAE30;&#xC758; &#xC804;&#xC6D0;&#xC774; &#xCF1C;&#xC9C8; &#xB54C;,
        &#xD639;&#xC740; &#xAEBC;&#xC9C8; &#xB54C; &#xC870;&#xBA85;&#xC73C;&#xB85C;
        &#xD53C;&#xB4DC;&#xBC31;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Listening</b>  <b>&#xC0C1;&#xD0DC;               </b>
      </td>
      <td style="text-align:center">Emerald Green</td>
      <td style="text-align:center">Sky blue</td>
      <td style="text-align:center">Sky Blue</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xB9D0;&#xD558;&#xB294; &#xAC83;&#xC744;
        &#xB4E4;&#xC744; &#xC900;&#xBE44;&#xAC00; &#xB418;&#xC5C8;&#xC73C;&#xBA70;,
        &#xB4E3;&#xACE0; &#xC788;&#xB2E4;&#xB294; &#xAC83;&#xC744; &#xC758;&#xBBF8;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Speaking</b>  <b>&#xC0C1;&#xD0DC;</b>
      </td>
      <td style="text-align:center">Blue</td>
      <td style="text-align:center">
        <p>Ocean blue&#xC640;</p>
        <p>Sky blue&#xB97C;</p>
        <p>&#xAD50;&#xCC28; &#xC0AC;&#xC6A9;</p>
      </td>
      <td style="text-align:center">Blue</td>
      <td style="text-align:left">NUGU &#xC5D0;&#xC774;&#xC804;&#xD2B8;&#xAC00; &#xB9D0;&#xD558;&#xACE0;
        &#xC788;&#xC74C;&#xC744; &#xC758;&#xBBF8;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Wi-Fi &#xC5F0;&#xACB0;  &#xC911;        </b>
      </td>
      <td style="text-align:center">Yellow Green</td>
      <td style="text-align:center">Lime&#xACFC; Green&#xC744; &#xAD50;&#xCC28; &#xC0AC;&#xC6A9;</td>
      <td style="text-align:center">
        <p>Yellow</p>
        <p>Green</p>
      </td>
      <td style="text-align:left">&#xBB34;&#xC120; &#xB124;&#xD2B8;&#xC6CC;&#xD06C;&#xC5D0; &#xC5F0;&#xACB0;
        &#xC911;&#xC784;&#xC744; &#xC758;&#xBBF8;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Wi-Fi &#xC5F0;&#xACB0; &#xC131;&#xACF5;                          </b>
      </td>
      <td style="text-align:center">Blue</td>
      <td style="text-align:center">Lime</td>
      <td style="text-align:center">
        <p>Yellow</p>
        <p>Green</p>
      </td>
      <td style="text-align:left">Wi-Fi &#xC5F0;&#xACB0;&#xC5D0; &#xC131;&#xACF5;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Wi-Fi &#xC5F0;&#xACB0; &#xC2E4;&#xD328; </b>
      </td>
      <td style="text-align:center">Pink</td>
      <td style="text-align:center">Red&#xC640; Orange&#xB97C; &#xAD50;&#xCC28; &#xC0AC;&#xC6A9;</td>
      <td style="text-align:center">Pink</td>
      <td style="text-align:left">Wi-Fi &#xC5F0;&#xACB0;&#xC5D0; &#xC2E4;&#xD328;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xC8FC;&#xC758; / &#xC2E4;&#xD328;           </b>
      </td>
      <td style="text-align:center">Pink</td>
      <td style="text-align:center">Red&#xC640; Orange&#xB97C; &#xAD50;&#xCC28; &#xC0AC;&#xC6A9;</td>
      <td style="text-align:center">Pink</td>
      <td style="text-align:left">&#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xC694;&#xCCAD;&#xC744; &#xC218;&#xD589;&#xD558;&#xB294;
        &#xB370;&#xC5D0; &#xC2E4;&#xD328;&#xD558;&#xC600;&#xAC70;&#xB098;, &#xC7AC;&#xC2DC;&#xB3C4;&#xAC00;
        &#xD544;&#xC694;&#xD568;&#xC744; &#xC758;&#xBBF8;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xC2DC;&#xC2A4;&#xD15C; &#xC5D0;&#xB7EC;</b>
      </td>
      <td style="text-align:center">Red</td>
      <td style="text-align:center">Red&#xC640; Orange&#xB97C; &#xAD50;&#xCC28; &#xC0AC;&#xC6A9;</td>
      <td style="text-align:center">Red</td>
      <td style="text-align:left">&#xC5D0;&#xB7EC;&#xAC00; &#xC788;&#xAC70;&#xB098;, &#xC0AC;&#xC6A9; &#xBD88;&#xAC00;&#xD568;&#xC744;
        &#xC758;&#xBBF8;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>&#xD38C;&#xC6E8;&#xC5B4;</b>
        </p>
        <p><b>&#xC5C5;&#xB370;&#xC774;&#xD2B8;</b>
        </p>
      </td>
      <td style="text-align:center">Purple</td>
      <td style="text-align:center">Purple</td>
      <td style="text-align:center">Purple</td>
      <td style="text-align:left">NUGU &#xC5D0;&#xC774;&#xC804;&#xD2B8;&#xAC00; &#xC5C5;&#xB370;&#xC774;&#xD2B8;
        &#xC911;&#xC784;&#xC744; &#xC758;&#xBBF8;</td>
    </tr>
  </tbody>
</table>## 효과음

효과음은 음성이 아닌 비프음이나 사운드 등을 의미합니다. 상황 별 정해진 특징적인 효과음을를 제공함으로써 음성으로 설명하지 않고도 상태 및 동작에 대하여 사용자가 인식할 수 있도록 합니다. 효과음은 에이전트 상태를 알리는 데에 사용되는 1\) 기본 효과음과 특정 서비스 동작과 관련된 2\)서비스 효과음로 나뉩니다.

### **기본 효과음\(Basic Feedback Sound\)**

**전원 켜짐 완료 \(Boot complete\)**

전원이 켜져 사용 가능 상태가 되었을 때 사운드를 제공합니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xC7AC;&#xC0DD; &#xC870;&#xAC74;</b>
      </th>
      <th style="text-align:left"><b>On/Off</b>  <b>&#xC124;&#xC815;</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">&#xBD80;&#xD305; &#xC644;&#xB8CC; &#xD6C4; Welcome Prompt &#xC9C1;&#xC804;</td>
      <td
      style="text-align:left">
        <p>&#x2022; On/Off &#xC124;&#xC815; &#xC5C6;&#xC73C;&#xBA70; &#xD56D;&#xC0C1;
          &#xC18C;&#xB9AC;&#xB97C; &#xC81C;&#xACF5;</p>
        <p>&#x2022; &#xAE30;&#xAE30;&#xBCC4;&#xB85C; &#xC124;&#xC815; &#xAC00;&#xB2A5;</p>
        </td>
    </tr>
  </tbody>
</table>{% file src="../.gitbook/assets/bootcomplete\_3800ms.ogg" caption="전원 켜짐 완료음" %}

![](../.gitbook/assets/undefined.png)

**호출 효과 \(Wake up success\)**

호출어를 발화하여 에이전트가 listening 상태가 되는 순간에 비프음을 제공합니다. 사용자의 발화를 인식할 준비가 되었다는 의미로써, 호출어를 발화하지 않고 호출 버튼을 누른 경우나 필수 entity를 입력받기 위해 speaking 상태 이후 바로 listening 상태가 될 때\(Slot-filling\)에도 해당 비프음이 발생됩니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xC7AC;&#xC0DD; &#xC870;&#xAC74;</b>
      </th>
      <th style="text-align:left"><b>On/Off</b>  <b>&#xC124;&#xC815;</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">Wake up &#xC131;&#xACF5; &#xC2DC;</td>
      <td style="text-align:left">
        <p>&#x2022; &#xC560;&#xD50C;&#xB9AC;&#xCF00;&#xC774;&#xC158;&#xC5D0;&#xC11C;
          On/Off &#xC124;&#xC815;&#xC744; &#xC81C;&#xACF5;</p>
        <p>&#x2022; &#xAE30;&#xBCF8; &#xAC12;&#xC740; ON</p>
        <p>&#x2022; &#xAE30;&#xAE30;&#xBCC4;&#xB85C; &#xC124;&#xC815; &#xAC00;&#xB2A5;</p>
      </td>
    </tr>
  </tbody>
</table>{% file src="../.gitbook/assets/start\_listening\_500ms-1.wav" caption="호출 효과음" %}

**호출어 발화 시**

![](../.gitbook/assets/undefined%20%287%29.png)

**Slot-filling 시**

![](../.gitbook/assets/slot-filling.png)

\*\*\*\*

**인식 완료\(End listen\)**

Listening 상태에서 사용자의 발화가 완료되어 Listening 상태가 종료 되었을때 비프음을 제공합니다. App에서 텍스트 명령 전송 시에는 제공하지 않습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xC7AC;&#xC0DD; &#xC870;&#xAC74;</b>
      </th>
      <th style="text-align:left"><b>On/Off</b>  <b>&#xC124;&#xC815;</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">Wake up &#xD6C4; &#xBC1C;&#xD654; &#xC778;&#xC2DD; &#xC131;&#xACF5; &#xC2DC;</td>
      <td
      style="text-align:left">
        <p>&#x2022; &#xC560;&#xD50C;&#xB9AC;&#xCF00;&#xC774;&#xC158;&#xC5D0;&#xC11C;
          On/Off &#xC124;&#xC815;&#xC744; &#xC81C;&#xACF5;</p>
        <p>&#x2022; &#xAE30;&#xAE30;&#xBCC4;&#xB85C; &#xC124;&#xC815; &#xAC00;&#xB2A5;</p>
        </td>
    </tr>
  </tbody>
</table>{% file src="../.gitbook/assets/end\_listening\_500ms.wav" caption="인식 완료음" %}

![](../.gitbook/assets/endlisten.png)



#### **응답 실패 \(Response fail\)**

사용자의 발화가 제대로 인식되지 않아 정상 동작을 할 수 없는 경우, 응답식 실패 비프음을 재생합니다. 

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xC7AC;&#xC0DD; &#xC870;&#xAC74;</b>
      </th>
      <th style="text-align:left"><b>On/Off</b>  <b>&#xC124;&#xC815;</b>
      </th>
      <th style="text-align:left"><b>&#xC18C;&#xB9AC;</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">
        <p>&#x2022; &#xC7A1;&#xC74C; &#xC778;&#xC2DD; &#xC2DC;</p>
        <p>&#x2022; 1&#xC74C;&#xC808; &#xBC1C;&#xD654; &#xC778;&#xC2DD; &#xC2DC;
          (&#xC77C;&#xBD80; 1&#xC74C;&#xC808; &#xBC1C;&#xD654;&#xB294; &#xD654;&#xC774;&#xD2B8;
          &#xB9AC;&#xC2A4;&#xD2B8;&#xB85C; &#xAD00;&#xB9AC;, &#xC778;&#xC2DD; &#xAC00;&#xB2A5;)</p>
        <p>&#x2022; &#xBE14;&#xB799; &#xB9AC;&#xC2A4;&#xD2B8;&#xB85C; &#xAD00;&#xB9AC;&#xB418;&#xB294;
          &#xBC1C;&#xD654;&#xB97C; &#xC2E4;&#xD589;&#xD558;&#xC5EC; OOD &#xCC98;&#xB9AC;&#xB418;&#xB294;
          &#xACBD;&#xC6B0;</p>
        <p>&#x2022; &#xD638;&#xCD9C; &#xBC84;&#xD2BC;&#xC744; &#xB20C;&#xB7EC; &#xC9C4;&#xC785;&#xB41C;
          listening &#xC0C1;&#xD0DC;&#xC5D0;&#xC11C; &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xAC00;
          &#xC5C6;&#xC5B4; &#xD0C0;&#xC784;&#xC544;&#xC6C3; &#xB41C; &#xACBD;&#xC6B0;</p>
        <p>&#x2022; Slot-filling&#xC744; &#xC704;&#xD55C; listening &#xC0C1;&#xD0DC;&#xC5D0;&#xC11C;
          &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xAC00; &#xC5C6;&#xC5B4; &#xD0C0;&#xC784;&#xC544;&#xC6C3;
          &#xB41C; &#xACBD;&#xC6B0;</p>
        <p>&#x2022; &#xD638;&#xCD9C; &#xBC84;&#xD2BC;&#xC744; &#xB20C;&#xB7EC; listening
          &#xC0C1;&#xD0DC;&#xAC00; &#xD574;&#xC81C;&#xB41C; &#xACBD;&#xC6B0;</p>
      </td>
      <td style="text-align:left">
        <p>&#x2022; &#xC560;&#xD50C;&#xB9AC;&#xCF00;&#xC774;&#xC158;&#xC5D0;&#xC11C;
          On/Off &#xC124;&#xC815;&#xC744; &#xC81C;&#xACF5;</p>
        <p>&#x2022; &#xAE30;&#xBCF8; &#xAC12;&#xC740; ON</p>
        <p>&#x2022; &#xAE30;&#xAE30;&#xBCC4;&#xB85C; &#xC124;&#xC815; &#xAC00;&#xB2A5;</p>
      </td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>{% file src="../.gitbook/assets/responsefail\_500ms.wav" caption="응답 실패음" %}

잡음 / 1음절 발화 / 블랙 리스트 발화 시 

![](../.gitbook/assets/1.png)

Slot-filling을 위한 listening 상태에서 타임아웃 시 

![](../.gitbook/assets/undefined%20%282%29.png)

**전원 꺼짐 \(Power off\)**

전원 버튼을 눌러 전원을 끌 경우, 사운드를 제공하여 전원이 꺼질 것임을 알립니다.

| **재생 조건** | **On/Off** **설정** |
| :--- | :--- |
| 전원을 끌 경우 | On/Off 설정 없으며 항상 소리를 제공 •  기기별로 설정 가능 |

![](../.gitbook/assets/undefined%20%283%29.png)

\*\*\*\*

### **서비스 효과음\(Service Feedback Sound\)**

서비스 효과음는 특정 서비스 내에서 동작을 사용자가 인지하기 쉽도록 하거나, 감성을 전달하고자 할 때 사용합니다. 서비스 소리가 재생될 때는 응답 효과\(End listen\)은 재생하지 않습니다. 다음은 NUGU 기기에 적용된 서비스 효과의 예시입니다. 



#### **무드등 제어 \(Mood light on/off\)**

사용자 발화에 의해 무드등을 켜거나 끌 때 제공되는 효과입니다. 하드웨어 버튼으로 무드등을 켜고 끌 때에는 소리를 제공하지 않습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xC7AC;&#xC0DD; &#xC870;&#xAC74;</b>
      </th>
      <th style="text-align:left"><b>&#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC5D0; &#xC758;&#xD55C; &#xB3D9;&#xC791;  </b>
      </th>
      <th style="text-align:left"><b>&#xD558;&#xB4DC;&#xC6E8;&#xC5B4; &#xBC84;&#xD2BC; &#xC870;&#xC791;                      </b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">
        <p>&#xBB34;&#xB4DC;&#xB4F1;&#xC774; &#xCF1C;&#xC9C8; &#xB54C;</p>
        <p>(&#xBB34;&#xB4DC;&#xB4F1; &#xC0C9; &#xBCC0;&#xACBD; &#xD3EC;&#xD568;)</p>
      </td>
      <td style="text-align:left">&#xBB34;&#xB4DC;&#xB4F1; &#xC81C;&#xC5B4;&#xC74C; &#xC7AC;&#xC0DD; O</td>
      <td
      style="text-align:left">&#xBB34;&#xB4DC;&#xB4F1; &#xC81C;&#xC5B4;&#xC74C; &#xC7AC;&#xC0DD; X</td>
    </tr>
    <tr>
      <td style="text-align:left">&#xBB34;&#xB4DC;&#xB4F1;&#xC774; &#xAEBC;&#xC9C8; &#xB54C;</td>
      <td style="text-align:left">&#xBB34;&#xB4DC;&#xB4F1; &#xC81C;&#xC5B4;&#xC74C; &#xC7AC;&#xC0DD; O</td>
      <td
      style="text-align:left">&#xBB34;&#xB4DC;&#xB4F1; &#xC81C;&#xC5B4;&#xC74C; &#xC7AC;&#xC0DD; X</td>
    </tr>
  </tbody>
</table>![](../.gitbook/assets/undefined%20%281%29.png)

**볼륨 제어 \(Volume up/down\)**

볼륨을 올리거나 내릴 때 제공되는 효과입니다. 볼륨 제어 이후에 소리를 재생하여, 사용자가 변경된 볼륨 크기를 인지할 수 있도록 합니다. 음원이나 Prompt 재생 중에는 재생되고 있는 음원/Prompt로 볼륨 크기를 인지할 수 있으므로 볼륨 제어 효과음을 제공하지 않습니다. 볼륨을 0으로 변경 시에는 볼륨 제어 소리를 재생하여도 음소거 상태이므로 볼륨 제어 소리가 들리지 않게 되며 이는 정상 동작입니다. 하드웨어 버튼으로 볼륨 조절 시에도 소리를 제공하도록 합니다. 

| **사용자 발화** | **사용자 발화에 의한 동작**  | **하드웨어 버튼 조작**   |
| :--- | :--- | :--- |
| 볼륨을 높일  | O | O |
| 볼륨을 낮출 때 | O | O |

![](../.gitbook/assets/2.png)

\*\*\*\*

## 

\*\*\*\*

#### 

