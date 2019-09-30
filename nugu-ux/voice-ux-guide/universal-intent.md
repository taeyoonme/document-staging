# 답변 디자인



### **답변\(Prompt\) 디자인**

Prompt란 NUGU 에이전트의 음성 응답을 의미하며, 음성으로 전달되는 정보를 사용자가 잘 이해할 수 있도록 다음과 같은 가이드라인을 고려하여 디자인하는 것이 좋습니다..

<table>
  <thead>
    <tr>
      <th style="text-align:left">
        <p>Prompt&#xC758; &#xC815;&#xD655;&#xC131;</p>
        <p>Prompt&#xC758; &#xAC04;&#xACB0;&#xC131;</p>
        <p>Prompt&#xC758; &#xB2E4;&#xC591;&#xC131;</p>
        <p>Prompt&#xC758; &#xC77C;&#xAD00;&#xC131;</p>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table>#### Prompt의 정확성

다음 사항에서는 정보의 누락 없이 정확하고 명확하게 말해야 합니다.

•        **정보 전달이 목적인 경우**

사용자가 각 기능 실행에 대한 답변\(Prompt\) 피드백만으로도 이해할 수 있도록 필요한 정보를 빠짐없이 모두 포함합니다.

•        **질문인 경우**

사용자가 답변\(Prompt\)를 들었을 때 질문형으로 이해할 수 있도록 문장을 구성합니다.  
 원활한 상호작용을 위해 사용자가 대답해야 하는 발화를 명확하게 제시해야 합니다.

•        **오류 상황인 경우**

오류 발생의 이유나 해결 방법을 구체적이고 정확하게 제시합니다.

•        **띄어쓰기와 구두점**  
 TTS가 문장을 출력할 때 공백과 쉼표, 마침표를 인식하여 출력하므로 문장 안에 필요한 공백이나, 쉼표, 마침표 등을 적절하게 사용하여 흐름이 자연스럽게 작성합니다.  
 예\) BBQ 황금 올리브치킨이 16000원에 준비되어 있습니다. 주문이 접수된 후에는 변경이나 취소가 불가능해요. 서울시 중구 을지로 2가 T타워로 배달을 원하시면 "아리아, 주문 접수"라고 꼭 말씀해주세요. 

#### Prompt의 간결성

사용자와 음성으로만 상호작용하기 때문에 효율적인 의사 전달을 위해 간결하게 말해야 합니다.

·            불필요한 꾸밈말이나 조사를 사용하여 답변\(Prompt\)가 불필요하게 길어지지 않도록 주의합니다.

·            기능 실행이 목적인 답변\(Prompt\)인 경우에는 가능한 짧고 간결한 형태로 응답합니다.  
 예\) 사용자가 이미 알고 있는 주소를 안내할 경우, 시, 군, 구, 동 등 전체 주소를 안내하기 보다는 동 이하 주소만 안내

·            한 문장 안에는 기본 2개, 최대 4개의 정보만 배치합니다.

·            전체 문장이 3문장 이상이 되어야 할 경우 중요한 정보를 포함하고 있을 경우에만 허용합니다.  
 이 경우, 정보와 정보 사이를 구분하여 읽어 사용자의 이해를 도와야 합니다.

·            문장과 문장 사이에 동일한 단어 또는 술어를 반복 사용하여 중복되는 느낌을 주는 것을 지양합니다.  
 예\)   
 오전 날씨는 비가 오고, 오후에는 비가 와요 \(X\)  
 하루 종일 비가 와요 \(O\)

.

