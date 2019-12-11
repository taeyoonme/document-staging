# Prompt 사용하기

## Prompt 사용하기 <a id="use-prompts"></a>

Prompt는 사용자에게 응답으로 전달할 메시지를 의미합니다. Prompt를 작성할때 다음과 같은 구성 요소들을 사용할 수 있습니다.

| 구성 요소 | 하위 구성 요소 | 특징 | 자동완성 단축키 |
| :--- | :--- | :--- | :---: |
| 일반 텍스트 |  | '가나다'와 같은 일반적인 텍스트를 그대로 읽어 발화합니다. | 지원 안 함 |
| Parameter |  | 와 같은 형태로 사용하며, Parameter에 담긴 값을 텍스트로 변형하여 발화합니다.   Parameter 사용법에 대한 자세한 내용은 [Parameter 사용하기](../use-parameters/)를 참고하세요. | {{ |
| Response Filter | NLG Translator | Parameter와 항상 결합하여 사용되며, 단독으로 쓰일 수 없습니다. | &gt; |
|  | NLG Normalizer | Parameter에 담겨 있는 값이 Filter의 Source와 100% 일치할 경우에만 동작합니다. | = |
|  | NLG Function | Response Filter에 대한 자세한 내용은 [Response Filter](../../define-response-filters.md)를 참고하세요. | : |
| 조사 |  | '을/를'과 같이 앞 음절에 따라 조사가 바뀌는 경우에 자동으로 변환하여 발화합니다.   조사 자동 변환은 Parameter와 함께 사용될 때만 동작합니다.  조사 처리에 대한 자세한 내용은 [조사 처리하기](use-prompts.md#process-postpositions)를 참고하세요. | / |
| SKML 태그 |  | TTS 엔진이 텍스트 혹은 Parameter의 값을 SKML 태그에 따라 발화합니다.   SKML 태그 사용 대한 자세한 내용은 [발화 옵션 사용하기](use-prompts.md#use-utterance-options)를 참고하세요. | &lt; |

#### Prompt의 유형 <a id="prompt-types"></a>

Play Builder의 Prompt에는 3가지 유형이 있습니다.

| 유형 | 설명 |
| :--- | :--- |
| 대기 Prompt | Prompt가 발화된 이후 Play의 세션이 유지됩니다. |
| 연속 Prompt | 뒤이어 올 Prompt가 있는 경우에만 발화되며, 뒤이어 오는 Prompt와 더해져서 하나의 문장처럼 발화됩니다. |
| 종료 Prompt | Prompt가 발화된 이후 Play의 세션이 종료됩니다. |

Prompt는 사용 위치에 따라 다음과 같이 구분됩니다.

| 위치 |  | 특징 |
| :--- | :--- | :--- |
| 일반 Response의 Prompt | Welcome Action을 제외한 모든 Action | 대기 Prompt와 종료 Prompt가 사용됩니다.   여러 Prompt가 입력된 경우, 무작위로 선택되어 발화됩니다. |
|  | Built-in Action &gt; welcome | 대기 Prompt와 연속 Prompt가 사용됩니다.   여러 Prompt가 입력된 경우, 무작위로 선택되어 발화됩니다. |
|  | Built-in Action &gt; exit | 종료 Prompt가 사용됩니다.   여러 Prompt가 입력된 경우, 무작위로 선택되어 발화됩니다. |
|  | Built-in Action &gt; fallback | 대기 Prompt와 종료 Prompt가 사용됩니다.   여러 Prompt가 입력된 경우, 위에서부터 순차적으로 발화됩니다. |
| Slot-filling Prompt |  | 대기 Prompt와 종료 Prompt가 사용됩니다.   여러 Prompt가 입력된 경우, 위에서부터 순차적으로 발화됩니다. |
| 예외 상황 처리의 Exception Prompt |  | 대기 Prompt와 종료 Prompt가 사용됩니다.   여러 Prompt가 입력된 경우, 위에서부터 순차적으로 발화됩니다. |

#### Silent Prompt Updated <a id="silent-prompt"></a>

사용자에게 빈 응답을 전달하고 싶을 경우, Silent Prompt를 사용할 수 있습니다. Silent Prompt는 Prompt 입력 창 우측의 버튼을 눌러 설정 가능합니다. Silent Prompt를 응답으로 설정하면, 아무 발화 없이 대기 모드로 넘어가거나 세션이 종료되므로 꼭 필요한 경우에만 사용하는 것이 좋습니다. Silent Prompt는 모든 유형의 Prompt에서 사용할 수 있습니다.

## 조사 처리하기 <a id="process-postpositions"></a>

국어의 조사 '이/가, 을/를, 은/는, 과/와, 로/으로'는 같은 형태소지만 앞음절의 받침 유무에 따라 다르게 사용됩니다.

Prompt를 입력할 때 일반 문장은 작성자가 입력한 조사를 그대로 사용하면 되나, Parameter를 사용하는 경우에는 그 Parameter에 담긴 마지막 글자의 받침 유무를 알 수 없기 때문에 별도의 처리를 하지 않는다면 '내일는'과 같이 조사가 잘못 붙어서 응답될 가능성이 있습니다. Play Builder에서는 Parameter 뒤에 조사를 쓰는 경우 Parameter에 담긴 마지막 글자의 받침 유무에 따라 자동으로 조사를 변환 처리합니다.

Parameter의 `}}` 기호 뒤에 / 입력하면 조사의 자동완성 창이 표시됩니다. 이 창에서 원하는 조사를 선택합니다.

![](../../../../.gitbook/assets/ch3_323411_01-1.png)

다음과 같이 중괄호 사이에 대표 조사가 입력되지만, 실제 발화 시에는 Parameter 마지막 글자의 받침 여부 따라 조사가 변환되어 출력됩니다.

![](../../../../.gitbook/assets/ch3_323411_02-1.png)

자동완성을 사용하지 않더라도 parameter의 `}}` 사이에 조사를 직접 입력해도 정상 동작합니다.

받침 유무에 따른 조사는 다음과 같이 변환됩니다.

|  | 은/는 | 이/가 | 을/를 | 과/와 | 로/으로 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 받침이 없는 경우 | 는 | 가 | 를 | 와 | 로 |
| 받침이 있는 경우 | 은 | 이 | 을 | 과 | 으로 |

#### 조사 처리 시, 받침 유무 판정 규칙

* 알파벳은 미국식 영어로 읽는 것을 한국어로 옮긴다고 간주하고 조사 처리합니다. 
* 10 g, 1 m와 같이 숫자와 단위가 붙어서 조합되고, [발화 옵션 Say 태그\(단위 속성\)](../../../../reference/list-of-unit-tags-supported-by-utterance-options.md)를 처리하지 않은 경우, 10 그램, 1 미터와 같이 단위에 대한 표준어로 변환하여 조사를 붙입니다. 
* 괄호나 특수문자가 포함된다면 제거한 후 처리합니다. 
* 단위, 한글, 영문, 숫자에 해당하지 않는 경우는 변환하지 않습니다.

## 발화 옵션 사용하기 <a id="use-utterance-options"></a>

입력한 Response의 Prompt를 TTS 엔진이 음성으로 변환할 때 예상과는 다른 방식으로 읽을 수도 있고, 때로는 천천히 읽거나 또박또박 읽게 하고 싶을 수도 있습니다.

가령 '119로 전화를 걸겠습니다'라고 Prompt를 입력한 경우 '일일구로 전화를 걸겠습니다'라고 발화할 것이라 기대하지만, TTS 엔진은 기본적으로 숫자를 그대로 읽도록 처리하고 있기 때문에 '백십구로 전화를 걸겠습니다.' 라고 읽게 됩니다.

Play Builder는 입력한 Prompt를 음성으로 변환시킬 때 개별적으로 튜닝을 하거나, 다르게 읽을 수 있는 '발화 옵션' 기능을 제공하고 있습니다. 발화 옵션은 Play의 모든 Prompt에 일괄 반영할 수도 있고, 특정 문장별로 변경할 수 있습니다.

또, 문장 내 발화 옵션 태그를 사용하여 세밀한 설정\(Tuning\)도 가능합니다.

#### 전체 발화 옵션 변경하기

1\) Play Builder 홈 화면에서 모든 Prompt의 발화 옵션을 변경할 Play를 클릭하여 선택한 후 `General` &gt; `기본정보`를 클릭합니다.

![](../../../../.gitbook/assets/ch3_323413_c01.png)

2\) 기본 정보 페이지의 Prompt 발화 옵션에서 발화속도, 음 높낮이, 문장 사이의 묵음 길이, 끊어읽기 뒤 묵음 길이를 설정한 후 `발화옵션 적용하기` 버튼을 클릭합니다. 이 값을 변경하면 현재부터 만드는 Prompt부터 적용됩니다.

![](../../../../.gitbook/assets/ch3_323413_c02.png)

**① 발화속도 \(speed\)** 재생 속도를 50 ~ 120% 사이에서 변경할 수 있습니다.\(기본값: 100%\) 최솟값이나 최댓값으로 설정할 경우에는 음질 열화가 발생할 수 있으므로 85 ~ 115 사잇값 사용을 권장합니다.

**② 합성음 높낮이 \(pitch\)** 합성음의 높낮이를 90 ~ 110 % 사이에서 변경할 수 있습니다.\(기본값: 100%\) 최솟값이나 최댓값으로 설정할 경우에는 음질 열화가 발생할 수 있으므로 95 ~ 105 사잇값 사용을 권장합니다.

**③ 문장 사이 묵음 길이 \(pause1\)** 문장과 문장 사이의 묵음 길이를 300 ~ 900 ms 사이에서 변경할 수 있습니다.\(기본값: 600 ms\)

**④ 끊어읽기 뒤 묵음 길이 \(pause2\)** 문장 내 끊어읽기 후의 묵음 길이를 100 ~ 500 ms 사이에서 변경할 수 있습니다.\(기본값: 300 ms\)

### 문장별 발화 옵션 변경하기

문장별로 발화 옵션을 조절할 수 있습니다.

1\) Play Builder 홈 화면에서 모든 Prompt의 발화 옵션을 변경할 Play를 클릭하여 선택한 후 `Actions` &gt; `Custom Actions` 페이지에서 발화 옵션을 설정할 문장이 있는 Action을 선택합니다.

![](../../../../.gitbook/assets/ch3_323413_c03.png)

2\) Output 정의 영역에서 발화 옵션을 변경할 Prompt의 우측 버튼을 클릭하여 옵션을 설정한 후 \[Play 저장\] 버튼을 클릭합니다.

