# 구성요소

## Overview

Linux SDK는 크게 아래와 같이 구성되어 있습니다.

![](../../../.gitbook/assets/open-sdk-architecture-linux.png)

Application 개발자를 위해 `NuguClientKit`, `NuguInterface`, `NuguCore` 모듈을 제공하고 있고, 디바이스 특성에 맞게 장치 연동 부분을 쉽게 개발할 수 있도록 `Plug-in` 개발 모듈을 제공하고 있습니다.

| 모듈 | 설명 |
| :--- | :--- |
| `NuguClientKit` | NUGU 서비스를 쉽게 개발할 수 있는 API를 제공합니다. |
| `NuguInterface` | Capability를 쉽게 제어할 수 있는 API를 제공합니다. |
| `NuguCore` | NUGU 서비스 개발에 필요한 구성요소들을 제공합니다. |

## Dependency

Linux SDK는 아래의 외부 library를 사용하고 있습니다. 때문에 사용하고 있는 Linux 시스템에 아래 패키지들이 설치되어 있어야 합니다. `apt-get` 명령으로 Linux SDK 패키지를 설치하면 의존성으로 인해 아래 패키지들도 자동으로 같이 설치됩니다.

| 이름 | 패키지명 | 라이센스 |
| :--- | :--- | :--- |


<table>
  <thead>
    <tr>
      <th style="text-align:left">PortAudio</th>
      <th style="text-align:left">
        <p>libportaudio2</p>
        <p>portaudio19-dev</p>
      </th>
      <th style="text-align:left"><a href="http://www.portaudio.com/license.html">MIT</a>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">Alsa</th>
      <th style="text-align:left">
        <p>libasound2</p>
        <p>libasound2-dev</p>
      </th>
      <th style="text-align:left"><a href="https://git.alsa-project.org/?p=alsa-lib.git;a=blob;f=COPYING;h=ae23fcfda2da8599b52baff4c257847205d78c56;hb=HEAD">LGPL</a>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">Opus</th>
      <th style="text-align:left">
        <p>libopus0</p>
        <p>libopus-dev</p>
      </th>
      <th style="text-align:left"><a href="https://git.xiph.org/?p=opus.git;a=blob;f=LICENSE_PLEASE_READ.txt;h=bc88efa6cb05789a6a6e697577ae6d8e5532e5df;hb=HEAD">BSD</a>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">GStreamer</th>
      <th style="text-align:left">
        <p>libgstreamer1.0-0</p>
        <p>libgstreamer1.0-dev</p>
        <p>libgstreamer-plugins-base1.0-0</p>
        <p>libgstreamer-plugins-base1.0-dev</p>
      </th>
      <th style="text-align:left"><a href="https://gstreamer.freedesktop.org/documentation/application-development/appendix/licensing.html?gi-language=c">LGPL</a>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">GLib</th>
      <th style="text-align:left">
        <p>libglib2.0</p>
        <p>libglib2.0-dev</p>
      </th>
      <th style="text-align:left"><a href="https://developer.gnome.org/glib/stable/glib.html">LGPL</a>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">SSL</th>
      <th style="text-align:left">
        <p>libssl1.1 (bionic) or libssl1.0.0 (xenial)</p>
        <p>libssl-dev</p>
      </th>
      <th style="text-align:left">
        <p><a href="https://www.openssl.org/source/license.html">Apache v2 (&gt;=3.0.0)</a>
        </p>
        <p><a href="https://www.openssl.org/source/license.html">dual OpenSSL and SSLeay license(&lt;3.0.0)</a>
        </p>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">zlib</th>
      <th style="text-align:left">
        <p>zlib1g</p>
        <p>zlib1g-dev</p>
      </th>
      <th style="text-align:left"><a href="https://www.zlib.net/zlib_license.html">zlib</a>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">nugu-wwd</th>
      <th style="text-align:left">
        <p>libnugu-wwd</p>
        <p>libnugu-wwd-dev</p>
      </th>
      <th style="text-align:left">Apache v2</th>
    </tr>
  </thead>
  <tbody></tbody>
</table><table>
  <thead>
    <tr>
      <th style="text-align:left">nugu-epd</th>
      <th style="text-align:left">
        <p>libnugu-epd</p>
        <p>libnugu-epd-dev</p>
      </th>
      <th style="text-align:left">Apache v2</th>
    </tr>
  </thead>
  <tbody></tbody>
</table>| 이름 | 주소 | 라이센스 |
| :--- | :--- | :--- |
| libcurl | [https://github.com/curl/curl.git](https://github.com/curl/curl.git) | [MIT style license](https://curl.haxx.se/docs/copyright.html) |
| nghttp2 | [https://github.com/nghttp2/nghttp2.git](https://github.com/nghttp2/nghttp2.git) | [MIT](https://github.com/nghttp2/nghttp2/blob/master/COPYING) |
| jsoncpp | [https://github.com/open-source-parsers/jsoncpp.git](https://github.com/open-source-parsers/jsoncpp.git) | [MIT](https://github.com/open-source-parsers/jsoncpp/blob/master/LICENSE) |