<table>
  <thead>
    <tr>
      <th style="text-align:left">
        <p><b>&#xAC04;&#xACB0;&#xC131; &#xD655;&#xBCF4;&#xB97C; &#xC704;&#xD55C; &#xC815;&#xB7C9;&#xC801; &#xAC00;&#xC774;&#xB4DC; &#xC0AC;&#xB840;</b>
        </p>
        <p>&#xB7; &#xC791;&#xC131;&#xB41C; &#xB2F5;&#xBCC0;(Prompt)&#xB97C; &#xC2E4;&#xC81C;&#xB85C;
          &#xC77D;&#xC5B4;&#xBCF4;&#xBA70; &#xD638;&#xD761;&#xC744; &#xCCB4;&#xD06C;&#xD569;&#xB2C8;&#xB2E4;.
          &#xD55C; &#xBC88; &#xC774;&#xC0C1; &#xD638;&#xD761;&#xD574;&#xC57C; &#xD560;
          &#xACBD;&#xC6B0; &#xBB38;&#xC7A5;&#xC758; &#xAE38;&#xC774;&#xB97C; &#xC904;&#xC774;&#xB294;
          &#xAC83;&#xC774; &#xC88B;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB7; &#xC751;&#xB2F5; &#xD558;&#xB098;&#xB2F9; &#xC57D; 500&#xC790;
          &#xB610;&#xB294; 90&#xCD08; &#xC774;&#xD558;&#xAC00; &#xB418;&#xB3C4;&#xB85D;
          &#xC791;&#xC131;&#xD558;&#xB294; &#xAC83;&#xC774; &#xC88B;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB7; &#xAE34; &#xBAA9;&#xB85D; &#xD56D;&#xBAA9;&#xC774;&#xAC70;&#xB098;
          &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xB354; &#xAE4A;&#xC774; &#xC0DD;&#xAC01;&#xD574;&#xC57C;&#xD558;&#xB294;
          &#xD56D;&#xBAA9;&#xC778; &#xACBD;&#xC6B0;&#xC5D0;&#xB294; &#xC2DC;&#xAC04;&#xC744;
          &#xB354; &#xD655;&#xBCF4;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB7; &#xBAA9;&#xB85D;&#xC758; &#xD615;&#xD0DC;&#xB85C; &#xC548;&#xB0B4;&#xD574;&#xC57C;
          &#xD560; &#xACBD;&#xC6B0;, &#xBAA9;&#xB85D;&#xC5D0; &#xB300;&#xD55C; &#xC81C;&#xBAA9;&#xC744;
          &#xBA3C;&#xC800; &#xC81C;&#xC2DC;&#xD574; &#xC55E;&#xC73C;&#xB85C; &#xC18C;&#xAC1C;&#xB420;
          &#xBAA9;&#xB85D;&#xC744; &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC608;&#xCE21;&#xD560;
          &#xC218; &#xC788;&#xB3C4;&#xB85D; &#xD558;&#xBA70; &#xC81C;&#xBAA9;&#xC744;
          &#xC81C;&#xC2DC;&#xD55C; &#xD6C4;&#xC5D0;&#xB294; &#xC7A0;&#xAE50; &#xC26C;&#xACE0;
          &#xBAA9;&#xB85D;&#xC744; &#xC548;&#xB0B4;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB7; &#xD56D;&#xBAA9;&#xC774; &#xB9CE;&#xC740; &#xACBD;&#xC6B0;&#xC5D0;&#xB294;
          &#xBAA8;&#xB4E0; &#xD56D;&#xBAA9;&#xC744; &#xC548;&#xB0B4;&#xD558;&#xB294;
          &#xAC83;&#xBCF4;&#xB2E4; &#xC77C;&#xBD80;&#xB9CC; &#xBA3C;&#xC800; &#xC548;&#xB0B4;&#xD55C;
          &#xD6C4; &#xB354; &#xB4E3;&#xAE38; &#xC6D0;&#xD558;&#xB294;&#xC9C0; &#xC0AC;&#xC6A9;&#xC790;&#xC5D0;&#xAC8C;
          &#xC758;&#xACAC;&#xC744; &#xBB3B;&#xB3C4;&#xB85D; &#xD569;&#xB2C8;&#xB2E4;.
          <br
          />&#xC774; &#xACBD;&#xC6B0;, &#xBA3C;&#xC800; &#xC548;&#xB0B4;&#xB418;&#xB294;
          &#xD56D;&#xBAA9;&#xC740; 20&#xCD08; &#xC774;&#xC0C1; &#xAC78;&#xB9AC;&#xC9C0;
          &#xC54A;&#xC544;&#xC57C; &#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB7; &#xD56D;&#xBAA9;&#xC774; &#xB9CE;&#xC740; &#xACBD;&#xC6B0;&#xC5D0;&#xB294;
          &#xD56D;&#xBAA9;&#xC744; 2&#xAC1C;&#xC5D0;&#xC11C; 5&#xAC1C; &#xC0AC;&#xC774;&#xB85C;
          &#xADF8;&#xB8F9;&#xD654;&#xD558;&#xC5EC; &#xC548;&#xB0B4;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xB7; &#xBB38;&#xC7A5; &#xAC04; &#xB744;&#xC5B4; &#xC77D;&#xC744; &#xC218;
          &#xC788;&#xB3C4;&#xB85D; &#xAC01; &#xD56D;&#xBAA9; &#xB4A4;&#xC5D0; SSML(Speech
          Synthesis Markup Language)&#xC744; &#xC0AC;&#xC6A9;&#xD569;&#xB2C8;&#xB2E4;.</p>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table>#### Prompt의 다양성

