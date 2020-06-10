# SmartHomeDeviceType

NUGU스마트홈은 다양한 SmartHome DeviceType을 지원하고 있습니다. IoT ServiceProvider는 Discovery에 응답할 때 사용자가 등록한 IoT기기들을 NUGU스마트홈에서 지원하는 SmartHome DeviceType 중 가장 적합한 것으로 선택해 응답해야 합니다. SmartHome DeviceType을 선택하면 NUGU 에이전트를 통해 인입되는 사용자 발화 중 해당 SmartHome DeviceType이 지원하는 사용자 발화들에 대한 자연어처리 결과 기반으로 제어 및 조회 요청이 전달됩니다. 예를 들어, SmartHome DeviceType으로 조명을 선택할 경우 모든 사용자 발화 중 조명을 제어하려는 의도를 가진 표현인지, 해당 조명 기기가 수행 가능한 제어 요청인지 검증하고, 검증된 사용자 요청에 대해 SmartHome Play를 통해 IoT ServiceProvider에게 조명 기기에 대한 제어 및 조회 요청을 전달합니다.

아래는 NUGU스마트홈이 현재 지원하고 있는 SmartHome DeviceType 리스트이며 해당 항목들은 지속적으로 업데이트 됩니다. 자세한 내용은 개별 SmartHome DeviceType 페이지를 참조해주시기 바랍니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">SmartHomeDeviceType</th>
      <th style="text-align:left">Description</th>
      <th style="text-align:left">Recommended Capability</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><a href="type-1.md">&#xAC00;&#xC2A4;&#xCC28;&#xB2E8;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xAC00;&#xC2A4;&#xCC28;&#xB2E8;&#xAE30;&#xB294; &#xB2EB;&#xB294; &#xAE30;&#xB2A5;&#xC744;
        &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;. &#xC548;&#xC804; &#xC0C1;&#xC758;
        &#xC774;&#xC720;&#xB85C; &#xC74C;&#xC131;&#xC81C;&#xC5B4; &#xC2DC; &#xC5EC;&#xB294;
        &#xAE30;&#xB2A5;&#xC740; &#xC81C;&#xACF5;&#xD558;&#xACE0; &#xC788;&#xC9C0;
        &#xC54A;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left"> <a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-2.md">&#xAC00;&#xC2B5;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xAC00;&#xC2B5;&#xAE30;&#xB294; &#xD48D;&#xB7C9; &#xC81C;&#xC5B4; &#xB4F1;&#xC744;
        &#xD1B5;&#xD574; &#xC8FC;&#xBCC0;&#xC758; &#xC2B5;&#xB3C4;&#xC0C1;&#xD0DC;&#xB97C;
        &#xC81C;&#xC5B4;&#xD558;&#xB294; &#xAE30;&#xAE30;&#xB85C; &#xC804;&#xC6D0;&#xC81C;&#xC5B4;
        &#xBC0F; &#xAC00;&#xC2B5;&#xC218;&#xC900;&#xC5D0; &#xB530;&#xB978; &#xD48D;&#xB7C9;&#xC81C;&#xC5B4;,
        &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C; &#xC9C0;&#xC6D0;&#xD558;&#xB294;
        &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;, &#xC885;&#xB8CC;&#xC608;&#xC57D;
        &#xC124;&#xC815; &#xB4F1;&#xC758; &#xAE30;&#xB2A5;&#xC744; &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/airflowcontrol-interface.md">AirflowControl</a>
        </p>
        <p><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-3.md">&#xAC74;&#xC870;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xAC74;&#xC870;&#xAE30;&#xB294; &#xC804;&#xC6D0; &#xC790;&#xCCB4;&#xB97C;
        &#xCF1C;&#xAC70;&#xB098; &#xB044;&#xC9C0; &#xC54A;&#xACE0; &#xAE30;&#xB2A5;&#xC744;
        &#xC2DC;&#xC791; &#xD639;&#xC740; &#xC911;&#xC9C0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left"><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-4.md">&#xACF5;&#xAE30;&#xC13C;&#xC11C;</a>
      </td>
      <td style="text-align:left">&#xACF5;&#xAE30;&#xC13C;&#xC11C;&#xC5D0;&#xC11C; &#xCE21;&#xC815;&#xD55C;
        &#xC8FC;&#xBCC0; &#xACF5;&#xAE30; &#xC0C1;&#xD0DC; &#xC870;&#xD68C; &#xAE30;&#xB2A5;&#xC744;
        &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left"><a href="../smarthomecapability/airqualitycheck-interface.md">AirQualityCheck</a>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-4-1.md">&#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;&#xB294; &#xC804;&#xC6D0; &#xC81C;&#xC5B4;
        &#xBC0F; &#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30; &#xC790;&#xCCB4;&#xC758;
        &#xD48D;&#xB7C9; &#xC81C;&#xC5B4;, &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C;
        &#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;,
        &#xC885;&#xB8CC;&#xC608;&#xC57D; &#xC124;&#xC815; &#xAE30;&#xB2A5; &#xB4F1;&#xC744;
        &#xC81C;&#xACF5;&#xD558;&#xBA70; &#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;&#xC5D0;&#xC11C;
        &#xCE21;&#xC815;&#xD55C; &#xC8FC;&#xBCC0; &#xACF5;&#xAE30; &#xC0C1;&#xD0DC;
        &#xC870;&#xD68C; &#xAE30;&#xB2A5;&#xB3C4; &#xC81C;&#xACF5;&#xD560; &#xC218;
        &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/airflowcontrol-interface.md">AirflowControl</a>
        </p>
        <p><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
        </p>
        <p><a href="../smarthomecapability/airqualitycheck-interface.md">AirQualityCheck</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-5.md">&#xB0C9;&#xC7A5;&#xACE0;</a>
      </td>
      <td style="text-align:left">&#xB0C9;&#xC7A5;&#xACE0;&#xB294; &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C;
        &#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;
        &#xBC0F; &#xB0C9;&#xC7A5;&#xACE0; &#xAE30;&#xAE30; &#xC790;&#xCCB4;&#xC758;
        &#xC628;&#xB3C4;&#xB97C; &#xC81C;&#xC5B4;&#xD558;&#xB294; &#xAE30;&#xB2A5;&#xC744;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/devicetemperaturecontrol-interface.md">DeviceTemperatureControl</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-6.md">&#xB85C;&#xBD07;&#xCCAD;&#xC18C;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xB85C;&#xBD07;&#xCCAD;&#xC18C;&#xAE30;&#xB294; &#xB85C;&#xBD07;&#xCCAD;&#xC18C;&#xAE30;
        &#xCCAD;&#xC18C; &#xC2DC;&#xC791; &#xBC0F; &#xC911;&#xC9C0; &#xB4F1;&#xC758;
        &#xB3D9;&#xC791; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;&#xACFC; &#xCDA9;&#xC804;
        &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/chargecontrol-interface.md">ChargeControl</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-7.md">&#xBCF4;&#xC77C;&#xB7EC;</a>
      </td>
      <td style="text-align:left">&#xBCF4;&#xC77C;&#xB7EC;&#xB294; &#xACF5;&#xAC04;&#xC5D0; &#xB300;&#xD55C;
        &#xB09C;&#xBC29; &#xC81C;&#xC5B4; &#xC7A5;&#xCE58;&#xB85C; &#xBCF4;&#xC77C;&#xB7EC;
        &#xB3D9;&#xC791;&#xC744; &#xC704;&#xD55C; &#xC804;&#xC6D0; &#xC81C;&#xC5B4;
        &#xAE30;&#xB2A5; &#xBC0F; &#xBAA9;&#xD45C; &#xC124;&#xC815; &#xC628;&#xB3C4;
        &#xC81C;&#xC5B4;, &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C; &#xC9C0;&#xC6D0;&#xD558;&#xB294;
        &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;, &#xC885;&#xB8CC;&#xC608;&#xC57D;
        &#xC124;&#xC815; &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/temperaturecontrol-interface.md">TemperatureControl</a>
        </p>
        <p><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-8.md">&#xC120;&#xD48D;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xC120;&#xD48D;&#xAE30;&#xB294; &#xC120;&#xD48D;&#xAE30; &#xB3D9;&#xC791;&#xC744;
        &#xC704;&#xD55C; &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5; &#xBC0F;
        &#xC120;&#xD48D;&#xAE30;&#xC758; &#xD48D;&#xB7C9; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;,
        &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C; &#xC9C0;&#xC6D0;&#xD558;&#xB294;
        &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;, &#xC885;&#xB8CC;&#xC608;&#xC57D;
        &#xC124;&#xC815; &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/airflowcontrol-interface.md">AirflowControl</a>
        </p>
        <p><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-9.md">&#xC138;&#xD0C1;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xC138;&#xD0C1;&#xAE30;&#xB294; &#xC804;&#xC6D0; &#xC790;&#xCCB4;&#xB97C;
        &#xCF1C;&#xAC70;&#xB098; &#xB044;&#xC9C0; &#xC54A;&#xACE0; &#xAE30;&#xB2A5;&#xC744;
        &#xC2DC;&#xC791; &#xD639;&#xC740; &#xC911;&#xC9C0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left"><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-10.md">&#xC2A4;&#xB9C8;&#xD2B8;&#xC2A4;&#xC704;&#xCE58;</a>
      </td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xC2A4;&#xC704;&#xCE58;&#xB294; &#xC2A4;&#xC704;&#xCE58;&#xB97C;
        &#xD1B5;&#xD574; &#xC81C;&#xC5B4;&#xD558;&#xB294; &#xCD5C;&#xC885; &#xAE30;&#xAE30;&#xC758;
        &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.
        &#xC2A4;&#xB9C8;&#xD2B8;&#xC2A4;&#xC704;&#xCE58;&#xB294; &#xC2A4;&#xC704;&#xCE58;&#xB97C;
        &#xC81C;&#xC5B4;&#xD568;&#xC73C;&#xB85C;&#xC368; &#xC2E4;&#xC81C;&#xB85C;
        &#xD0C0; &#xC720;&#xD615;&#xC758; &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xB97C;
        &#xCD5C;&#xC885;&#xC801;&#xC73C;&#xB85C; &#xC81C;&#xC5B4;&#xD560; &#xC218;
        &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;. &#xC774; &#xB54C; &#xB2E4;&#xC591;&#xD55C;
        &#xBA85;&#xB839;&#xC5B4;&#xB97C; &#xD1B5;&#xD55C; &#xAE30;&#xB2A5;&#xC744;
        &#xC81C;&#xACF5;&#xD558;&#xB824;&#xBA74; &#xCD5C;&#xC885;&#xC81C;&#xC5B4;&#xD558;&#xB294;
        &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30; &#xC720;&#xD615;&#xC73C;&#xB85C;
        &#xB4F1;&#xB85D;&#xD574;&#xC8FC;&#xC138;&#xC694;.</td>
      <td style="text-align:left"><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-11.md">&#xC2A4;&#xB9C8;&#xD2B8;&#xD50C;&#xB7EC;&#xADF8;</a>
      </td>
      <td style="text-align:left">&#xC2A4;&#xB9C8;&#xD2B8;&#xD50C;&#xB7EC;&#xADF8;&#xB294; &#xD50C;&#xB7EC;&#xADF8;&#xC758;
        &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;, &#xD50C;&#xB7EC;&#xADF8;&#xB97C;
        &#xD1B5;&#xD55C; &#xC804;&#xB825;&#xC0AC;&#xC6A9;&#xB7C9; &#xC870;&#xD68C;
        &#xAE30;&#xB2A5;, &#xC885;&#xB8CC;&#xC608;&#xC57D; &#xC124;&#xC815; &#xAE30;&#xB2A5;&#xC744;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/powercheck-interface.md">PowerCheck</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-12.md">&#xC2DD;&#xAE30;&#xC138;&#xCC99;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xC2DD;&#xAE30;&#xC138;&#xCC99;&#xAE30;&#xB294; &#xC804;&#xC6D0; &#xC790;&#xCCB4;&#xB97C;
        &#xCF1C;&#xAC70;&#xB098; &#xB044;&#xC9C0; &#xC54A;&#xACE0; &#xAE30;&#xB2A5;&#xC744;
        &#xC2DC;&#xC791; &#xD639;&#xC740; &#xC911;&#xC9C0;&#xD558;&#xBA70; &#xD604;&#xC7AC;
        &#xAE30;&#xAE30;&#xC758; &#xB3D9;&#xC791;&#xC0C1;&#xD0DC; &#xCCB4;&#xD06C;
        &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/statecheck-interface.md">StateCheck</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-13.md">&#xC5D0;&#xB108;&#xC9C0;&#xBBF8;&#xD130;</a>
      </td>
      <td style="text-align:left">&#xC5D0;&#xB108;&#xC9C0;&#xBBF8;&#xD130;&#xB294; &#xC804;&#xB825;&#xC0AC;&#xC6A9;&#xB7C9;&#xC744;
        &#xCE21;&#xC815;&#xD558;&#xB294; &#xAE30;&#xAE30;&#xB85C; &#xD604;&#xC7AC;
        &#xAE30;&#xAE30;&#xC758; &#xC804;&#xB825;&#xC0AC;&#xC6A9;&#xB7C9; &#xBC0F;
        &#xBAA9;&#xD45C;&#xC804;&#xB825;&#xC0AC;&#xC6A9;&#xB7C9; &#xC870;&#xD68C;
        &#xAE30;&#xB2A5; &#xB4F1;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left"><a href="../smarthomecapability/powercheck-interface.md">PowerCheck</a>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-14.md">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;</a>
      </td>
      <td style="text-align:left">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;&#xB294; &#xC5D0;&#xC5B4;&#xC6CC;&#xC154;
        &#xAE30;&#xAE30;&#xC758; &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;,
        &#xD48D;&#xB7C9; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;, &#xC5D0;&#xC5B4;&#xC6CC;&#xC154;&#xC5D0;&#xC11C;
        &#xCE21;&#xC815;&#xD55C; &#xC8FC;&#xBCC0; &#xACF5;&#xAE30;&#xC0C1;&#xD0DC;
        &#xC870;&#xD68C; &#xAE30;&#xB2A5;, &#xC885;&#xB8CC;&#xC608;&#xC57D; &#xC124;&#xC815;
        &#xAE30;&#xB2A5;, &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C; &#xC9C0;&#xC6D0;&#xD558;&#xB294;
        &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;, &#xBAA9;&#xD45C; &#xC124;&#xC815;
        &#xC2B5;&#xB3C4; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/airflowcontrol-interface.md">AirflowControl</a>
          <br
          /><a href="../smarthomecapability/airqualitycheck-interface.md">AirQualityCheck</a>
        </p>
        <p><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
        </p>
        <p><a href="../smarthomecapability/humiditycontrol-interface.md">HumidityControl</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-15.md">&#xC5D0;&#xC5B4;&#xCEE8;</a>
      </td>
      <td style="text-align:left">&#xC5D0;&#xC5B4;&#xCEE8;&#xC740; &#xACF5;&#xAC04;&#xC5D0; &#xB300;&#xD55C;
        &#xB0C9;&#xBC29; &#xC628;&#xB3C4; &#xC870;&#xC808; &#xC7A5;&#xCE58;&#xB85C;
        &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5; &#xBC0F; &#xBAA9;&#xD45C;
        &#xC628;&#xB3C4; &#xC124;&#xC815; &#xAE30;&#xB2A5;, &#xC5D0;&#xC5B4;&#xCEE8;&#xC758;
        &#xD48D;&#xB7C9; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;, &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C;
        &#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;,
        &#xC885;&#xB8CC;&#xC608;&#xC57D; &#xC124;&#xC815; &#xAE30;&#xB2A5;, &#xC5D0;&#xC5B4;&#xCEE8;&#xC5D0;&#xC11C;
        &#xCE21;&#xC815;&#xD55C; &#xC8FC;&#xBCC0; &#xACF5;&#xAE30;&#xC0C1;&#xD0DC;
        &#xC870;&#xD68C; &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/temperaturecontrol-interface.md">TemperatureControl</a>
          <br
          /><a href="../smarthomecapability/airflowcontrol-interface.md">AirflowControl</a>
          <br
          /><a href="../smarthomecapability/airqualitycheck-interface.md">AirQualityCheck</a>
        </p>
        <p><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-16.md">&#xC5F4;&#xB9BC;&#xAC10;&#xC9C0;&#xC13C;&#xC11C;</a>
      </td>
      <td style="text-align:left">&#xC5F4;&#xB9BC;&#xAC10;&#xC9C0;&#xC13C;&#xC11C;&#xB294; &#xD604;&#xC7AC;
        &#xC13C;&#xC11C;&#xC758; &#xC0C1;&#xD0DC;&#xB97C; &#xC870;&#xD68C;&#xD558;&#xB294;
        &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left"><a href="../smarthomecapability/statecheck-interface.md">StateCheck</a>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-17.md">&#xC624;&#xBE10;</a>
      </td>
      <td style="text-align:left">&#xC624;&#xBE10;&#xC740; &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;
        &#xBC0F; &#xC624;&#xBE10; &#xAE30;&#xAE30; &#xC790;&#xCCB4;&#xC758; &#xC628;&#xB3C4;&#xB97C;
        &#xC81C;&#xC5B4;&#xD558;&#xB294; &#xAE30;&#xB2A5;&#xACFC; &#xC624;&#xBE10;&#xC758;
        &#xD604;&#xC7AC; &#xC0C1;&#xD0DC;&#xB97C; &#xC870;&#xD68C;&#xD558;&#xB294;
        &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/statecheck-interface.md">StateCheck</a>
        </p>
        <p><a href="../smarthomecapability/devicetemperaturecontrol-interface.md">DeviceTemperatureControl</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-18.md">&#xC758;&#xB958;&#xAD00;&#xB9AC;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xC758;&#xB958;&#xAD00;&#xB9AC;&#xAE30;&#xB294; &#xC804;&#xC6D0; &#xC790;&#xCCB4;&#xB97C;
        &#xCF1C;&#xAC70;&#xB098; &#xB044;&#xC9C0; &#xC54A;&#xACE0; &#xAE30;&#xB2A5;&#xC744;
        &#xC2DC;&#xC791; &#xD639;&#xC740; &#xC911;&#xC9C0;&#xD558;&#xBA70; &#xC758;&#xB958;&#xAD00;&#xB9AC;&#xAE30;&#xC758;
        &#xD604;&#xC7AC; &#xC0C1;&#xD0DC;&#xB97C; &#xC870;&#xD68C;&#xD558;&#xB294;
        &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/statecheck-interface.md">StateCheck</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-19.md">&#xC815;&#xC218;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xC815;&#xC218;&#xAE30;&#xB294; &#xD604;&#xC7AC; &#xAE30;&#xAE30;&#xC758;
        &#xC0C1;&#xD0DC;&#xB97C; &#xC870;&#xD68C;&#xD558;&#xB294; &#xAE30;&#xB2A5;&#xC744;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left"><a href="../smarthomecapability/statecheck-interface.md">StateCheck</a>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-20.md">&#xC81C;&#xC2B5;&#xAE30;</a>
      </td>
      <td style="text-align:left">&#xC81C;&#xC2B5;&#xAE30;&#xB294; &#xB3D9;&#xC791;&#xC744; &#xC704;&#xD55C;
        &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5; &#xBC0F; &#xBAA9;&#xD45C;
        &#xC2B5;&#xB3C4; &#xC124;&#xC815; &#xAE30;&#xB2A5;, &#xC81C;&#xC2B5;&#xAE30;&#xC758;
        &#xD48D;&#xB7C9; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;&#xACFC; &#xAC01; &#xBAA8;&#xB378;&#xBCC4;&#xB85C;
        &#xC9C0;&#xC6D0;&#xD558;&#xB294; &#xBAA8;&#xB4DC; &#xC124;&#xC815; &#xAE30;&#xB2A5;,
        &#xC885;&#xB8CC;&#xC608;&#xC57D; &#xC124;&#xC815; &#xAE30;&#xB2A5;&#xC744;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/airflowcontrol-interface.md">AirflowControl</a>
          <br
          /><a href="../smarthomecapability/modecontrol-interface.md">ModeControl</a>
        </p>
        <p><a href="../smarthomecapability/settimecontrol-interface.md">SetTimeControl</a>
          <br
          /><a href="../smarthomecapability/humiditycontrol-interface.md">HumidityControl</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><a href="type-21.md">&#xC870;&#xBA85;</a>
      </td>
      <td style="text-align:left">&#xC870;&#xBA85;&#xC740; &#xC804;&#xC6D0; &#xC81C;&#xC5B4; &#xAE30;&#xB2A5;
        &#xBC0F; &#xBAA8;&#xB378;&#xC5D0; &#xB530;&#xB978; &#xBC1D;&#xAE30; &#xC870;&#xC808;,
        &#xC0C9;&#xC0C1; &#xBCC0;&#xACBD;&#xC5D0; &#xB300;&#xD55C; &#xAE30;&#xB2A5;&#xC744;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomecapability/powercontrol-interface.md">PowerControl</a>
        </p>
        <p><a href="../smarthomecapability/brightnesscontrol-interface.md">BrightnessControl</a>
        </p>
        <p><a href="../smarthomecapability/colorcontrol-interface.md">ColorControl</a>
        </p>
      </td>
    </tr>
  </tbody>
</table>

