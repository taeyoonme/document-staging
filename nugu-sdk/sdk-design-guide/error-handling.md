# Error handling

누구 서비스와 연결 실패하여 디바이스에 저장된 연결 오류 안내를 출력내야 하는 경우는 다음과 같습니다.



<table>
  <thead>
    <tr>
      <th style="text-align:left">Error &#xC0C1;&#xD669;</th>
      <th style="text-align:left">Error message</th>
      <th style="text-align:left">&#xC74C;&#xC6D0; &#xD30C;&#xC77C;&#xBA85;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">Device G/W &#xC811;&#xC18D; &#xC5D0;&#xB7EC;
        <br />(&#xB124;&#xD2B8;&#xC6CC;&#xD06C; &#xC0AC;&#xC6A9; &#xBD88;&#xAC00;)</td>
      <td
      style="text-align:left">&#xC778;&#xD130;&#xB137;&#xC5D0; &#xC5F0;&#xACB0;&#xD560; &#xC218; &#xC5C6;&#xC2B5;&#xB2C8;&#xB2E4;.
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC758; &#xC778;&#xD130;&#xB137; &#xC5F0;&#xACB0;
        &#xC0C1;&#xD0DC;&#xB97C; &#xD655;&#xC778;&#xD574;&#xC8FC;&#xC138;&#xC694;.</td>
        <td
        style="text-align:left">device_GW_error_001</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>Device G/W &#xC811;&#xC18D; &#xC5D0;&#xB7EC;</p>
        <p>(&#xAC8C;&#xC774;&#xD2B8;&#xC6E8;&#xC774;/&#xC778;&#xC99D; &#xC11C;&#xBC84;
          &#xC7A5;&#xC560;&#xB85C; &#xC811;&#xC18D; &#xBD88;&#xAC00;)</p>
      </td>
      <td style="text-align:left">&#xB204;&#xAD6C; &#xC11C;&#xBE44;&#xC2A4;&#xC640; &#xC5F0;&#xACB0;&#xD560;
        &#xC218; &#xC5C6;&#xC2B5;&#xB2C8;&#xB2E4;. &#xC7A0;&#xC2DC; &#xD6C4; &#xB2E4;&#xC2DC;
        &#xB9D0;&#xC500;&#xD574;&#xC8FC;&#xC138;&#xC694;.</td>
      <td style="text-align:left">device_GW_error_002</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>Device G/W &#xC778;&#xC99D; &#xC5D0;&#xB7EC;</p>
        <p>(Access &#xD1A0;&#xD070; &#xC778;&#xC99D; &#xC5D0;&#xB7EC;)</p>
      </td>
      <td style="text-align:left">&#xB204;&#xAD6C; &#xC11C;&#xBE44;&#xC2A4;&#xC640; &#xC5F0;&#xACB0;&#xD560;
        &#xC218; &#xC5C6;&#xC2B5;&#xB2C8;&#xB2E4;. &#xB514;&#xBC14;&#xC774;&#xC2A4;
        &#xC5F0;&#xACB0; &#xC815;&#xBCF4;&#xB97C; &#xBCC0;&#xACBD; &#xD574;&#xC8FC;&#xC138;&#xC694;.</td>
      <td
      style="text-align:left">device_GW_error_003</td>
    </tr>
    <tr>
      <td style="text-align:left">Device G/W&#xC5D0; &#xC694;&#xCCAD; &#xD6C4; &#xC751;&#xB2F5; &#xC5C6;&#xC74C;
        (&#xD0C0;&#xC784;&#xC544;&#xC6C3;)</td>
      <td style="text-align:left">&#xB204;&#xAD6C; &#xC11C;&#xBE44;&#xC2A4;&#xC640;&#xC758; &#xC5F0;&#xACB0;&#xC774;
        &#xC6D0;&#xD65C;&#xD558;&#xC9C0; &#xC54A;&#xC2B5;&#xB2C8;&#xB2E4;. &#xC7A0;&#xC2DC;
        &#xD6C4; &#xB2E4;&#xC2DC; &#xB9D0;&#xC500;&#xD574;&#xC8FC;&#xC138;&#xC694;.</td>
      <td
      style="text-align:left">device_GW_error_004</td>
    </tr>
    <tr>
      <td style="text-align:left">Device G/W&#xC5D0; &#xC694;&#xCCAD; &#xCC98;&#xB9AC; &#xC548;&#xB428;</td>
      <td
      style="text-align:left">&#xD604;&#xC7AC; &#xB204;&#xAD6C; &#xC11C;&#xBE44;&#xC2A4;&#xC640;&#xC758;
        &#xC5F0;&#xACB0;&#xC774; &#xC6D0;&#xD65C;&#xD558;&#xC9C0; &#xC54A;&#xC2B5;&#xB2C8;&#xB2E4;.
        &#xC7A0;&#xC2DC; &#xD6C4; &#xB2E4;&#xC2DC; &#xC2DC;&#xB3C4;&#xD574; &#xC8FC;&#xC138;&#xC694;.</td>
        <td
        style="text-align:left">device_GW_error_005</td>
    </tr>
    <tr>
      <td style="text-align:left">Device G/W&#xC5D0;&#xC11C; TTS &#xC5F0;&#xB3D9; &#xC2E4;&#xD328;</td>
      <td
      style="text-align:left">&#xB204;&#xAD6C; &#xC11C;&#xBE44;&#xC2A4; &#xC911;&#xC5D0; &#xBB38;&#xC81C;&#xAC00;
        &#xBC1C;&#xC0DD;&#xD588;&#xC5B4;&#xC694;. &#xC7A0;&#xC2DC; &#xD6C4; &#xB2E4;&#xC2DC;
        &#xB9D0;&#xC500;&#xD574;&#xC8FC;&#xC138;&#xC694;.</td>
        <td style="text-align:left">device_GW_error_006</td>
    </tr>
    <tr>
      <td style="text-align:left">Device G/W&#xC5D0;&#xC11C; PR &#xC5F0;&#xB3D9; &#xC2E4;&#xD328;</td>
      <td
      style="text-align:left">&#xB204;&#xAD6C; &#xC11C;&#xBE44;&#xC2A4; &#xC911;&#xC5D0; &#xBB38;&#xC81C;&#xAC00;
        &#xBC1C;&#xC0DD;&#xD588;&#xC5B4;&#xC694;. &#xC7A0;&#xC2DC; &#xD6C4; &#xB2E4;&#xC2DC;
        &#xB9D0;&#xC500;&#xD574;&#xC8FC;&#xC138;&#xC694;.</td>
        <td style="text-align:left">device_GW_error_006</td>
    </tr>
  </tbody>
</table>

{% file src="../../.gitbook/assets/error-message.zip" %}

