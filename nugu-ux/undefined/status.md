# NUGU States

NUGU Agent

NUGU는 NUGU 스피커, T map, Btv 등 다양한 기기에서 서비스 되며, 이러한 기기들을 통해 사용자가 접하는 인공지능 소프트웨어를 NUGU 에이전트라고 합니다. 이 때의 NUGU 에이젼트에 대한 사용자 경험은 NUGU platform을 이용하는 모든 사용자들에게 일관적일 수 있도록, 다음의 기본 동작 프로세스를 따르게 됩니다.

NUGU Agent States

NUGU 에이전트와 사용자간 대화 프로세스에서 NUGU 에이전트의 상태는 크게 idle, listening, processing, responding의 4단계로 나눠질 수 있습니다. 먼저 대기상태\(idle state\)에서 사용자가 호출어\(wake-up word\)를 발화하거나 호출 버튼을 누르면 NUGU 에이전트가 사용자의 명령을 받아들일 수 있는 상태\(listening-passive\)로 변경됩니다. 이때 사용자가 말하기 시작하면 사용자의 발화를 입력 받는 상태\(listening-active\)로 변경되며, 사용자의 발화가 종료되면 동작을 결정하는 단계\(processing\)를 거쳐 명령에 대한 답변이나 동작을 수행\(responding\)하게 됩니다. 각 상태의 기본 흐름은 아래와 같습니다.

![](../../.gitbook/assets/interaction-flow.png)

각 상태 별 정의는 아래와 같습니다.

| 상 | 정 |
| :--- | :--- |
| **Idle** | Wake up 가능한 대기 상태 |
| **Listening – Passive** | 사용자 발화 입력 대기 상태 |
| **Listening – Active** | 사용자 발화 입력 중 상태 |
| **Processing** | 입력된 사용자 발화를 분석하는 상태 |
| **Responding - Speaking** | 정보나 동작에 대한 TTS를 제공하는 상태 |
| **Responding - Playing** | 콘텐츠를 재생하는 상태 |
| **Responding - Error** | 발화한 명령에 대한 동작을 수행할 수 없어, 이에 대한 피드백을 제공하는 상태. Speaking 상태 대신 발생 |

사용자가 wake up 시키지 않더라도, NUGU 에이전트가 스스로 깨어나서 동작을 수행하는 경우가 있는데, 이를 alert 상태라고 하며 아래와 같이 나뉠 수 있습니다.

| **Alert - Message** | 새로운 알림 메시지 수신 상태 |
| :--- | :--- |
| **Alert - Sound** | 사운드 알림 수신 상태 \(알람, 타이머, 전화 수신\) |

