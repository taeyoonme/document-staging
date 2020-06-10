# SmartHomeCapability

SmartHome Capability Interface는 스마트홈 기기를 제어하기 위한 규격을 의미합니다. 예를 들어 조명의 전원제어 기능을 지원하기 위해서는 PowerControl Interface를 사용할 수 있고, 조명의 밝기제어를 지원하기 위해서는 BrightnessControl Interface를 활용할 수 있습니다. 아래는 NUGU스마트홈이 지원하는 SmartHomeCapability 리스트입니다. Play builder를 통해 SmartHome play를 생성할 때 연동하고자 하는 스마트홈 기기가 지원하는 기능에 따라 SmartHomeCapability를 선택해 사용할 수 있습니다. SmartHomePlay를 제작 시 별도로 사용자 발화문을 정의할 필요가 없으며, SmartHome Device의 종류에 따라 지원하는 Capability가 상이할 수 있습니다. SmartHomeCapability는 1개 이상의 SmartHomeDirective를 보유하고 있고, SmartHomeCapability를 지원할 경우 해당 SmartHomeCapability가 보유하고 있는 모든 SmartHomeDirective를 지원해야 합니다. 하나의 기기가 복수개의 SmartHomeCapability를 지원할 수 있습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">SmartHomeCapability</th>
      <th style="text-align:left">Description</th>
      <th style="text-align:left">Supported SmartHomeDevice</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"> <a href="airflowcontrol-interface.md">AirflowControl</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xD48D;&#xB7C9;&#xC81C;&#xC5B4;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xD2B9;&#xC815;
        &#xD48D;&#xB7C9;&#xC744; &#xC124;&#xC815;&#xD558;&#xAC70;&#xB098; &#xD48D;&#xB7C9;
        &#xB2E8;&#xACC4;&#xB97C; &#xC0C1;&#xD5A5;, &#xD558;&#xD5A5; &#xC870;&#xC815;&#xD558;&#xB294;
        &#xB4F1;&#xC758; Directive&#xB4E4;&#xB85C; &#xAD6C;&#xC131;&#xB418;&#xC5B4;
        &#xC788;&#xC73C;&#xBA70; &#xD32C; &#xBC0F; &#xD48D;&#xB7C9;, &#xD48D;&#xC18D;&#xC744;
        &#xC81C;&#xC5B4;&#xD560; &#xC218; &#xC788;&#xB294; &#xAE30;&#xB2A5;&#xC774;
        &#xC788;&#xB294; &#xBAA8;&#xB4E0; SmartHomeDevice&#xB97C; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomedevicetype/type-2.md">&#xAC00;&#xC2B5;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-4-1.md">&#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-8.md">&#xC120;&#xD48D;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-14.md">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-15.md">&#xC5D0;&#xC5B4;&#xCEE8;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-20.md">&#xC81C;&#xC2B5;&#xAE30;</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="airqualitycheck-interface.md">AirQualityCheck</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC5D0;&#xC11C; &#xC8FC;&#xBCC0; &#xACF5;&#xAE30; &#xC0C1;&#xD0DC;&#xB97C;
        &#xCE21;&#xC815;&#xD558;&#xB294; &#xBC29;&#xC2DD;&#xC5D0; &#xB300;&#xD55C;
        &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xACF5;&#xAE30;&#xC9C8;&#xC740;
        1&#xBD80;&#xD130; 10&#xB2E8;&#xACC4;&#xAE4C;&#xC9C0;&#xC758; &#xB2E8;&#xACC4;&#xB85C;
        &#xC751;&#xB2F5;&#xD560; &#xC218; &#xC788;&#xC73C;&#xBA70; &#xC22B;&#xC790;&#xAC00;
        &#xC791;&#xC744;&#xC218;&#xB85D; &#xACF5;&#xAE30;&#xC9C8;&#xC774; &#xC88B;&#xC740;
        &#xC0C1;&#xD0DC;&#xC785;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomedevicetype/type-4.md">&#xACF5;&#xAE30;&#xC13C;&#xC11C;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-4-1.md">&#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-14.md">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-15.md">&#xC5D0;&#xC5B4;&#xCEE8;</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="brightnesscontrol-interface.md">BrightnessControl</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xBC1D;&#xAE30;&#xC81C;&#xC5B4;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;
        &#xAE30;&#xAE30;&#xC758; &#xBC1D;&#xAE30;&#xB294; 1&#xBD80;&#xD130; 100&#xB2E8;&#xACC4;&#xB85C;
        &#xC81C;&#xC5B4;&#xD560; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left"><a href="../smarthomedevicetype/type-21.md">&#xC870;&#xBA85;</a>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="chargecontrol-interface.md">ChargeControl</a>
      </td>
      <td style="text-align:left">NUGU&#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xCDA9;&#xC804;&#xAD00;&#xB828; &#xAE30;&#xB2A5;&#xB4E4;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xCDA9;&#xC804;
        &#xAE30;&#xB2A5;&#xC774; &#xC788;&#xB294; &#xBAA8;&#xB4E0; SmartHomeDevice&#xB97C;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left"><a href="../smarthomedevicetype/type-6.md">&#xB85C;&#xBD07;&#xCCAD;&#xC18C;&#xAE30;</a>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="colorcontrol-interface.md">ColorControl</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xC124;&#xC815;&#xB41C; &#xC0C9; &#xC81C;&#xC5B4;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xC2A4;&#xB9C8;&#xD2B8;
        &#xC870;&#xBA85; &#xB4F1;&#xC758; &#xC0C9;&#xC0C1; &#xBCC0;&#xACBD;&#xC744;
        &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left"><a href="../smarthomedevicetype/type-21.md">&#xC870;&#xBA85;</a>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="devicetemperaturecontrol-interface.md">DeviceTemperatureControl</a>
      </td>
      <td style="text-align:left">NUGU&#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice &#xC790;&#xCCB4;&#xC758; &#xC628;&#xB3C4;&#xC81C;&#xC5B4;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. TemperatureControl
        Interface&#xAC00; &#xC8FC;&#xBCC0; &#xC628;&#xB3C4;&#xC5D0; &#xB300;&#xD55C;
        &#xC81C;&#xC5B4; &#xBA85;&#xB839;&#xC774;&#xB77C;&#xBA74; DeviceTemperatureControl
        Interface&#xB294; &#xD574;&#xB2F9; SmartHomeDevice &#xC790;&#xCCB4;&#xC758;
        &#xC628;&#xB3C4; &#xC124;&#xC815;&#xC5D0; &#xB300;&#xD55C; &#xBA85;&#xB839;&#xC73C;&#xB85C;
        &#xAD6C;&#xC131;&#xB418;&#xC5B4; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomedevicetype/type-5.md">&#xB0C9;&#xC7A5;&#xACE0;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-17.md">&#xC624;&#xBE10;</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="humiditycontrol-interface.md">HumidityControl</a>
      </td>
      <td style="text-align:left">NUGU&#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xC2B5;&#xB3C4;&#xC81C;&#xC5B4;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xC81C;&#xC5B4;&#xD558;&#xACE0;&#xC790;
        &#xD558;&#xB294; &#xC2B5;&#xB3C4;&#xB294; &#xD574;&#xB2F9; &#xACF5;&#xAC04;&#xC758;
        &#xC2B5;&#xB3C4; &#xBE44;&#xC728;&#xB85C; %&#xB2E8;&#xC704;&#xB85C; &#xC124;&#xC815;&#xD558;&#xBA70;
        &#xC2B5;&#xB3C4;&#xB97C; &#xC81C;&#xC5B4;&#xD558;&#xB294; &#xAE30;&#xB2A5;&#xC744;
        &#xAC00;&#xC9C4; SmartHomeDevice&#xB4E4;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomedevicetype/type-14.md">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-20.md">&#xC81C;&#xC2B5;&#xAE30;</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="modecontrol-interface.md">ModeControl</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xBAA8;&#xB4DC;&#xC124;&#xC815;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. NUGU&#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0;&#xB294;
        &#xC0AC;&#xC804;&#xC5D0; &#xC815;&#xC758;&#xB41C; &#xBAA8;&#xB4DC;&#xBA85;&#xB4E4;&#xC774;
        &#xC788;&#xC73C;&#xBA70; &#xB2E4;&#xC591;&#xD55C; &#xD45C;&#xD604;&#xC744;
        &#xC815;&#xADDC;&#xD654;&#xD558;&#xC5EC; &#xC815;&#xC758;&#xB41C; &#xBAA8;&#xB4DC;&#xBA85;&#xC73C;&#xB85C;
        &#xC81C;&#xC5B4; &#xC694;&#xCCAD;&#xC744; &#xBCF4;&#xB0C5;&#xB2C8;&#xB2E4;.
        IoT ServiceProvider&#xB294; &#xC81C;&#xC5B4; &#xB300;&#xC0C1;&#xC778; &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;
        &#xAE30;&#xAE30;&#xC758; &#xD2B9;&#xC131;&#xACFC; &#xBAA8;&#xB4DC;&#xBA85;&#xC73C;&#xB85C;
        &#xC801;&#xD569;&#xD55C; &#xAE30;&#xB2A5;&#xC744; &#xC81C;&#xC5B4;&#xD558;&#xAC8C;
        &#xB429;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomedevicetype/type-2.md">&#xAC00;&#xC2B5;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-4-1.md">&#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-5.md">&#xB0C9;&#xC7A5;&#xACE0;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-7.md">&#xBCF4;&#xC77C;&#xB7EC;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-8.md">&#xC120;&#xD48D;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-14.md">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-15.md">&#xC5D0;&#xC5B4;&#xCEE8;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-20.md">&#xC81C;&#xC2B5;&#xAE30;</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="powercheck-interface.md">PowerCheck</a>
      </td>
      <td style="text-align:left">NUGU&#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xC804;&#xB825;&#xB7C9;&#xAD00;&#xB828; &#xC870;&#xD68C;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;
        &#xAE30;&#xAE30;&#xC758; &#xC0AC;&#xC6A9;&#xC804;&#xB825;&#xB7C9;, &#xBAA9;&#xD45C;&#xC804;&#xB825;&#xB7C9;
        &#xB4F1;&#xC758; &#xC870;&#xD68C; &#xAE30;&#xB2A5;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomedevicetype/type-11.md">&#xC2A4;&#xB9C8;&#xD2B8;&#xD50C;&#xB7EC;&#xADF8;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-13.md">&#xC5D0;&#xB108;&#xC9C0;&#xBBF8;&#xD130;</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="powercontrol-interface.md">PowerControl</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xC804;&#xC6D0;&#xC81C;&#xC5B4;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xC804;&#xC6D0;&#xC744;
        &#xCF1C;&#xACE0; &#xB044;&#xAC70;&#xB098; &#xB3D9;&#xC791;&#xC744; &#xC2DC;&#xC791;,
        &#xC911;&#xC9C0;&#xD560; &#xC218; &#xC788;&#xB294; &#xBAA8;&#xB4E0; &#xC885;&#xB958;&#xC758;
        SmartHomeDevice&#xB97C; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomedevicetype/type-1.md">&#xAC00;&#xC2A4;&#xCC28;&#xB2E8;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-2.md">&#xAC00;&#xC2B5;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-3.md">&#xAC74;&#xC870;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-4-1.md">&#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-6.md">&#xB85C;&#xBD07;&#xCCAD;&#xC18C;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-7.md">&#xBCF4;&#xC77C;&#xB7EC;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-8.md">&#xC120;&#xD48D;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-9.md">&#xC138;&#xD0C1;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-10.md">&#xC2A4;&#xB9C8;&#xD2B8;&#xC2A4;&#xC704;&#xCE58;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-11.md">&#xC2A4;&#xB9C8;&#xD2B8;&#xD50C;&#xB7EC;&#xADF8;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-12.md">&#xC2DD;&#xAE30;&#xC138;&#xCC99;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-14.md">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-15.md">&#xC5D0;&#xC5B4;&#xCEE8;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-17.md">&#xC624;&#xBE10;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-18.md">&#xC758;&#xB958;&#xAD00;&#xB9AC;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-20.md">&#xC81C;&#xC2B5;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-21.md">&#xC870;&#xBA85;</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="settimecontrol-interface.md">SetTimeControl</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xC81C;&#xC5B4;&#xC2DC;&#xAC04;&#xC124;&#xC815;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;
        &#xAE30;&#xAE30;&#xC758; &#xC885;&#xB8CC;&#xC608;&#xC57D;&#xC124;&#xC815;
        &#xB4F1;&#xC744; &#xAD00;&#xB9AC;&#xD560; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">
        <p><a href="../smarthomedevicetype/type-2.md">&#xAC00;&#xC2B5;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-4-1.md">&#xACF5;&#xAE30;&#xCCAD;&#xC815;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-7.md">&#xBCF4;&#xC77C;&#xB7EC;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-8.md">&#xC120;&#xD48D;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-11.md">&#xC2A4;&#xB9C8;&#xD2B8;&#xD50C;&#xB7EC;&#xADF8;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-14.md">&#xC5D0;&#xC5B4;&#xC6CC;&#xC154;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-15.md">&#xC5D0;&#xC5B4;&#xCEE8;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-20.md">&#xC81C;&#xC2B5;&#xAE30;</a>
        </p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="statecheck-interface.md">StateCheck</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xC0C1;&#xD0DC;&#xC870;&#xD68C;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomedevicetype/type-12.md">&#xC2DD;&#xAE30;&#xC138;&#xCC99;&#xAE30;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-16.md">&#xC5F4;&#xB9BC;&#xAC10;&#xC9C0;&#xC13C;&#xC11C;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-17.md">&#xC624;&#xBE10;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-18.md">&#xC758;&#xB958;&#xAD00;&#xB9AC;&#xAE30;</a>
          <br
          /><a href="../smarthomedevicetype/type-19.md">&#xC815;&#xC218;&#xAE30;</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"> <a href="temperaturecontrol-interface.md">TemperatureControl</a>
      </td>
      <td style="text-align:left">NUGU &#xC2A4;&#xB9C8;&#xD2B8;&#xD648;&#xC5D0; &#xB4F1;&#xB85D;&#xB41C;
        SmartHomeDevice&#xC758; &#xC628;&#xB3C4;&#xC81C;&#xC5B4;&#xBC29;&#xC2DD;&#xC5D0;
        &#xB300;&#xD55C; &#xC124;&#xBA85;&#xC785;&#xB2C8;&#xB2E4;. TemperatureControl
        Interface&#xB294; &#xC8FC;&#xBCC0; &#xC628;&#xB3C4;&#xB97C; &#xD2B9;&#xC815;
        &#xC628;&#xB3C4;&#xB85C; &#xC124;&#xC815;&#xD558;&#xAE30; &#xC704;&#xD55C;
        &#xC2A4;&#xB9C8;&#xD2B8;&#xD648; &#xAE30;&#xAE30;&#xC758; &#xC81C;&#xC5B4;
        &#xBA85;&#xB839;&#xC785;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">
        <p><a href="../smarthomedevicetype/type-7.md">&#xBCF4;&#xC77C;&#xB7EC;</a>
        </p>
        <p><a href="../smarthomedevicetype/type-15.md">&#xC5D0;&#xC5B4;&#xCEE8;</a>
        </p>
      </td>
    </tr>
  </tbody>
</table>