사용자가 자주 이용하는 서비스라면 매번 동일한 응답을 듣는 것이 지루할 수 있으므로 다양한 응답으로 구성합니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"></th>
      <th style="text-align:left">
        <p><b>&#xC0AC;&#xC6A9;&#xC790;</b>: &#xC544;&#xB9AC;&#xC544;, &#xB180;&#xC544;&#xC918;!</p>
        <p><b>NUGU</b>: &#xC544; &#xC800;&#xB3C4;&#xC694; &#xC624;&#xD6C4;&#xC5D4;
          &#xC878;&#xB9AC;&#xACE0; &#xBB34;&#xB8CC;&#xD558;&#xACE0; &#xC880; &#xADF8;&#xB807;&#xB124;&#xC694;
          &#xC81C;&#xAC00; &#xB0B4;&#xB294; &#xD034;&#xC988;&#xB97C; &#xB9DE;&#xCDB0;
          &#xBCF4;&#xC2E4;&#xB798;&#xC694;?&#x201D;</p>
        <p><b>&#xC0AC;&#xC6A9;&#xC790;</b>: &#xC544;&#xB9AC;&#xC544;, &#xB180;&#xC544;&#xC918;!</p>
        <p><b>NUGU</b>: &#xD760; &#xC774;&#xB7F4; &#xB54C;&#xB294; &#xBB58; &#xD574;&#xB4DC;&#xB824;&#xC57C;
          &#xCE6D;&#xCC2C;&#xBC1B;&#xC744;&#xAE4C;&#xC694;? &#xC694;&#xC998; &#xC720;&#xD589;&#xD558;&#xB294;
          &#xC2E0;&#xC870;&#xC5B4;&#xB97C; &#xC9C0;&#xAE08; &#xBC30;&#xC6CC;&#xBCF4;&#xB294;
          &#xAC74; &#xC5B4;&#xB54C;&#xC694;?&#x201D;</p>
        <p><b>&#xC0AC;&#xC6A9;&#xC790;</b>: &#xC544;&#xB9AC;&#xC544;, &#xB180;&#xC544;&#xC918;!</p>
        <p><b>NUGU</b>: &#xC544; &#xC774;&#xB7F0; &#xB0A0;&#xC740; &#xBB54;&#xAC00;
          &#xC7AC;&#xBBF8;&#xC788;&#xB294; &#xC77C;&#xC774; &#xC0DD;&#xAE30;&#xBA74;
          &#xC88B;&#xC744; &#xD150;&#xB370;&#xC694; &#xC74C; &#xC81C;&#xAC00; &#xC900;&#xBE44;&#xD55C;
          &#xBB34;&#xB4DC;&#xB4F1; &#xAC1C;&#xC778;&#xAE30; &#xD55C;&#xBC88; &#xBCF4;&#xC2E4;&#xB798;&#xC694;?</p>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table>#### Prompt 일관성

실제 대화에서도 언어가 동일한 사람들 간에 말투나 억양이 조금씩 다르며, 이는 각 개인의 습관이 반영되어 나타납니다.  
 작성자 개인의 언어 습관이 Prompt에 미치는 영향을 줄이고, NUGU 페르소나에 맞는 어투를 적용하기 위한 기본 가이드는 다음과 같습니다.

·           구어체로 친근하게 응답  
 가능한 구어체를 사용해 자연스러운 대화를 도출합니다. 답변\(Prompt\) 디자인 시, 글로 적다 보면 소설이나 에세이처럼 문어체로 작성될 우려가 있습니다.  
 예\) “아이유 밤편지를 재생합니다.” 보다는 “아이유의 밤편지, 들려드릴게요.”

·           서술어 형태의 교차 배치  
 여러 문장을 제공해야 한다면 문장 서술어 부분에 ‘~에요’와 ‘~입니다’ 표현을 교차 사용하여 자연스러운 문장으로 구성합니다.  
 예\) 로그인 전에는 미리 듣기만 가능합니다. 전곡 듣기를 원하시면 누구 앱을 통해 로그인해 주세요.

