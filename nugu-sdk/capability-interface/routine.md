---
description: 루틴을 실행하기 위한 규격
---

# Routine

## Version

최신 버전은 1.2 입니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Version</th>
      <th style="text-align:left">Date</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">1.0</td>
      <td style="text-align:left">2020.11.10</td>
      <td style="text-align:left">&#xADDC;&#xACA9; &#xCD94;&#xAC00;</td>
    </tr>
    <tr>
      <td style="text-align:left">1.1</td>
      <td style="text-align:left">2020.11.13</td>
      <td style="text-align:left">
        <p>Context &#xC758; actions &#xC5D0; postDelayInMilliseconds &#xCD94;&#xAC00;</p>
        <p>Start directive &#xC758; actions &#xC5D0; postDelayInMilliseconds &#xCD94;&#xAC00;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">1.2</td>
      <td style="text-align:left">2020.12.10</td>
      <td style="text-align:left">
        <p>Context &#xC758; routineActivity &#xC5D0; INTERRUPTED &#xCD94;&#xAC00;</p>
        <p></p>
      </td>
    </tr>
  </tbody>
</table>

## State Diagram

![](../../.gitbook/assets/image%20%282%29.png)

## SDK Interface

Routine 은 정해진 Action 을 SDK 내부에서 순차적으로 실행하며 Application 에서 처리할 별도의 interface 가 없습니다.

## Context

