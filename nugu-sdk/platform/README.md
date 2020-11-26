---
description: >-
  NUGU SDK는 iOS, Android, Linux 플랫폼을 지원합니다. 각각의 플랫폼에 맞는 언어와 특성을 따르고 있으며, 동일한 구조를
  가지고 있는 영역(Common)과 플랫폼 별로 다른 구조를 가진 영역(Depends on platform)이 구분되어 있습니다.
---

# Platform

## NUGU SDK Architecture

> NUGU SDK를 더 자세히 알아보기 위해서는 각각의 플랫폼 별 페이지를 통해 확인하실 수 있습니다.

![](../../.gitbook/assets/image-23.png)

## System Requirements

<table>
  <thead>
    <tr>
      <th style="text-align:left">Requirement</th>
      <th style="text-align:left">Android</th>
      <th style="text-align:left">iOS</th>
      <th style="text-align:left">Linux</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">OS Version</td>
      <td style="text-align:left">&gt;= Android 5.0(API level 21)</td>
      <td style="text-align:left">&gt;= iOS 10.0+</td>
      <td style="text-align:left">&gt;= Ubuntu Linux 16.04</td>
    </tr>
    <tr>
      <td style="text-align:left">Platform</td>
      <td style="text-align:left">Android</td>
      <td style="text-align:left">iOS</td>
      <td style="text-align:left">
        <p>Ubuntu Linux</p>
        <p>Raspberry Pi</p>
        <p>Generic Linux</p>
        <p>ODROID-XU4</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">Language</td>
      <td style="text-align:left">Kotlin</td>
      <td style="text-align:left">Swift</td>
      <td style="text-align:left">C, C++</td>
    </tr>
    <tr>
      <td style="text-align:left">Architecture</td>
      <td style="text-align:left">arm7, arm64</td>
      <td style="text-align:left">arm7, arm64</td>
      <td style="text-align:left">x86_64, arm64, armhf</td>
    </tr>
    <tr>
      <td style="text-align:left">Repository</td>
      <td style="text-align:left">Github</td>
      <td style="text-align:left">Github</td>
      <td style="text-align:left">Github</td>
    </tr>
    <tr>
      <td style="text-align:left">Release</td>
      <td style="text-align:left">Maven</td>
      <td style="text-align:left">
        <p>Cocoapods</p>
        <p>Carthage</p>
      </td>
      <td style="text-align:left">APT repository</td>
    </tr>
    <tr>
      <td style="text-align:left">Storage
        <br />
        <br />
      </td>
      <td style="text-align:left">
        <p>Touch&#xB85C;&#xB9CC; wake up: 13MB</p>
        <p>Wake up word 1&#xAC1C;: 14MB</p>
        <p>Wake up word 2&#xAC1C;: 15MB</p>
      </td>
      <td style="text-align:left">
        <p>Touch&#xB85C;&#xB9CC; wake up: 14MB</p>
        <p>Wake up word 1&#xAC1C;: 15MB</p>
        <p>Wake up word 2&#xAC1C;: 16MB</p>
      </td>
      <td style="text-align:left">
        <p>Touch&#xB85C;&#xB9CC; wake up: 6MB</p>
        <p>Wake up word 1&#xAC1C;: 7MB</p>
        <p>Wake up word 2&#xAC1C;: 8MB</p>
      </td>
    </tr>
  </tbody>
</table>



{% page-ref page="ios/" %}

{% page-ref page="android/" %}

{% page-ref page="linux/" %}

