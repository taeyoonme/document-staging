# 구성요소

NUGU SDK는 총 7개의 다음과 같은 모듈들로 구성되어 있습니다. 

* **안드로이드 의존적인 Nugu SDK 모듈 \(4가지\)**
* **플랫폼 독립적인 Nugu SDK 모듈 \(3가지\)**
* Nugu SDK를 사용하는데 필요한 기타 내부 라이브러리\(변경 가능\)
* Nugu SDK를 사용하는 애플리케이션

![](../../../.gitbook/assets/android-components-diagram.png)

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xBAA8;&#xB4C8;</th>
      <th style="text-align:left">&#xC124;&#xBA85;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">NuguInterface</td>
      <td style="text-align:left">Nugu SDK&#xB97C; &#xAD6C;&#xC131;&#xD558;&#xB294; &#xD544;&#xC218; &#xC694;&#xC18C;&#xC5D0;
        &#xB300;&#xD55C; &#xC778;&#xD130;&#xD398;&#xC774;&#xC2A4;&#xC640; &#xB370;&#xC774;&#xD130;
        &#xD0C0;&#xC785; &#xB4F1;&#xC744; &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NuguCore</td>
      <td style="text-align:left">Nugu &#xC11C;&#xBE44;&#xC2A4; &#xC774;&#xC6A9;&#xC5D0; &#xD544;&#xC694;&#xD55C;
        &#xAD6C;&#xC131;&#xC694;&#xC18C;&#xB4E4;&#xC758; &#xAE30;&#xBCF8; &#xAD6C;&#xD604;&#xC744;
        &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NuguClientKit</td>
      <td style="text-align:left">&#xD50C;&#xB7AB;&#xD3FC; &#xB3C5;&#xB9BD;&#xC801;&#xC778; &#xC5B4;&#xD50C;&#xB9AC;&#xCF00;&#xC774;&#xC158;&#xC5D0;
        &#xC27D;&#xAC8C; Nugu&#xB97C; &#xC801;&#xC6A9;&#xD560; &#xC218; &#xC788;&#xB3C4;&#xB85D;
        &#xB3C4;&#xC640;&#xC904; &#xC218; &#xC788;&#xB294; &#xD074;&#xB798;&#xC2A4;&#xB4E4;&#xC744;
        &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NuguAndroidHelper</td>
      <td style="text-align:left">&#xC548;&#xB4DC;&#xB85C;&#xC774;&#xB4DC; &#xC5B4;&#xD50C;&#xB9AC;&#xCF00;&#xC774;&#xC158;&#xC5D0;
        &#xC27D;&#xAC8C; Nugu&#xB97C; &#xC801;&#xC6A9;&#xD560; &#xC218; &#xC788;&#xB3C4;&#xB85D;
        &#xB3C4;&#xC640;&#xC904; &#xC218; &#xC788;&#xB294; &#xD074;&#xB798;&#xC2A4;&#xB4E4;&#xC744;
        &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;. &#xC5EC;&#xAE30;&#xC5D0;&#xB294;
        &#xC548;&#xB4DC;&#xB85C;&#xC774;&#xB4DC; &#xD504;&#xB808;&#xC784;&#xC6CD;&#xC5D0;&#xC11C;
        &#xC81C;&#xACF5;&#xD558;&#xB294; &#xB2E4;&#xC591;&#xD55C; &#xC694;&#xC18C;(&#xBBF8;&#xB514;&#xC5B4;
        &#xD50C;&#xB808;&#xC774;&#xC5B4;, &#xC624;&#xB514;&#xC624; &#xB179;&#xC74C;,
        &#xB85C;&#xADF8;, &#xBCFC;&#xB968; &#xC81C;&#xC5B4;)&#xC5D0; &#xB300;&#xD55C;
        &#xC774;&#xC2DD; &#xAD6C;&#xD604;&#xB3C4; &#xD3EC;&#xD568;&#xB429;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">
        <p>NuguInternal</p>
        <p>LibraryPorting</p>
      </td>
      <td style="text-align:left">Nugu &#xC11C;&#xBE44;&#xC2A4;&#xB97C; &#xC0AC;&#xC6A9;&#xD558;&#xAE30;
        &#xC704;&#xD574;&#xC11C;&#xB294; &#xB2E4;&#xC591;&#xD55C; &#xC694;&#xC18C;(&#xBC1C;&#xD654;
        &#xD0A4;&#xC6CC;&#xB4DC; &#xC778;&#xC2DD;, &#xBC1C;&#xD654; &#xC2DC;&#xC791;/&#xB05D;
        &#xC778;&#xC2DD; &#xB4F1;)&#xB4E4;&#xC774; &#xD544;&#xC694;&#xD569;&#xB2C8;&#xB2E4;.
        &#xC774;&#xC5D0; &#xB300;&#xD55C; &#xBAA8;&#xB4E0; &#xC694;&#xC18C;&#xB97C;
        SDK&#xC5D0;&#xC11C; &#xC9C1;&#xC811; &#xC81C;&#xACF5;&#xD558;&#xC9C0; &#xC54A;&#xAE30;&#xC5D0;
        &#xB2E4;&#xB978; &#xB77C;&#xC774;&#xBE0C;&#xB7EC;&#xB9AC;&#xB97C; &#xC774;&#xC6A9;&#xD569;&#xB2C8;&#xB2E4;.
        &#xC774; &#xB77C;&#xC774;&#xBE0C;&#xB7EC;&#xB9AC;&#xB4E4;&#xC744; Nugu&#xC5D0;&#xC11C;
        &#xC0AC;&#xC6A9;&#xD560; &#xC218; &#xC788;&#xB3C4;&#xB85D; Nugu Interface&#xB97C;
        &#xC900;&#xC218;&#xD55C; &#xC774;&#xC2DD; &#xAD6C;&#xD604;&#xC744; &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NuguUXKit</td>
      <td style="text-align:left">Nugu&#xC758; &#xB514;&#xC790;&#xC778; &#xAC00;&#xC774;&#xB4DC;&#xB97C;
        &#xC900;&#xC218;&#xD558;&#xB294; UX &#xC694;&#xC18C;&#xB97C; &#xD3EC;&#xD568;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
    <tr>
      <td style="text-align:left">NuguLoginKit</td>
      <td style="text-align:left">Nugu&#xC5D0; &#xC27D;&#xAC8C; &#xB85C;&#xADF8;&#xC778;&#xD560; &#xC218;
        &#xC788;&#xB3C4;&#xB85D; &#xB3C4;&#xC640;&#xC8FC;&#xB294; &#xAE30;&#xB2A5;&#xC744;
        &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</td>
    </tr>
  </tbody>
</table>위 구성요소 중 Nugu 서비스 개발에 필요한 **필수 모듈은 Nugu Interface와 Nugu Core 두 가지** 로 **Java를 지원하는 모든 기기에서 동작할 수 있게 이루어져 있습니다.**