<table>
  <thead>
    <tr>
      <th style="text-align:left">
        <p><b>Note!</b>
        </p>
        <p>1. &#xD55C; &#xBA85;&#xACFC; &#xB300;&#xD654;&#xD558;&#xB294; &#xAC83;&#xCC98;&#xB7FC;
          &#xC77C;&#xAD00;&#xC131; &#xC788;&#xAC8C; &#xC124;&#xACC4;&#xD574; &#xC8FC;&#xC138;&#xC694;.</p>
        <p>&#xB7; Play &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xD55C; &#xC0AC;&#xB78C;(&#xD398;&#xB974;&#xC18C;&#xB098;)&#xACFC;
          &#xB300;&#xD654;&#xD558;&#xB294; &#xAC83;&#xCC98;&#xB7FC; &#xC124;&#xACC4;&#xD574;
          &#xC8FC;&#xC138;&#xC694;.</p>
        <p>&#xB7; &#xACBD;&#xC5B4;&#xCCB4;&#xC640; &#xD3C9;&#xC5B4;&#xCCB4;&#xAC00;
          &#xC11E;&#xC778;&#xB2E4;&#xAC70;&#xB098; &#xAC11;&#xC790;&#xAE30; &#xD45C;&#xD604;
          &#xBC29;&#xC2DD;&#xC744; &#xBCC0;&#xACBD;&#xD558;&#xB294; &#xAC83;&#xC740;
          &#xC0BC;&#xAC00; &#xC8FC;&#xC138;&#xC694;.</p>
        <p>2. &#xC0AC;&#xB78C; &#xAC04; &#xB300;&#xD654;&#xCC98;&#xB7FC; &#xC790;&#xC5F0;&#xC2A4;&#xB7FD;&#xAC8C;
          &#xB514;&#xC790;&#xC778;&#xD558;&#xC138;&#xC694;.</p>
        <p>&#xB7; &#xC77C;&#xC0C1;&#xC801;&#xC778; &#xB300;&#xD654;&#xB97C; &#xD558;&#xB294;
          &#xAC83;&#xCC98;&#xB7FC; &#xC790;&#xC5F0;&#xC2A4;&#xB7EC;&#xC6B4; &#xB300;&#xD654;&#xAC00;
          &#xB418;&#xB3C4;&#xB85D; &#xAD6C;&#xC131;&#xD574; &#xC8FC;&#xC138;&#xC694;.</p>
      </th>
    </tr>
  </thead>
  <tbody></tbody>
</table>#### 발화 유도 Prompt 디자인