* 변경 가능한 옵션은 전체 발화 옵션과 같습니다.

![](../../../../.gitbook/assets/ch3_323413_c04.png)

### 문장 내 발화 옵션 태그 추가하기 <a id="skml-tag"></a>

Prompt 내에서 특정 구간에 끊어읽기를 추가하거나, 특정 단어를 읽는 방식을 조절하는 태그도 제공하고 있습니다.

태그들은 기본적으로 `<태그 속성="속성값">` 형태로 구성됩니다. 이 태그는 직접 입력하지 않아도 되도록 Prompt 문장 입력창에서 자동완성으로 제공하고 있습니다. 문장 입력 중 특수문자 `<`를 입력한 뒤 자동완성창에서 세 가지 기능 중 적용할 옵션을 선택합니다.

![](../../../../.gitbook/assets/ch3_323413_01-1.png)

| 발화 옵션 | 설명 |
| :--- | :--- |
| 텍스트읽기 \(say\) | 한글이 아닌 문자들을 어떻게 읽을지 결정하는 태그입니다.   '4-2'는 '사 다시 이'와 같이 주소처럼 읽거나, '사 대 이'처럼 경기 스코어로 읽을 수 있을 수 있기 때문에, 이것을 어떻게 읽을 것인지 태그로 정해주는 기능입니다.   태그를 적용할 텍스트의 끝에 `</say>`가 필수로 들어가야 합니다. |
| 변환하여 읽기 \(sub\) | 일반적이지 않은 발음변환 규칙을 통해 발음이 되는 텍스트인 경우, 속성으로 지정해준 텍스트로 변환하여 발화하도록 하는 태그입니다.   예\) `<sub alias="호날두">Ronaldo</sub>` → 'Ronaldo'를 태그 내 속성의 '호날두'로 변환하여 읽습니다.   예\) `<sub alias="써프라이즈">서프라이즈</sub>` → '서프라이즈'를 태그 내 속성의 '써프라이즈'로 변환하여 읽습니다.     태그를 적용할 텍스트의 끝에 `</sub>`가 필수로 들어가야 합니다. |
| 끊어읽기 \(break, pause\) | 문장을 읽을 때 내용상, 길이상 적절하게 쉬어서 읽어주는 곳을 결정하는 태그입니다.   입력된 Prompt는 TTS 엔진이 끊어읽기 간격을 스스로 계산하여 발화합니다. TTS 엔진 합성음의 끊어읽기가 자연스럽지 않다고 판단될 경우에 끊어읽기의 위치 및 종류를 수동으로 설정할 수 있습니다.   이 태그는 적용할 어절의 뒤에 공백 없이 넣어야하고, 태그의 뒤에는 공백이 있어야 합니다.   예\) `안녕하세요. <break type="weak"/>아리아에요.`\(X\)   예\) `안녕하세요.<break type="weak"/> 아리아에요.`\(O\) |
| 효과음넣기 \(audio\) | 문장 중간에 박수 소리, 천둥 소리 등의 효과음을 넣을 수 있는 태그입니다. |

