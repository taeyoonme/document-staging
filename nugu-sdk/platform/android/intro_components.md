# 구성요소

NUGU SDK는 총 7개의 다음과 같은 모듈들로 구성되어 있습니다.

* **안드로이드 의존적인 Nugu SDK 모듈 \(4가지\)**
* **플랫폼 독립적인 Nugu SDK 모듈 \(3가지\)**
* Nugu SDK를 사용하는데 필요한 기타 내부 라이브러리\(변경 가능\)
* Nugu SDK를 사용하는 애플리케이션

![](../../../.gitbook/assets/android-components-diagram.png)

| 모듈 | 설명 |
| :--- | :--- |


| NuguInterface | Nugu SDK를 구성하는 필수 요소에 대한 인터페이스와 데이터 타입 등을 제공합니다. |
| :--- | :--- |


| NuguCore | Nugu 서비스 이용에 필요한 구성요소들의 기본 구현을 제공합니다. |
| :--- | :--- |


| NuguClientKit | 플랫폼 독립적인 어플리케이션에 쉽게 Nugu를 적용할 수 있도록 도와줄 수 있는 클래스들을 제공합니다. |
| :--- | :--- |


| NuguAndroidHelper | 안드로이드 어플리케이션에 쉽게 Nugu를 적용할 수 있도록 도와줄 수 있는 클래스들을 제공합니다. 여기에는 안드로이드 프레임웍에서 제공하는 다양한 요소\(미디어 플레이어, 오디오 녹음, 로그, 볼륨 제어\)에 대한 이식 구현도 포함됩니다. |
| :--- | :--- |


<table>
  <thead>
    <tr>
      <th style="text-align:left">
        <p>NuguInternal</p>
        <p>LibraryPorting</p>
      </th>
      <th style="text-align:left">Nugu &#xC11C;&#xBE44;&#xC2A4;&#xB97C; &#xC0AC;&#xC6A9;&#xD558;&#xAE30;
        &#xC704;&#xD574;&#xC11C;&#xB294; &#xB2E4;&#xC591;&#xD55C; &#xC694;&#xC18C;(&#xBC1C;&#xD654;
        &#xD0A4;&#xC6CC;&#xB4DC; &#xC778;&#xC2DD;, &#xBC1C;&#xD654; &#xC2DC;&#xC791;/&#xB05D;
        &#xC778;&#xC2DD; &#xB4F1;)&#xB4E4;&#xC774; &#xD544;&#xC694;&#xD569;&#xB2C8;&#xB2E4;.
        &#xC774;&#xC5D0; &#xB300;&#xD55C; &#xBAA8;&#xB4E0; &#xC694;&#xC18C;&#xB97C;
        SDK&#xC5D0;&#xC11C; &#xC9C1;&#xC811; &#xC81C;&#xACF5;&#xD558;&#xC9C0; &#xC54A;&#xAE30;&#xC5D0;
        &#xB2E4;&#xB978; &#xB77C;&#xC774;&#xBE0C;&#xB7EC;&#xB9AC;&#xB97C; &#xC774;&#xC6A9;&#xD569;&#xB2C8;&#xB2E4;.
        &#xC774; &#xB77C;&#xC774;&#xBE0C;&#xB7EC;&#xB9AC;&#xB4E4;&#xC744; Nugu&#xC5D0;&#xC11C;
        &#xC0AC;&#xC6A9;&#xD560; &#xC218; &#xC788;&#xB3C4;&#xB85D; Nugu Interface&#xB97C;
        &#xC900;&#xC218;&#xD55C; &#xC774;&#xC2DD; &#xAD6C;&#xD604;&#xC744; &#xC81C;&#xACF5;&#xD569;&#xB2C8;&#xB2E4;.</th>
    </tr>
  </thead>
  <tbody></tbody>
</table>| NuguUXKit | Nugu의 디자인 가이드를 준수하는 UX 요소를 포함합니다. |
| :--- | :--- |


| NuguLoginKit | Nugu에 쉽게 로그인할 수 있도록 도와주는 기능을 제공합니다. |
| :--- | :--- |


