---
description: Directive 의 실행 순서를 제어하기 위한 규격
---

# Utility

## Version

최신 버전은 1.0 입니다.

| Version | Date | Description |
| :--- | :--- | :--- |
| 1.0 | 2020.11.30 | 규격 추 |

## SDK Interface

Utility 는 하나의 응답으로 전달되는 Directive들의 실행 순서 및 Blocking 처리 로직을 포함하고 있는 규격으로  Application 에서 처리할 별도의 interface 가 없습니다.

## Context

```text
{
  "Utility": {
    "version": "1.0"
  }
}
```

## Directives

### Block

Block Directive를 기준으로 이전 Directive들이 모두 실행된 후 이후 Directive들이 실행됨

```text
{
  "header": {
    "namespace": "Utility",
    "name": "Block",
    "messageId": "{{STRING}}",
    "dialogRequestId": "{{STRING}}",
    "version": "1.0"
  },
  "payload": {
    "playServiceId": "{{STRING}}",
    "sleepInMillisecond": {{LONG}}
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
      <td style="text-align:left">sleepInMillisecond</td>
      <td style="text-align:left">long</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>&#xB2E4;&#xC74C; Directive&#xB97C; &#xC2E4;&#xD589;&#xD558;&#xAE30; &#xC804;&#xC5D0;
          &#xB300;&#xAE30;&#xD558;&#xB294; &#xC2DC;&#xAC04;</p>
        <p>&#xC9C0;&#xC815;&#xB418;&#xC9C0; &#xC54A;&#xC73C;&#xBA74; &#xBC14;&#xB85C;
          &#xC2DC;&#xC791; (default - 0)</p>
      </td>
    </tr>
  </tbody>
</table>