각 태그별 세부 기능은 다음과 같습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">&#xC0C1;&#xC704; &#xC635;&#xC158;</th>
      <th style="text-align:left">&#xC138;&#xBD80; &#xC635;&#xC158;</th>
      <th style="text-align:left">&#xC124;&#xBA85;</th>
      <th style="text-align:left">&#xC18D;&#xC131;</th>
      <th style="text-align:left">&#xC785;&#xB825;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">&#xB04A;&#xC5B4;&#xC77D;&#xAE30;</td>
      <td style="text-align:left">&#xAC00;&#xC7A5; &#xAE38;&#xAC8C; &#xB04A;&#xC5B4;&#xC77D;&#xAE30;</td>
      <td
      style="text-align:left">
        <p>&#xAC00;&#xC7A5; &#xAE38;&#xAC8C; &#xB04A;&#xC5B4;&#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC624;&#xB298;&#xC740; &#xBE44;&#xAC00;&lt;break type=&quot;sentence&quot;/&gt;
          &#xC635;&#xB2C8;&#xB2E4;.</p>
        </td>
        <td style="text-align:left">sentence</td>
        <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xAE38;&#xAC8C; &#xB04A;&#xC5B4;&#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&#xAE38;&#xAC8C; &#xB04A;&#xC5B4;&#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC624;&#xB298;&#xC740; &#xBE44;&#xAC00;&lt;break type=&quot;strong&quot;/&gt;
          &#xC635;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">strong</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC9E7;&#xAC8C; &#xB04A;&#xC5B4;&#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&#xC9E7;&#xAC8C; &#xB04A;&#xC5B4;&#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC624;&#xB298;&#xC740; &#xBE44;&#xAC00;&lt;break type=&quot;weak&quot;/&gt;
          &#xC635;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">weak</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xB04A;&#xC5B4;&#xC77D;&#xAE30; &#xC5C6;&#xC560;&#xAE30;</td>
      <td style="text-align:left">
        <p>&#xC774; &#xD0DC;&#xADF8;&#xAC00; &#xCD94;&#xAC00;&#xB41C; &#xBD80;&#xBD84;&#xC744;</p>
        <p>&#xB04A;&#xC9C0; &#xC54A;&#xACE0; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC6D0;&#xD558;&#xC9C0; &#xC54A;&#xAC8C; &#xB04A;&#xC5B4;&#xC77D;&#xB294;
          &#xBD80;&#xBD84;&#xC774;</p>
        <p>&#xBC1C;&#xC0DD;&#xD558;&#xB294; &#xACBD;&#xC6B0;&#xC5D0; &#xC0AC;&#xC6A9;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xBE0C;&#xB85C;&#xCF5C;&#xB9AC;&lt;break type=&quot;none&quot;/&gt;</p>
        <p>&#xB108;&#xB9C8;&#xC800;&#xC758; &#xC74C;&#xC545;&#xC744; &#xB4E4;&#xB824;&#xB4DC;&#xB9B4;&#xAED8;&#xC694;.</p>
      </td>
      <td style="text-align:left">none</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD55C;&#xB2E8;&#xC5B4;&#xCC98;&#xB7FC; &#xBD99;&#xC5EC;&#xC77D;&#xAE30;</td>
      <td
      style="text-align:left">
        <p>&#xD55C; &#xB2E8;&#xC5B4;&#xC640; &#xAC19;&#xC774; &#xBC1C;&#xC74C;&#xB418;&#xB3C4;&#xB85D;
          &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;&#xB97C;&#xB4E4;&#xC5B4; &apos;&#xCCAB; &#xBC88;&#xC9F8;&apos;&#xB97C;
          &apos;&#xCCAB;&#xBED4;&#xC9F8;&apos;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xCCAB;&lt;break type=&quot;clitic&quot;/&gt; &#xBC88;&#xC9F8;</p>
        </td>
        <td style="text-align:left">clitic</td>
        <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xB04A;&#xC5B4;&#xC77D;&#xAE30; &#xC2DC;&#xAC04;&#xC124;&#xC815;</td>
      <td
      style="text-align:left">
        <p>&#xB04A;&#xC5B4; &#xC77D;&#xB294; &#xC2DC;&#xAC04;&#xC744; &#xC124;&#xC815;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&lt;pause time=&quot;200&quot;/&gt;</p>
        <p>&#x2192; 200 ms &#xB3D9;&#xC548; &#xB04A;&#xC5B4; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&apos;0&apos;&#xBCF4;&#xB2E4; &#xD070; &#xC815;&#xC218;&#xB9CC; &#xC0AC;&#xC6A9;
          &#xAC00;&#xB2A5;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC624;&#xB298;&#xC740;&lt;pause time=&quot;200&quot;/&gt;
          &#xBE44;&#xAC00; &#xC635;&#xB2C8;&#xB2E4;.</p>
        </td>
        <td style="text-align:left"></td>
        <td style="text-align:left"><code>[n]</code>
        </td>
    </tr>
    <tr>
      <td style="text-align:left">&#xD14D;&#xC2A4;&#xD2B8;&#xC77D;&#xAE30;</td>
      <td style="text-align:left">&#xD55C;&#xC790; &#xB0B1;&#xC22B;&#xC790; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&#xC22B;&#xC790;&#xB97C; &apos;&#xC77C;, &#xC774;, &#xC0BC;, &#xC0AC;&apos;&#xC640;
          &#xAC19;&#xC774; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB450; &#xC790;&#xB9AC; &#xC774;&#xC0C1;&#xC758; &#xC22B;&#xC790;&#xB3C4;
          &apos;&#xC77C;&#xC77C;&#xAD6C;&apos;&#xC640; &#xAC19;&#xC774;</p>
        <p>&#xD55C; &#xC790;&#xC529; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">digit</td>
      <td style="text-align:left"><code>[n]</code>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD55C;&#xC790; &#xC22B;&#xC790; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&#xC22B;&#xC790;&#xB97C; &apos;&#xC77C;, &#xC774;, &#xC0BC;, &#xC0AC;&apos;&#xC640;
          &#xAC19;&#xC774; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC790;&#xB9BF;&#xC218;&#xB97C; &#xD3EC;&#xD568;&#xD558;&#xC5EC; &apos;&#xBC31;&#xC2ED;&#xAD6C;&apos;&#xC640;
          &#xAC19;&#xC774; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&apos;&#xACBD;&apos;(10&#xC758; 16&#xC81C;&#xACF1;) &#xB2E8;&#xC704;&#xAE4C;&#xC9C0;
          &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">num_hanja</td>
      <td style="text-align:left"><code>[n]</code>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD55C;&#xAE00; &#xC22B;&#xC790; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">&#xC22B;&#xC790;&#xB97C; &apos;&#xD55C;, &#xB450;, &#xC138;, &#xB124;&apos;&#xC640;
        &#xAC19;&#xC774; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">num_kor</td>
      <td style="text-align:left"><code>[n]</code>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC601;&#xC5B4; &#xC22B;&#xC790; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&#xC22B;&#xC790;&#xB97C; &apos;&#xC6D0;, &#xD22C;, &#xC4F0;&#xB9AC;, &#xD3EC;&apos;&#xC640;
          &#xAC19;&#xC774; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>Trillion(10&#xC758; 12&#xC81C;&#xACF1;) &#xB2E8;&#xC704;&#xAE4C;&#xC9C0;
          &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">num_eng</td>
      <td style="text-align:left"><code>[n]</code>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xB0A0;&#xC9DC; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&apos;&#xC774;&#xCC9C;&#xC2ED;&#xD314;&#xB144; &#xC0BC;&#xC6D4; &#xAD6C;&#xC77C;&apos;&#xACFC;
          &#xAC19;&#xC774;</p>
        <p>&#xB0A0;&#xC9DC;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&apos;&#xC0BC;&#xC6D4; &#xAD6C;&#xC77C;&apos;&#xACFC; &#xAC19;&#xC774;
          &#xD2B9;&#xC815; &#xB0A0;&#xC9DC;&#xB85C; &#xC77D;&#xAC70;&#xB098;,</p>
        <p>&apos;&#xC0BC;&#xC6D4; &#xAD6C;&#xC77C;&#xC5D0;&#xC11C; &#xC0AC;&#xC6D4;
          &#xC2ED;&#xC77C;&apos;&#xACFC; &#xAC19;&#xC774;</p>
        <p>&#xBC94;&#xC704;&#xB85C; &#xC77D;&#xB294; &#xAC83;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">date</td>
      <td style="text-align:left">
        <p>&#xD2B9;&#xC815; &#xB0A0;</p>
        <p>[yyyy]-[mm]-[dd]</p>
        <p>[yyyy]:[mm]:[dd]</p>
        <p>[yyyy]/[mm]/[dd]</p>
        <p>[yyyy].[mm].[dd]</p>
        <p>[mm]-[dd]</p>
        <p>[mm]/[dd]</p>
        <p>[mm].[dd]</p>
        <p></p>
        <p></p>
        <p>&#xBC94;&#xC704;</p>
        <p>[yyyy]-[mm]-[dd]~</p>
        <p>[yyyy]-[mm]-[dd]</p>
        <p></p>
        <p>[yyyy]:[mm]:[dd]~</p>
        <p>[yyyy]:[mm]:[dd]</p>
        <p></p>
        <p>[yyyy]/[mm]/[dd]~[yyyy]/[mm]/[dd]</p>
        <p></p>
        <p>[yyyy].[mm].[dd]~</p>
        <p>[yyyy].[mm].[dd]</p>
        <p></p>
        <p>[mm]-[dd]~</p>
        <p>[mm]-[dd]</p>
        <p></p>
        <p>[mm]/[dd]~[mm]/[dd]</p>
        <p></p>
        <p>[mm].[dd]~</p>
        <p>[mm].[dd]</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2DC;&#xAC04; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&apos;&#xC5F4;&#xD55C;&#xC2DC; &#xC0BD;&#xC2ED;&#xBD84; &#xC0AC;&#xC2ED;&#xC624;&#xCD08;&apos;&#xC640;
          &#xAC19;&#xC774;</p>
        <p>&#xC2DC;&#xAC04;&#xC73C;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&apos;hh&#xC2DC; mm&#xBD84; ss&#xCD08;, hh&#xC2DC; mm&#xBD84;&apos;&#xACFC;
          &#xAC19;&#xC774;</p>
        <p>&#xD2B9;&#xC815; &#xC2DC;&#xAC04;&#xC73C;&#xB85C; &#xC77D;&#xAC70;&#xB098;</p>
        <p>&apos;hh&#xC2DC; mm&#xBD84; ss&#xCD08;&#xC5D0;&#xC11C;</p>
        <p>hh&#xC2DC; mm&#xBD84; ss&#xCD08;&apos;,</p>
        <p>hh&#xC2DC; mm&#xBD84;&#xC5D0;&#xC11C; hh&#xC2DC; mm&#xBD84;&apos;&#xCC98;&#xB7FC;</p>
        <p>&#xBC94;&#xC704;&#xB85C; &#xC77D;&#xB294; &#xAC83;&#xC744; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">time</td>
      <td style="text-align:left">
        <p>&#xD2B9;&#xC815; &#xC2DC;&#xAC04;</p>
        <p>[hh]:[mm]:[ss]</p>
        <p>[mm]:[ss]</p>
        <p></p>
        <p>&#xAE30;&#xAC04;</p>
        <p>[hh]:[mm]:[ss]~</p>
        <p>[hh]:[mm]:[ss]</p>
        <p></p>
        <p>[hh]:[mm]:[ss]-</p>
        <p>[hh]:[mm]:[ss]</p>
        <p></p>
        <p>[mm]:[ss]~</p>
        <p>[mm]:[ss]</p>
        <p></p>
        <p>[mm]:[ss]-</p>
        <p>[mm]:[ss]</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xB2E8;&#xC704; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&apos;&#xCE60;&#xBBF8;&#xD130;, &#xCE60;&#xADF8;&#xB7A8;&apos;&#xACFC;
          &#xAC19;&#xC774; &#xB2E8;&#xC704;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>139&#xAC1C;&#xC758; &#xB2E8;&#xC704;&#xB97C; &#xC77D;&#xAE30; &#xC9C0;&#xC6D0;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>(<a href="use-prompts.md#list-of-unit-tags-supported-by-utterance-options">&#xBC1C;&#xD654; &#xC635;&#xC158;&#xC5D0;&#xC11C; UNIT </a>
        </p>
        <p><a href="use-prompts.md#list-of-unit-tags-supported-by-utterance-options">&#xD0DC;&#xADF8;&#xB85C; &#xC9C0;&#xC6D0; &#xB2E8;&#xC704; &#xBAA9;&#xB85D;</a>)</p>
      </td>
      <td style="text-align:left">unit</td>
      <td style="text-align:left">[n][unit]</td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC8FC;&#xC18C; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&apos;&#xD314;&#xC2ED;&#xC0BC; &#xB2E4;&#xC2DC; &#xC77C;&apos;&#xACFC;
          &#xAC19;&#xC774; &#xC9C0;&#xBC88; &#xC8FC;&#xC18C;&#xC758;</p>
        <p>&#xC9C0;&#xBC88;&#xC744; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">address</td>
      <td style="text-align:left">[n]-[n]</td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC804;&#xD654;&#xBC88;&#xD638; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&apos;&#xC77C;&#xC774;&#xC0BC;&#xC0AC; &#xC77C;&#xC774;&#xC0BC;&#xC0AC;&apos;&#xC640;
          &#xAC19;&#xC774;</p>
        <p>&#xC804;&#xD654;&#xBC88;&#xD638;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">telephone</td>
      <td style="text-align:left">
        <p>[n]-[n]</p>
        <p>[n]-[n]-[n]</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC601;&#xC5B4; &#xC2A4;&#xD3A0;&#xB9C1; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">
        <p>&apos;&#xBE44;&#xD2F0;&#xC5D0;&#xC2A4;&apos;&#xC640; &#xAC19;&#xC774;
          &#xC601;&#xC5B4; &#xC2A4;&#xD3A0;&#xB9C1;&#xC73C;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB300;&#xC18C;&#xBB38;&#xC790;&#xB294; &#xAD6C;&#xBD84;&#xD558;&#xC9C0;
          &#xC54A;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
      </td>
      <td style="text-align:left">spell</td>
      <td style="text-align:left">[text]</td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xACBD;&#xAE30; &#xC2A4;&#xCF54;&#xC5B4; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">&apos;&#xC0BC; &#xB300; &#xC774;&apos;&#xC640; &#xAC19;&#xC774; &#xACBD;&#xAE30;
        &#xC2A4;&#xCF54;&#xC5B4;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td
      style="text-align:left">score</td>
        <td style="text-align:left">
          <p>[n]:[n]</p>
          <p>[n]-[n]</p>
        </td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBD84;&#xC218; &#xC77D;&#xAE30;</td>
      <td style="text-align:left">&apos;&#xC0BC;&#xBD84;&#xC758; &#xC77C;&apos;&#xACFC; &#xAC19;&#xC774;
        &#xBD84;&#xC218;&#xB85C; &#xC77D;&#xC2B5;&#xB2C8;&#xB2E4;.</td>
      <td style="text-align:left">fraction</td>
      <td style="text-align:left">[n]/[n]</td>
    </tr>
    <tr>
      <td style="text-align:left">&#xD6A8;&#xACFC;&#xC74C;&#xB123;&#xAE30;</td>
      <td style="text-align:left">&#xC2EC;&#xC7A5; &#xBC15;&#xB3D9;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC2EC;&#xC7A5; &#xBC15;&#xB3D9; (&#xBE60;&#xB974;&#xAC8C;)</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC7AC;&#xCC44;&#xAE30;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBC15;&#xC218;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD154;&#xB808;&#xD30C;&#xC2DC; 1</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD154;&#xB808;&#xD30C;&#xC2DC; 2</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBC1C;&#xAC78;&#xC74C;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBB3C;&#xD280;&#xAE30;&#xB294;&#xC18C;&#xB9AC;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC5BC;&#xAD74; &#xC53B;&#xB294; &#xC18C;&#xB9AC;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC74C;&#xC545; 1</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC74C;&#xC545; 2</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xCE74;&#xBA54;&#xB77C; &#xC154;&#xD130;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD540;&#xBC84;&#xD2BC; &#xB204;&#xB974;&#xB294; &#xC18C;&#xB9AC;</td>
      <td
      style="text-align:left"></td>
        <td style="text-align:left"></td>
        <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBD88;&#xD0C0;&#xB294; &#xC18C;&#xB9AC;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xCC9C;&#xB465;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC790;&#xB3D9;&#xCC28; &#xB9AC;&#xBAA8;&#xCF58;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBE44;&#xD589;&#xAE30;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBB3C;&#xBC29;&#xC6B8; &#xB5A8;&#xC5B4;&#xC9C0;&#xB294; &#xC18C;&#xB9AC;</td>
      <td
      style="text-align:left"></td>
        <td style="text-align:left"></td>
        <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD718;&#xD30C;&#xB78C; 1</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xD718;&#xD30C;&#xB78C; 2</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xBE57;&#xC790;&#xB8E8;&#xC9C8;</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC885;&#xC18C;&#xB9AC; 1</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">&#xC885;&#xC18C;&#xB9AC; 2</td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>{% hint style="info" %}
Prompt 내에 사용하는 태그는 텍스트를 직접 입력하여 추가 또는 수정할 수 있습니다.
{% endhint %}

### 발화 옵션에서 UNIT 태그로 지원하는 단위 목록 <a id="list-of-unit-tags-supported-by-utterance-options"></a>

문장 내 발화 옵션 태그 중 `텍스트 읽기` &gt; `단위 읽기` 태그에서 지원하는 목록은 [단위 목록](../../../../reference/list-of-unit-tags-supported-by-utterance-options.md) 문서에서 확인할 수 있습니다.