NUGU 에이전트의 각 상태에서 호출 버튼을 눌렀을 때의 상태 변화는 다음과 같습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xD604;&#xC7AC; &#xC0C1;&#xD0DC;</b>
      </th>
      <th style="text-align:left"><b>&#xD638;&#xCD9C; &#xBC84;&#xD2BC; &#xB20C;&#xB800;&#xC744; &#xB54C;&#xC758; &#xC0C1;&#xD0DC; &#xBCC0;&#xD654;</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><b>Listening &#x2013; Passive</b>
      </td>
      <td style="text-align:left">listening &#xC0C1;&#xD0DC;&#xAC00; &#xD574;&#xC81C;&#xB418;&#xC5B4; idle
        &#xC0C1;&#xD0DC;&#xB85C; &#xB3CC;&#xC544;&#xAC10;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Listening &#x2013; Active</b>
      </td>
      <td style="text-align:left">&#xD638;&#xCD9C; &#xBC84;&#xD2BC;&#xC744; &#xB204;&#xB974;&#xAE30; &#xC804;&#xAE4C;&#xC9C0;
        &#xC785;&#xB825;&#xB41C; &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654; &#xAE4C;&#xC9C0;&#xB9CC;
        &#xC785;&#xB825; &#xBC1B;&#xACE0; processing &#xC0C1;&#xD0DC; &#xC9C4;&#xC785;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Alert &#x2013; Message</b>
      </td>
      <td style="text-align:left">&#xC218;&#xC2E0;&#xB41C; &#xBA54;&#xC2DC;&#xC9C0;&#xB97C; Prompt&#xB85C;
        &#xC81C;&#xACF5;&#xD558;&#xB294; speaking &#xC0C1;&#xD0DC; &#xC9C4;&#xC785;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Alert &#x2013; Sound</b>
      </td>
      <td style="text-align:left">&#xC0AC;&#xC6B4;&#xB4DC; &#xC7AC;&#xC0DD;&#xC774; &#xC911;&#xC9C0;&#xB418;&#xACE0;
        listening &#x2013; passive &#xC0C1;&#xD0DC; &#xC9C4;&#xC785;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>Responding &#x2013; speaking</b>
        </p>
        <p><b>Responding &#x2013; error</b>
        </p>
      </td>
      <td style="text-align:left">
        <p>Prompt&#xAC00; &#xC911;&#xC9C0;&#xB418;&#xACE0; listening &#x2013; passive
          &#xC0C1;&#xD0DC; &#xC9C4;&#xC785;</p>
        <p>&#xC774;&#xD6C4; &#xC774;&#xC5B4;&#xC9C0;&#xB294; &#xC0AC;&#xC6A9;&#xC790;
          &#xBC1C;&#xD654;&#xC5D0; &#xB300;&#xD574;</p>
        <p>- Prompt&#xAC00; &#xC544;&#xB2CC; &#xB3D9;&#xC791;(&#xBCFC;&#xB968; &#xC870;&#xC808;,
          &#xC7AC;&#xC0DD;, &#xC7AC;&#xC2DC;&#xC791; &#xB4F1;)&#xC744; &#xC218;&#xD589;&#xD558;&#xB294;
          &#xACBD;&#xC6B0;&#xC5D0;&#xB294; &#xB3D9;&#xC791;&#xC744; &#xBA3C;&#xC800;
          &#xC218;&#xD589;&#xD55C; &#xD6C4;, &#xC911;&#xC9C0;&#xB418;&#xC5C8;&#xB358;
          Prompt&#xB97C; &#xCC98;&#xC74C;&#xBD80;&#xD130; &#xC7AC;&#xC2DC;&#xC791;</p>
        <p>- &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC5D0; &#xB300;&#xD574; Prompt&#xB97C;
          &#xC81C;&#xACF5;&#xD558;&#xB294; &#xACBD;&#xC6B0;&#xC5D0;&#xB294; &#xC911;&#xC9C0;&#xB418;&#xC5C8;&#xB358;
          TTS&#xB294; &#xBB34;&#xC2DC;&#xB428;.</p>
        <p>- 1&#xC74C;&#xC808; &#xBC1C;&#xD654;, &#xC18C;&#xC74C;, &#xBB34;&#xC74C;
          &#xB4F1; &#xBC1C;&#xD654; &#xBBF8;&#xC778;&#xC2DD;&#xC73C;&#xB85C; &#xCC98;&#xB9AC;&#xB41C;
          &#xACBD;&#xC6B0;&#xC5D0;&#xB3C4; &#xC7AC;&#xC0DD;&#xC911;&#xC774;&#xC5C8;&#xB358;
          Prompt&#xB294; &#xBB34;&#xC2DC;&#xB428;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>Responding</b>  <b>- Playing</b>
      </td>
      <td style="text-align:left">
        <p>Playing&#xC744; &#xC77C;&#xC2DC;&#xC815;&#xD558;&#xACE0; listening &#x2013;
          passive &#xC0C1;&#xD0DC; &#xC9C4;&#xC785;</p>
        <p>&#xC774;&#xD6C4; &#xC774;&#xC5B4;&#xC9C0;&#xB294; &#xC0AC;&#xC6A9;&#xC790;
          &#xBC1C;&#xD654;&#xC5D0; &#xB300;&#xD574; &#xB3D9;&#xC791;&#xC774;&#xB098;
          Prompt &#xB97C; &#xC81C;&#xACF5;&#xD55C; &#xD6C4;, playing &#xC0C1;&#xD0DC;&#xB85C;
          &#xB3CC;&#xC544;&#xC634; (1&#xC74C;&#xC808; &#xBC1C;&#xD654;, &#xC18C;&#xC74C;,
          &#xBB34;&#xC74C; &#xB4F1; &#xBC1C;&#xD654; &#xBBF8;&#xC778;&#xC2DD;&#xC73C;&#xB85C;
          &#xCC98;&#xB9AC;&#xB41C; &#xACBD;&#xC6B0;&#xC5D0;&#xB3C4; &#xB3D9;&#xC77C;)</p>
      </td>
    </tr>
  </tbody>
</table>

Device States

대화의 단계에 따른 에이전트 상태에 더하여, 기기의 마이크가 꺼져 있는 상태이거나 음소거 상태와 같이 기기 자체에도 상태의 변화가 있으며, 이를 기기 상태라고 합니다. 기기 상태는 아래와 같이 구분될 수 있습니다.

**음소거 \(Mute\)**

기기의 소리가 출력되지 않는 상태입니다. 음소거 상태는 기기의 비프음이나 사운드, Prompt 등 기기에서 제공하는 모든 소리에 적용이 됩니다. 따라서 음소거 상태일 때는 speaking 또는 playing 상태가 되었을 때 Prompt나 사운드, 비프음을 볼륨 레벨 0으로 출력합니다. 단, alert형 안내\(알람 울림, 타이머 울림, Notification 울림, 전화벨 울림\)가 실행될 때는 음소거 상태일지라로 원래 음량으로 실행됩니다.