Prompt는 주로 사용자 발화에 대한 답변으로써 제공되지만, 반대로 사용자가 무엇을 발화해야 하는지를 안내하여 사용자의 답변을 이끌어내야 하는 경우도 있습니다. 이러한 Prompt를 ‘발화 유도 Prompt’라고 하며, 다음과 같은 점을 유의하여 디자인하여야 합니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left"><b>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xB2F5;&#xBCC0;&#xD574;&#xC57C; &#xD560;<br /> &#xB0B4;&#xC6A9;&#xC744; &#xBA85;&#xD655;&#xD788; &#xC548;&#xB0B4;</b>
      </th>
      <th style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xBB34;&#xC5C7;&#xC744; &#xB2F5;&#xBCC0;&#xD574;&#xC57C;
          &#xD558;&#xB294;&#xC9C0;&#xB97C; &#xB354; &#xBA85;&#xD655;&#xD788; &#xC54C;
          &#xC218; &#xC788;&#xB294; &#xBB38;&#xC7A5;&#xC73C;&#xB85C; &#xB514;&#xC790;&#xC778;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xC54C;&#xB78C; &#xC124;&#xC815;
          &#xC694;&#xCCAD; &#xC2DC;, &#x201C;&#xC5B8;&#xC81C;&#xB85C; &#xD560;&#xAE4C;&#xC694;?&#x201D;
          &#xB77C;&#xACE0; &#xBB3B;&#xB294; &#xAC83;&#xBCF4;&#xB2E4; &#x201C;&#xBA87;
          &#xC2DC;&#xB85C; &#xC124;&#xC815;&#xD560;&#xAE4C;&#xC694;?&#x201D; &#xB77C;&#xACE0;
          &#xBB3B;&#xB294; &#xAC83;&#xC774; &#xB354; &#xBA85;&#xD655;&#xD568; (&#xC2DC;&#xAC01;&#xC5D0;
          &#xB300;&#xD55C; &#xB2F5;&#xBCC0;&#xC744; &#xC720;&#xB3C4;)</p>
        <p>&#xB610;&#xB294;, &#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xD574;&#xC57C; &#xD558;&#xB294;
          &#xB2F5;&#xBCC0;&#xC744; &#xC81C;&#xC2DC;&#xD558;&#xC5EC; &#xC120;&#xD0DD;
          &#xBC1C;&#xD654;&#xD558;&#xB3C4;&#xB85D; &#xD560; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC8FC;&#xBB38;&#xC744; &#xC6D0;&#xD558;&#xC2DC;&#xBA74; &#x201C;&#xACB0;&#xC81C;&#xD574;&#xC918;&#x201D;,
          &#xB2E4;&#xC74C; &#xC0C1;&#xD488;&#xC744; &#xC6D0;&#xD558;&#xC2DC;&#xBA74;
          &#x201C;&#xB2E4;&#xC74C;&#x201D;&#xC774;&#xB77C;&#xACE0; &#xB9D0;&#xC500;&#xD574;&#xC8FC;&#xC138;&#xC694;.</p>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><b>&#xC778;&#xC2DD;&#xC774; &#xC5B4;&#xB824;&#xC6B4; &#xBC1C;&#xD654;<br /> &#xC720;&#xB3C4; &#xC9C0;&#xC591;</b>
      </td>
      <td style="text-align:left">
        <p>&#xC0AC;&#xC6A9;&#xC790;&#xAC00; &#xBC1C;&#xD654;&#xD574;&#xC57C; &#xD558;&#xB294;
          entity&#xAC00; &#xAE34; &#xACBD;&#xC6B0;&#xC5D0;&#xB294; &#xC778;&#xC2DD;&#xC774;
          &#xC5B4;&#xB824;&#xC6B8; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;. &#xC774;&#xB7F0;
          &#xACBD;&#xC6B0;&#xC5D0;&#xB294; &#xC0AC;&#xC6A9;&#xC790; &#xBC1C;&#xD654;&#xAC00;
          &#xC544;&#xB2CC; &#xB2E4;&#xB978; &#xBC29;&#xBC95;(&#xC608;: NUGU App.)&#xC73C;&#xB85C;
          &#xC815;&#xBCF4;&#xB97C; &#xC785;&#xB825; &#xBC1B;&#xB294; &#xAC83;&#xC744;
          &#xAD8C;&#xC7A5;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC8FC;&#xC18C;&#xB97C; &#xC785;&#xB825; &#xBC1B;&#xB294; &#xACBD;&#xC6B0;</p>
        <p>&#xC5F0;&#xC18D;&#xB41C; &#xC22B;&#xC790;&#xB098; 1&#xC74C;&#xC808; &#xC22B;&#xC790;&#xB294;
          &#xC778;&#xC2DD;&#xD558;&#xAE30; &#xC5B4;&#xB824;&#xC6B8; &#xC218; &#xC788;&#xC2B5;&#xB2C8;&#xB2E4;.
          &#xC774; &#xB610;&#xD55C; &#xB2E4;&#xB978; &#xBC29;&#xBC95;(&#xC608;: NUGU
          App.)&#xC73C;&#xB85C; &#xC815;&#xBCF4;&#xB97C; &#xC785;&#xB825; &#xBC1B;&#xB294;
          &#xAC83;&#xC744; &#xAD8C;&#xC7A5;&#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xC804;&#xD654;&#xBC88;&#xD638;&#xB098; &#xBE44;&#xBC00;&#xBC88;&#xD638;&#xB97C;
          &#xC785;&#xB825; &#xBC1B;&#xB294; &#xACBD;&#xC6B0;
          <br />(&#xC22B;&#xC790; &#xAC1C;&#xAC1C;&#xB97C; &#xC815;&#xD655;&#xD788; &#xC778;&#xC2DD;&#xD558;&#xAE30;
          &#xC5B4;&#xB824;&#xC6C0;)</p>
        <p>&#xC608;) &#xBAA9;&#xB85D; &#xC911; &#xD558;&#xB098;&#xB97C; &#xC120;&#xD0DD;&#xD574;&#xC57C;
          &#xD558;&#xB294; &#xACBD;&#xC6B0;, 1&#xC74C;&#xC808; &#xC22B;&#xC790;&#xC778;
          &#x201C;&#xC77C;&#x201D;, &#x201C;&#xC774;&#x201D; &#xB4F1;&#xC73C;&#xB85C;
          &#xBC1C;&#xD654;&#xD558;&#xC9C0; &#xC54A;&#xACE0; &#x201C;&#xCCAB;&#xBC88;&#xC9F8;&#x201D;,
          &#x201C;&#xB450;&#xBC88;&#xC9F8;&#x201D;&#xC640; &#xAC19;&#xC740; &#xBC29;&#xC2DD;&#xC73C;&#xB85C;
          &#xBC1C;&#xD654;&#xD558;&#xB3C4;&#xB85D; &#xC720;&#xB3C4;</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>&#xC0AC;&#xC6A9;&#xC790;&#xC758; &#xD655;&#xC778;&#xC774; &#xD544;&#xC694;&#xD560; &#xACBD;&#xC6B0; &#xBC1C;&#xD654; &#xC608;&#xC2DC;&#xB97C; &#xC81C;&#xC2DC;</b>
      </td>
      <td style="text-align:left">
        <p>&#xACF5;&#xAC1C;&#xC801;&#xC73C;&#xB85C; &#xBCF4;&#xC5EC;&#xC9C0;&#xB294;
          &#xC11C;&#xBE44;&#xC2A4; &#xB3D9;&#xC791;(&#xC18C;&#xC15C; &#xBBF8;&#xB514;&#xC5B4;&#xC5D0;
          &#xAC8C;&#xC2DC;), &#xB2E4;&#xB978; &#xC0AC;&#xB78C;&#xC5D0;&#xAC8C; &#xC601;&#xD5A5;&#xC744;
          &#xC8FC;&#xB294; &#xC11C;&#xBE44;&#xC2A4;(&#xBA54;&#xC2DC;&#xC9C0; &#xBCF4;&#xB0B4;&#xAE30;),
          &#xBE44;&#xC6A9;&#xC774; &#xBC1C;&#xC0DD;&#xD558;&#xAC8C; &#xB418;&#xB294;
          &#xC11C;&#xBE44;&#xC2A4; &#xB3D9;&#xC791;(&#xC11C;&#xBE44;&#xC2A4; &#xB610;&#xB294;
          &#xC7AC;&#xD654; &#xAD6C;&#xB9E4;)&#xC740; &#xC0AC;&#xC6A9;&#xC790;&#xC5D0;&#xAC8C;
          &#xD55C; &#xBC88; &#xB354; &#xD655;&#xC778;&#xC744; &#xAC70;&#xCE58;&#xB294;
          &#xAC83;&#xC774; &#xD544;&#xC694;&#xD558;&#xBA70;, &#xC774; &#xB54C; &#xC0AC;&#xC6A9;&#xC790;&#xC758;
          &#xD655;&#xC778; &#xC5EC;&#xBD80;&#xB97C; &#xBA85;&#xD655;&#xD788; &#xAD6C;&#xBD84;&#xD560;
          &#xC218; &#xC788;&#xB3C4;&#xB85D; &#x201C;&#xC608;/&#xC544;&#xB2C8;&#xC624;&#x201D;
          &#xD615;&#xC2DD;&#xC758; &#xBC1C;&#xD654;&#xBCF4;&#xB2E4;&#xB294; &#xBA85;&#xD655;&#xD55C;
          &#xC758;&#xB3C4;&#xAC00; &#xB2F4;&#xAE34; &#xBC1C;&#xD654;&#xB97C; &#xD560;
          &#xC218; &#xC788;&#xB3C4;&#xB85D; &#xC608;&#xC2DC;&#xB97C; &#xC81C;&#xC2DC;&#xD558;&#xB3C4;&#xB85D;
          &#xD569;&#xB2C8;&#xB2E4;.</p>
        <p>&#xC608;) &#xACB0;&#xC81C;&#xD560;&#xAE4C;&#xC694;? -&gt; &#xC751; (X),
          &#xC8FC;&#xBB38;&#xC744; &#xC6D0;&#xD558;&#xC2DC;&#xBA74; &#x201C;&#xACB0;&#xC81C;&#xD574;&#xC918;&#x201D;&#xB77C;&#xACE0;
          &#xB9D0;&#xC500;&#xD574;&#xC8FC;&#xC138;&#xC694;. -&gt; &#xACB0;&#xC81C;&#xD574;&#xC918;
          (O)</p>
      </td>
    </tr>
  </tbody>
</table>