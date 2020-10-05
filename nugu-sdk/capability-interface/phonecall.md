# PhoneCall

## Version

최신 버전은 1.1 입니다.

## SDK Interface

### 세션 상태 정보

세션 유지상태 정보를 확인할 수 있습니다.

[Android reference](https://github.com/nugu-developers/nugu-android/blob/master/nugu-agent/src/main/java/com/skt/nugu/sdk/agent/dialog/DialogUXStateAggregatorInterface.kt#L64)

[iOS reference](https://github.com/nugu-developers/nugu-ios/blob/master/NuguClientKit/Sources/Business/DialogStateDelegate.swift#L30)

## Context

```text
{
  "PhoneCall": {
    "version": "1.1",
    "state": "{{STRING}}",
    "template": {
      "intent": "{{STRING}}",
      "callType": "{{STRING}}",
      "recipientIntended": {
        "name": "{{STRING}}",
        "label": "{{STRING}}"
      },
      "candidates": [Person]
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
      <td style="text-align:left">state</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"><b>IDLE, OUTGOING, INCOMING, ESTABLISHED</b>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">template</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">Play &#xC5D0;&#xC11C; &#xC9C4;&#xD589;&#xC911;&#xC778; intent &#xB97C;
        &#xC54C; &#xC218; &#xC788;&#xB3C4;&#xB85D; SendCandidates event &#xC5D0;&#xC11C;
        &#xC804;&#xB2EC;&#xBC1B;&#xC740; data &#xB97C; &#xC720;&#xC9C0;&#xD574;&#xC57C;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>intent</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>candidates&#xC758; &#xC6A9;&#xB3C4;</p>
        <ul>
          <li><b>CALL</b> - &#xC804;&#xD654;&#xAC78;&#xC5B4;&#xC918;</li>
          <li><b>SEARCH</b> - &#xCC3E;&#xC544;&#xC918;</li>
          <li><b>HISTORY</b> - &#xCD5C;&#xADFC; &#xD1B5;&#xD654; &#xBAA9;&#xB85D;</li>
          <li><b>REDIAL</b> - &#xC7AC;&#xBC1C;&#xC2E0;</li>
          <li><b>MISSED</b> - &#xBD80;&#xC7AC;&#xC911;&#xD1B5;&#xD654;</li>
          <li><b>NONE</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>callType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>NORMAL</b> - &#xC77C;&#xBC18; &#xC804;&#xD654;</li>
          <li><b>SPEAKER</b> - &#xC2A4;&#xD53C;&#xCEE4;&#xD3F0;</li>
          <li><b>VIDEO</b> - &#xBE44;&#xB514;&#xC624;&#xCF5C;</li>
          <li><b>CALLAR</b> - &#xCF5C;&#xB77C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>recipientIntended</p>
      </td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C; recipient &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>recipientIntended.</p>
        <p>name</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xAC80;&#xC0C9;&#xC5D0; &#xC694;&#xCCAD;&#xD560;&#xB54C; &#xC0AC;&#xC6A9;&#xB41C;
          &#xC0C1;&#xB300;&#xBC29; &#xC774;&#xB984;</p>
        <p>(NLU &#xBD84;&#xC11D;&#xC73C;&#xB85C; &#xB098;&#xC628; &#xC774;&#xB984;)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>recipientIntended.</p>
        <p>label</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>NLU &#xBD84;&#xC11D; &#xACB0;&#xACFC; label (&#xC9D1;, &#xD68C;&#xC0AC;,
          ...)</p>
        <p>&#xC815;&#xADDC;&#xD654;&#xB418;&#xC5B4; &#xC788;&#xC9C0; &#xC54A;&#xACE0;,
          &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xC5D0;&#xC11C; &#xBD84;&#xC11D;&#xB41C;
          &#xAC12;&#xC744; &#xADF8;&#xB300;&#xB85C; &#xBCF4;&#xB0C4;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>template.</p>
        <p>candidates</p>
      </td>
      <td style="text-align:left">array of <a href="phonecall.md#person">Person</a>
      </td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD654;&#xBA74;&#xC5D0; &#xAC80;&#xC0C9; &#xACB0;&#xACFC; &#xB9AC;&#xC2A4;&#xD2B8;&#xB97C;
        &#xB514;&#xC2A4;&#xD50C;&#xB808;&#xC774;&#xD558;&#xB294; &#xC911;&#xC5D0;&#xB9CC;
        context&#xC5D0; &#xCD94;&#xAC00;</td>
    </tr>
  </tbody>
</table>

## Common Objects

### Person

```text
{
  "name": "{{STRING}}",
  "type": "{{STRING}}",
  "profileImgUrl": "{{STRING}}",
  "category": "{{STRING}}",
  "address": {
    "road": "{{STRING}}",
    "jibun": "{{STRING}}"
  },
  "businessHours": {
    "open": "{{STRING}}",
    "close": "{{STRING}}",
    "info": "{{STRING}}"
  },
  "history": {
    "time": "{{STRING}}",
    "type": "{{STRING}}",
    "callType": "{{STRING}}"
  },
  "numInCallHistory": "{{STRING}}",
  "token": "{{STRING}}",
  "score": "{{STRING}}",
  "contacts": [Contact]
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
      <td style="text-align:left">name</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">candidates&#xAC00; &#xC874;&#xC7AC;&#xD558;&#xBA74; &#xAC01; candidate&#xB294;
        &#xCD5C;&#xC18C;&#xD55C; &#xC774;&#xB984;&#xC740; &#xD3EC;&#xD568;&#xD574;&#xC57C;
        &#xD568;</td>
    </tr>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">
        <p>recipient candidates&#xC758; &#xD0C0;&#xC785;</p>
        <ul>
          <li><b>CONTACT</b> - &#xC5F0;&#xB77D;&#xCC98; &#xAC80;&#xC0C9;</li>
          <li><b>EXCHANGE</b> - exchange &#xAC80;&#xC0C9;</li>
          <li><b>T114</b> - T114 &#xAC80;&#xC0C9;</li>
          <li><b>NONE</b> - &#xD2B9;&#xC815; &#xCE74;&#xD14C;&#xACE0;&#xB9AC;&#xC5D0;
            &#xC18D;&#xD558;&#xC9C0; &#xC54A;&#xC74C;</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">profileImgUrl</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">profile image URL</td>
    </tr>
    <tr>
      <td style="text-align:left">category</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC5C5;&#xC885;</td>
    </tr>
    <tr>
      <td style="text-align:left">address</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC8FC;&#xC18C;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>address.</p>
        <p>road</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB3C4;&#xB85C;&#xBA85; &#xC8FC;&#xC18C;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>address.</p>
        <p>jibun</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC9C0;&#xBC88; &#xC8FC;&#xC18C;</td>
    </tr>
    <tr>
      <td style="text-align:left">businessHours</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xC601;&#xC5C5;&#xC2DC;&#xAC04;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>businessHours.</p>
        <p>open</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xB0A0;&#xC9DC;, &#xC2DC;&#xAC04; &#xC815;&#xBCF4;&#xB85C; ISO 8601 &#xD3EC;&#xB9F7;
          (2007-12-03T10:15:30)</p>
        <p>HH:mm</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>businessHours.</p>
        <p>close</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xB0A0;&#xC9DC;, &#xC2DC;&#xAC04; &#xC815;&#xBCF4;&#xB85C; ISO 8601 &#xD3EC;&#xB9F7;
          (2007-12-03T10:15:30)</p>
        <p>HH:mm</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>businessHours.</p>
        <p>info</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xBD80;&#xAC00;&#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">history</td>
      <td style="text-align:left">object</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xD1B5;&#xD654; &#xAE30;&#xB85D;&#xC744; &#xC704;&#xD55C; &#xC815;&#xBCF4;</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>history.</p>
        <p>time</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xB0A0;&#xC9DC;, &#xC2DC;&#xAC04; &#xC815;&#xBCF4;&#xB85C; ISO 8601 &#xD3EC;&#xB9F7;
        (2007-12-03T10:15:30)</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>history.</p>
        <p>type</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>OUT</b> - &#xBC1C;&#xC2E0; &#xD1B5;&#xD654; (Outgoing call)</li>
          <li><b>OUT_CANCELED</b> - &#xBC1C;&#xC2E0; &#xC5F0;&#xACB0; &#xC548; &#xB428;
            (Outgoing call canceled)</li>
          <li><b>IN</b> - &#xC218;&#xC2E0; &#xD1B5;&#xD654; (Incoming call)</li>
          <li><b>REJECTED</b> - &#xC218;&#xC2E0; &#xAC70;&#xC808; (Rejected call)</li>
          <li><b>MISSED</b> - &#xBD80;&#xC7AC;&#xC911; &#xD1B5;&#xD654; (Missed call)</li>
          <li><b>VOICE_MESSAGE</b> - &#xC74C;&#xC131; &#xBA54;&#xC2DC;&#xC9C0; (Voice
            message)</li>
          <li><b>BLOCKED</b> - &#xC218;&#xC2E0; &#xCC28;&#xB2E8; (Blocked)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>history.</p>
        <p>callType</p>
      </td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <ul>
          <li><b>NORMAL</b> - &#xC77C;&#xBC18;&#xD1B5;&#xD654;</li>
          <li><b>VIDEO</b> - &#xC601;&#xC0C1;&#xD1B5;&#xD654;</li>
          <li><b>CALLAR</b> - &#xCF5C;&#xB77C; &#xC601;&#xC0C1;&#xD1B5;&#xD654;</li>
          <li><b>GROUP</b> - &#xADF8;&#xB8F9;&#xD1B5;&#xD654;</li>
          <li><b>VOICE_MESSAGE - &#xC74C;&#xC131; &#xBA54;&#xC2DC;&#xC9C0; (Voice message)</b>
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">numInCallHistory</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xBC1C;&#xC2E0;&#xAE30;&#xB85D; &#xD788;&#xC2A4;&#xD1A0;&#xB9AC;&#xC5D0;
          &#xC874;&#xC7AC;&#xD558;&#xB294; &#xAC74;&#xC218;</p>
        <p>0, 1, 2, ... &#xAC12;&#xC744; string &#xD615;&#xD0DC;&#xB85C; &#xBC1B;&#xC74C;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790; &#xCD94;&#xAC00; &#xC815;&#xBCF4;&#xB97C; &#xC2DD;&#xBCC4;&#xD558;&#xAE30;
          &#xC704;&#xD574; &#xC784;&#xC758;&#xB85C; &#xC815;&#xC758;&#xD55C; key&#xAC12;&#xC744;
          &#xD3EC;&#xD568;</p>
        <p>unique &#xC5EC;&#xBD80;&#xB294; &#xC0AC;&#xC6A9;&#xB418;&#xB294; &#xC6A9;&#xB3C4;&#xC5D0;
          &#xC758;&#xD574; &#xACB0;&#xC815;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">score</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">&#xAC80;&#xC0C9; &#xACB0;&#xACFC;&#xC758; &#xC2E0;&#xB8B0;&#xB3C4;</td>
    </tr>
    <tr>
      <td style="text-align:left">contacts</td>
      <td style="text-align:left">array of Contact</td>
      <td style="text-align:left">N</td>
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

