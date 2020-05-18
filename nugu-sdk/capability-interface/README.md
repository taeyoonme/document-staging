# Capability interface

## Capability Interface

Capability Interface 는 Play 에서 디바이스의 기능을 제어하기 위한 규격으로 Event, Directive, Context 등으로 구성되어 있으며, Play 에서 제공하려는 기능에 따라 여러개의 Capability Interface 를 조합하여 디바이스로 전달할 수 있습니다.

### 공통 파라미터

Capability Interface 규격에서 공통적으로 사용되는 파라미터입니다.

* namespace: Capability Interface 의 이름입니다.
* name: Directive 또는 Event 의 이름입니다.
* messageId: 하나의 Directive 또는 Event 를 구분하기 위한 id 입니다.
* dialogRequestId: Event 와 Directive 를 mapping 하기 위한 id 입니다. 하나의 요청\(Event\) 과 응답\(Directive\) 는 동일한 dialogRequestId 를 가집니다.
* playServiceId: Play 의 고유 id 값입니다. Directive 또는 Event 에 포함되어 있습니다.
* version: Capability Interface 의 버전입니다.

## Capability agent

Capability Interface 의 규격에서 정의하는 기능을 제공하기 위해 Capability Interface 와 1:1 로 매핑되는 Capability Agent 가 구현되어 있습니다.

Capability Agent 에서 미디어 재생과 같은 기능은 직접 실행하지만, UI 구성과 같이 직접 실행할 수 없는 기능을 Application 에 위임합니다.

## Event

디바이스에서 서버로 전달되는 JSON 형식의 데이터로 JSON 구조는 각 각의 Capability Interface 에 정의되어 있습니다.

## Directive

서버에서 디바이스로 전달되는 JSON 형식의 데이터로 JSON 구조는 각 각의 Capability Interface 에 정의되어 있습니다.

## Context

Capability Agent 의 현재 상태를 의미하는 데이터로 Event 와 함께 서버로 전달됩니다.



