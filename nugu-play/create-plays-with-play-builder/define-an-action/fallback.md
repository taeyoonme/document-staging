# Fallback 사용자 발화 처리하기

User Utterance Model으로 훈련시킨 NLU 엔진이 사용자의 발화를 분석하지 못할 경우, Fallback 처리됩니다.

Fallback으로 처리되는 사용자의 발화는 경우의 수가 무한이어서 특정할 수 없기 때문에, “이해하지 못했어요.”, “제가 처리할 수 없는 요청이에요” 등과 같이 공통적인 Fallback 응답을 하는 것이 일반적입니다.

그러나, Fallback 처리된 사용자의 발화문 전체는 \_UNRESOLVED\_ \_\_라는 Entity type으로 분석되므로 사용자의 발화를 Backend proxy에서 한번 더 분석하여 처리할 수도 있습니다.

아래와 같은 순서로 Fallback 발화를 Utterance Parameter에 담을 수 있습니다.

1. Global Utterance Parameter를 생성하고, Type:Role이 \_UNRESOLVED\_:\_UNRESOLVED\_를 매핑합니다. 
2. Common Action을 생성하고, NUGU.ACTION.fallback의 Output을 Common Action으로 선택합니다. 
3. Common Action에서 \_UNRESOLVED\_ Entity가 매핑된 파라미터를 활용합니다.