**마이크 켜짐/꺼짐 \(Microphone on/off\)**

NUGU 디바이스의 음성인식 마이크가 꺼져 있는 상태로, 이 상태에서는 음성으로 에이전트를 wake up할 수 없습니다. 마이크가 꺼져 있는 상태에서 호출 버튼을 누를 경우, 마이크가 켜지고 listening - passive 상태로 변경됩니다. 한번 마이크가 켜지면 해당 상태는 유지됩니다.

**야간 모드 \(Night mode\)**

디스플레이가 있는 디바이스에서 전원 절약을 위하 스크린 표시가 최소화된 상태입니다.

화면 켜짐/꺼짐 \(Screen on/off\)

디스플레이가 있는 디바이스에서 화면이 켜져있거나 꺼져있는 상

무드등 켜짐/꺼짐 \(Moodlight on/off\)

조명 기능이 있는 디바이스에서 조명이 켜져있거나 꺼져있는 상

**네트워크 미연결 \(Disconnected network\)**

기기가 네트워크에 연결되지 않은 상태를 말합니다. 이 상태에서는 wake up시 곧바로 네트워크가 연결되어 있지 않음을 알려주는 Prompt를 제공합니다.

초기 기기 상태

NUGU 기기의 초기 상태는 다음과 같습니다. 마이크\(Microphone\) on / 와이파이 on / 블루투스 off / 볼륨 unmute / 무드등 off





**Time-out 정책**

<table>
  <thead>
    <tr>
      <th style="text-align:left"></th>
      <th style="text-align:left"><b>NU100</b>
      </th>
      <th style="text-align:left"><b>NU110</b>
      </th>
      <th style="text-align:left"><b>NU200</b>
      </th>
      <th style="text-align:left"><b>NU300</b>
      </th>
      <th style="text-align:left"><b>Btv x NUGU</b>
      </th>
      <th style="text-align:left"><b>App</b>
      </th>
      <th style="text-align:left"><b>Tmap x NUGU</b>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">
        <p><b>&#xBBF8;&#xBC1C;&#xD654; &#xB300;&#xAE30; &#xC2DC;&#xAC04;</b>
        </p>
        <p><b>(Wake up &#xD6C4; &#xC885;&#xB8CC;&#xAE4C;&#xC9C0; &#xB300;&#xAE30; &#xC2DC;&#xAC04;)</b>
        </p>
      </td>
      <td style="text-align:left"><b>7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>5&#xCD08;</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>DM&#xC0C1;&#xD0DC; &#xBBF8;&#xBC1C;&#xD654; &#xB300;&#xAE30; &#xC2DC;&#xAC04;</b>
        </p>
        <p><b>(DM &#xC0C1;&#xD0DC;&#xC5D0;&#xC11C; &#xC885;&#xB8CC;&#xAE4C;&#xC9C0; &#xB300;&#xAE30; &#xC2DC;&#xAC04;)</b>
        </p>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 5&#xCD08;</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>EPD Time</b>
        </p>
        <p><b>(&#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654; &#xC911; &#xACF5;&#xBC31; &#xD5C8;&#xC6A9; &#xC2DC;&#xAC04;)</b>
        </p>
      </td>
      <td style="text-align:left"><b>0.7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>0.7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>0.7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>0.7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>0.7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>0.7&#xCD08;</b>
      </td>
      <td style="text-align:left">
        <p><b>0.7&#xCD08;</b>
        </p>
        <p><b>(SMS&#xC758; &#xACBD;&#xC6B0; 1.2&#xCD08;)</b>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>Max Record Time</b>
        </p>
        <p><b>(&#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654; &#xCD5C;&#xB300; &#xB179;&#xC74C; &#xC2DC;&#xAC04;)</b>
        </p>
      </td>
      <td style="text-align:left"><b>10&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>10&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>10&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>10&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>10&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>10&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>10&#xCD08;</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p><b>&#xBA85;&#xB839; &#xC218;&#xD589; &#xD6C4; &#xD654;&#xBA74; &#xC720;&#xC9C0; &#xC2DC;&#xAC04;</b>
        </p>
        <p><b>(Btv &#xD558;&#xD504; &#xC708;&#xB3C4;&#xC6B0;, NU300  &#xD654;&#xBA74;)</b>
        </p>
      </td>
      <td style="text-align:left"><b>-</b>
      </td>
      <td style="text-align:left"><b>-</b>
      </td>
      <td style="text-align:left"><b>-</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>TTS &#xC644;&#xB8CC; &#xD6C4; 7&#xCD08;</b>
      </td>
      <td style="text-align:left"><b>-</b>
      </td>
    </tr>
  </tbody>
</table>