```text
{
  "Routine": {
    "version": "1.0",
    "token": "{{STRING}}",
    "routineActivity": "{{STRING}}",
    "currentAction": {{INT}},
    "actions": [
      {
        "type": "{{STRING}}",
        "text": "{{STRING}}",
        "data": {},
        "playServiceId": "{{STRING}}",
        "token": "{{STRING}}",
        "postDelayInMilliseconds": {{LONG}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>Routine.Play Directive&#xC5D0;&#xC11C; &#xC804;&#xB2EC;&#xD55C; &#xB8E8;&#xD2F4;&#xC744;
          &#xC2DD;&#xBCC4;&#xD558;&#xAE30; &#xC704;&#xD55C; unique&#xD55C; string</p>
        <p>&#xC5F0;&#xC18D;&#xB41C; &#xB8E8;&#xD2F4; &#xAC04;&#xC5D0; &#xB3D9;&#xC77C;&#xD55C;
          token&#xC744; &#xC804;&#xB2EC;&#xD558;&#xC9C0; &#xC54A;&#xB3C4;&#xB85D;
          &#xC8FC;&#xC758;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">routineActivity</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <ul>
          <li><b>IDLE</b> - &#xB8E8;&#xD2F4;&#xC744; &#xD55C;&#xBC88;&#xB3C4; &#xC2E4;&#xD589;&#xD558;&#xC9C0;
            &#xC54A;&#xC740; &#xACBD;&#xC6B0;</li>
          <li><b>PLAYING</b> - &#xB8E8;&#xD2F4;&#xC774; &#xC2E4;&#xD589;&#xB418;&#xACE0;
            &#xC788;&#xB294; &#xACBD;&#xC6B0;</li>
          <li><b>INTERRUPTED</b> - &#xB8E8;&#xD2F4;&#xC774; &#xC5B4;&#xB5A4; &#xC774;&#xC720;&#xB85C;&#xB4E0;
            &#xC911;&#xB2E8;&#xB41C; &#xACBD;&#xC6B0;</li>
          <li><b>FINISHED</b> - &#xB9C8;&#xC9C0;&#xB9C9; &#xC561;&#xC158;&#xAE4C;&#xC9C0;
            &#xC815;&#xC0C1;&#xC801;&#xC73C;&#xB85C; &#xC2E4;&#xD589;&#xC774; &#xC885;&#xB8CC;&#xB41C;
            &#xACBD;&#xC6B0;</li>
          <li><b>STOPPED</b> - &#xB05D;&#xAE4C;&#xC9C0; &#xC2E4;&#xD589;&#xD558;&#xC9C0;
            &#xBABB;&#xD558;&#xACE0; &#xC885;&#xB8CC;&#xB41C; &#xACBD;&#xC6B0;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">currentAction</td>
      <td style="text-align:left">int</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD604;&#xC7AC; &#xC2E4;&#xD589; &#xC911;&#xC778; Action&#xC758; &#xC21C;&#xC11C;</p>
        <p>1&#xBD80;&#xD130; &#xC2DC;&#xC791;&#xD558;&#xBA70;, &#xB9C8;&#xC9C0;&#xB9C9;
          Action&#xC758; &#xAC12;&#xC740; actions &#xC758; &#xAC1C;&#xC218;&#xC640;
          &#xAC19;&#xC544;&#xC57C; &#xD568;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">actions</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Start Directive &#xCC38;&#xC870;</td>
    </tr>
  </tbody>
</table>

## Directives

### Start

```text
{
  "header": {
    "namespace": "Routine",
    "name": "Start",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "actions": [
      {
        "type": "{{STRING}}",
        "text": "{{STRING}}",
        "data": {},
        "playServiceId": "{{STRING}}",
        "token": "{{STRING}}",
        "postDelayInMilliseconds": {{LONG}}
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
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC804;&#xB2EC;&#xD558;&#xB294; &#xB8E8;&#xD2F4;&#xC744; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
        &#xC704;&#xD55C; unique string</td>
    </tr>
    <tr>
      <td style="text-align:left">actions</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xB8E8;&#xD2F4;&#xC744; &#xAD6C;&#xC131;&#xD558;&#xB294; Action&#xC744;
        &#xD3EC;&#xD568;&#xD558;&#xB294; list</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>actions.</p>
        <p>type</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>&#xC804;&#xC1A1;&#xD558;&#xB294; Event Type</p>
        <ul>
          <li><b>TEXT</b> - Text.TextInput&#xC73C;&#xB85C; &quot;text&quot; &#xD30C;&#xB77C;&#xBBF8;&#xD130;
            &#xC804;&#xC1A1;</li>
          <li><b>DATA</b> - Routine.ActionTriggered Event&#xB85C; data&#xB97C; &#xC804;&#xC1A1;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>actions.</p>
        <p>text</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>type &#xC774; TEXT &#xC77C; &#xB54C; &#xD544;&#xC218; &#xAC12;</p>
        <p>Action&#xC744; &#xC2E4;&#xD589;&#xD558;&#xAE30; &#xC704;&#xD55C; &#xBC1C;&#xD654;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>actions.</p>
        <p>data</p>
      </td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>type &#xC774; DATA &#xC77C; &#xB54C; &#xD544;&#xC218; &#xAC12;</p>
        <p>ActionTriggered Event&#xB97C; &#xC804;&#xC1A1;&#xD560;&#xB54C; &#xD568;&#xAED8;
          &#xC804;&#xC1A1;&#xD558;&#xB294; &#xB370;&#xC774;&#xD130;</p>
        <p>ActionTriggered Event&#xC758; &quot;data&quot; &#xD30C;&#xB77C;&#xBBF8;&#xD130;&#xC5D0;
          &#xC774; object&#xB97C; &#xADF8;&#xB300;&#xB85C; &#xBCF5;&#xC0AC;&#xD574;&#xC11C;
          &#xC804;&#xC1A1;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>actions.</p>
        <p>playServiceId</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>text &#xB610;&#xB294; event&#xB97C; &#xC2E4;&#xD589;&#xD558;&#xB294; Play
          Service Id</p>
        <p>TEXT&#xB294; &#xC774; &#xAC12;&#xC774; &#xC5C6;&#xC73C;&#xBA74; &#xB77C;&#xC6B0;&#xD305;
          &#xB85C;&#xC9C1;&#xB300;&#xB85C; &#xB77C;&#xC6B0;&#xD305;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>actions.</p>
        <p>token</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Text.TextInput event &#xC758; &quot;token&quot; parameter &#xB85C; &#xC804;&#xB2EC;&#xD574;&#xC57C;
        &#xD568;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>actions.</p>
        <p>postDelayInMilliseconds</p>
      </td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xD574;&#xB2F9; Action &#xC758; ActionTriggered event &#xC694;&#xCCAD;&#xC73C;&#xB85C;
          &#xC804;&#xB2EC;&#xBC1B;&#xC740; &#xBAA8;&#xB4E0; directive &#xB97C; &#xC2E4;&#xD589;&#xD55C;
          &#xD6C4;
          <br />&#xB2E4;&#xC74C; Action &#xC758; ActionTriggered event &#xB97C; &#xC694;&#xCCAD;&#xD558;&#xAE30;
          &#xC804;&#xAE4C;&#xC9C0; &#xAC15;&#xC81C;&#xB85C; &#xC124;&#xC815;&#xD558;&#xB294;
          delay &#xC2DC;&#xAC04;</p>
        <ul>
          <li>&#xB2E8;&#xC704; - msec</li>
          <li>default - 0 (delay&#xAC00; &#xC5C6;&#xC74C;)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

### Stop

현재 실행 중인 루틴을 종료

```text
{
  "header": {
    "namespace": "Routine",
    "name": "Stop",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | context에서 현재 동작 중인 루틴의 token 값을 사용 |

### Continue

현재 실행 중인 루틴을 이어서 실행

실행 중인 Action은 멈추고 다음 Action부터 실행됨

```text
{
  "header": {
    "namespace": "Routine",
    "name": "Continue",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| token | string | Y | context에서 현재 동작 중인 루틴의 token 값을 사용 |

## Events

### Started

루틴의 첫번째 Action을 실행하기 전에 전달

```text
{
  "header": {
    "namespace": "Routine",
    "name": "Started",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Failed

루틴 실행이 실패하는 경우

Routine.Play, Routine.Continue Directive의 응답으로 전송 가능

```text
{
  "header": {
    "namespace": "Routine",
    "name": "Failed",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "errorMessage": "{{STRING}}"
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| errorMessage | string | Y |  |

### Finished

마지막 Action까지 정상적으로 실행이 종료된 경우 발생

```text
{
  "header": {
    "namespace": "Routine",
    "name": "Finished",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### Stopped

모든 Action이 실행되기 전에 Routine.Stop Directive 또는 시스템 이슈로 종료된 경우

```text
{
  "header": {
    "namespace": "Routine",
    "name": "Stopped",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}"
  }
}
```

### ActionTriggered

```text
{
  "header": {
    "namespace": "Routine",
    "name": "ActionTriggered",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "data": {}
  }
}
```

| parameter | type | mandatory | description |
| :--- | :--- | :--- | :--- |
| data | object | Y | DATA type의 Action에서 보낼 데이터 |

