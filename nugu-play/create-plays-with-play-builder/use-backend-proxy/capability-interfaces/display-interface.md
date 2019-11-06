# Display Interface

Display Interface를 사용하면 화면을 가진 디바이스에서 화면에 필요한 정보를 보여줄 수 있습니다. Display Interface 사용함으로 활성화한 Play는 Display Template을 구성하여 화면을 제어할 수 있습니다. 디바이스와 관계없이 하나의 Template이 여러 디스플레이 대응하게 됩니다. 

Display Interface를 사용하기 위해서는 우선 `General` &gt; `기본 정보` 페이지의 Capability Interface에서 `Display 제어` 항목을 `ON`으로 설정해야 합니다.

![](../../../../.gitbook/assets/capability_audio_1.jpg)

{% hint style="danger" %}
Display Interface는 AudioPlayer를 위한 Display와 중첩하여 사용할 수 없습니다. 
{% endhint %}

### 지원 디바이스 및 해상도

현재 Display Interface를 지원하는 디바이스와 해상는 다음과 같습니다.

| 디바이스 | Size \(px\) | Orientation |
| :---: | :---: | :---: |
| NU300 | 1280 x 800 | Landscape |
| Btv | 1920 x 1080 | Landscape |

### Template 유형 모아보기

다음과 같은 유형의 Template 들을 사용할 수 있습니다.  

| Type  | NU300 |  Btv |
| :--- | :---: | :---: |
| FullText1 | ![](../../../../.gitbook/assets/fulltext1_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/fulltext1_btv%20%282%29.jpg) |
| FullText2 | ![](../../../../.gitbook/assets/fulltext2_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/fulltext2_btv%20%282%29.png) |
| ImageText1 | ![](../../../../.gitbook/assets/imagetext1_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/imagetext1_btv.png) |
| ImageText2 | ![](../../../../.gitbook/assets/imagetext2_nu300.png) | ![](../../../../.gitbook/assets/imagetext2_btv%20%281%29.png) |
| ImageText3 | ![](../../../../.gitbook/assets/imagetext3_nu300%20%281%29.png) | ![](../../../../.gitbook/assets/imagetext3_btv.png) |
| ImageText4 | ![](../../../../.gitbook/assets/imagetext4_nu300.png) | ![](../../../../.gitbook/assets/imagetext4_btv.png) |
| TextList1 | ![](../../../../.gitbook/assets/textlist1_nu300.png) | ![](../../../../.gitbook/assets/textlist1_btv.png) |
| TextList2 | ![](../../../../.gitbook/assets/textlist2_nu300.png) | ![](../../../../.gitbook/assets/textlist2_btv%20%281%29.png) |
| TextList3 | ![](../../../../.gitbook/assets/textlist3_nu300.png) | ![](../../../../.gitbook/assets/textlist3_btv.png) |
| ImageList1 | ![](../../../../.gitbook/assets/imagelist1_nu300.png) | ![](../../../../.gitbook/assets/imagelist1_btv.png) |
| ImageList2 | ![](../../../../.gitbook/assets/imagelist2_nu300.png) | ![](../../../../.gitbook/assets/imagelist2_btv.jpg) |

## Context

Template이 display되는 동안 display 중인 template의 token 값을 전달됩니다. Event가 발생하는 경우는 template display되는 상황이기 때문에 context는 함께 전달됩니다.

```text
{
    "Display": {
        "version": "1.0",
        "playServiceId": "{{STRING}}",
        "token": "{{STRING}}"
    }
}
```

| parameter | type | mandatory | description |
| :--- | :---: | :---: | :--- |
| version | string | Y | 인터페이스 버전 |
| playServiceId | string | N | template을 전송한 Play의 play service id |
| token | string | N | 클릭하는 template을 식별하기 위한 unique identifier |

## 화면 구성 요소

Template 별로 알아보기 전에, 화면 구성 요소에 대해 알아보겠습니다. 

### TitleObject

화면 상단의 타이틀 영역에 들어갈 요소입니다. NU300 화면 상단 왼쪽의 홈 버튼은 기본으로 제공되는 버튼으로 Title Object와는 무관합니다.. 

```text
{
    "logo": ImageObject,
    "text": TextObject,
    "subtext" : TextObject,
    "subicon" : ImageObject,
    "button" : TextObject
}
```

| Parameter | Type        | Mandatory | Description                                            | NU300                                                      | Btv                                                            |
|-----------|-------------|-----------|--------------------------------------------------------|------------------------------------------------------------|----------------------------------------------------------------|
| logo      | ImageObject | Y         | 투명 배경의 이미지로 제공해야 함(PNG 타입) | 50x50<br>가로 Size Flexible | STB2부터 적용 예정<br>사이즈 미정 |
| text      | TextObject  | Y         | 제목                                                     | 42sp, #FFFFFF 으로 보여집니다.                                    | 36sp, #1a1a1a 으로 보여집니다.                                        |
| subtext   | TextObject  | N         | 부제목                                                    | 공백 포함 20자                                                  |                                                                |
| subicon   | ImageObject | N         | subText 왼쪽에 노출될 서브아이콘                                  | 위치 : subText 왼쪽<br>size : 36 x 36dp |          위치 : subText 왼쪽<br>size : 30 x 30dp |
| button    | TextObject  | N         | 우측에 위치하는 버튼<br>(버튼 안의 Text만 정의가능)       |                                                            |                                                                |

### ImageObject

```text
{
    "contentDescription": "{{STRING}}",
    "sources": [
        {
            "url": "{{STRING}}",
            "size": "{{STRING}}",
            "widthPixels": 1920,
            "heightPixels": 1080
        },
        {
            "url": "{{STRING}}",
            "size": "{{STRING}}",
            "widthPixels": 480,
            "heightPixels": 320
        },
        {...}
    ]
}
```

| Parameter          | Type   | Mandatory | Description                                                                                                                                                            |
|--------------------|--------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| contentDescription | string | N         |                                                                                                                                                                        |
| heightPixels       | long   | N         | 정확한 값이 아니라면, 사용하지 않는 것을 권장합니다.                                                                                                                                 |
| size               | string | N         | X_SMALL, SMALL, MEDIUM, LARGE, X_LARGE<br>화면 크기별 최적화를 위해 size 정보를 넣는 것을 권장합니다.<br>Value별 권장 사이즈는 아래의 표를 참고하세요. |
| sources            | list   | Y         | 리스트로 제공되며 클라이언트에서 화면 크기에 가장 적합한 이미지를 사용해야 합니다.                                                                                                         |
| url                | string | Y         |                                                                                                                                                                        |
| widthPixels        | long   | N         | 정확한 값이 아니라면, 사용하지 않는 것을 권장합니다.                                                                                                                                 |

| Size Value | Recommended Size \(in pixels\) |
| :---: | :---: |
| X\_SMALL | 480 x 320 |
| SMALL | 720 x 480 |
| MEDIUM | 960 x 640 |
| LARGE | 1280 x 800 |
| X\_LARGE | 1920 x 1080 |

### BackgroundObject

image와 color가 동시에 존재하면 image의 우선순위가 높습니다.

| parameter | type        | mandatory | description                                              |
|-----------|-------------|-----------|----------------------------------------------------------|
| image     | ImageObject | N         |                                                          |
| color     | string      | N         | color 형식 (RGB)<br>>default - #000000 |
| opacity   | number      | N         | NU300에만 유효하며,<br>default값은 0.7                      |

### Text Object

| parameter | type   | mandatory | description                                                                                                                                                                                                                                                                                                                                                                                                            |
|-----------|--------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color     | string | N         | color 형식 (RGB)<br>default 값은 디바이스마다 다름 |
| style     | json   | N         | 기본적으로는 상위 스타일(directive 등)을 따르며, 현재 FullText1,2의 body text에만 적용 가능.<br>CSS 속성은 모두 가능하며, 다음의 값들을 가질 수 있다.<br>text-align : left, center, right<br>opacity : 0 ~ 1<br>display : block, inline, none<br>margin : 10px<br><br>사용예.<br>{ "text-align":"center", "display": "block"}       |
| text      | string | Y         |                                                                                                                                                                                                                                                                                                                                                                                                                        |

TextObject는 Scrollable이 명시된 경우만 스크롤이 가능하고, 명시되어 있지 않으면 default로 스크롤 불가합니다.

## Template 유형별 Spec.

Display Interface에서는 크게 4종류의 Template을 제공합니다. 

* FullText : 텍스트로 화면을 구성할 때 사용합니다.
* ImageText : 이미지와 텍스트를 함께 구성할 때 사용합니다. 
* TextList : 텍스트를 중심으로 리스트를 표현할 때 사용합니다. 
* IamgeList : 이미지를 중심으로 리스트를 표현할 때 사용합니다.

### FullText1

#### 형식

```text
{
    "type": "Display.FullText1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "header": TextObject, 
        "body": TextObject,     
        "footer": TextObject
    }
}
```

| Parameter      | Type             | Required | Description                                                                                                                                                                 |
|----------------|------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type           | string           | Y       | Display.FullText1                                                                                                                                                           |
| playServiceId  | string           | Y       | 현재 template을 전송하는 play service id                                                                                                                                   |
| token          | string           | Y       |                                                                                                                                                                             |
| duration       | string           | N        | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min       |
| title          | TitleObject      | Y       |                                                                                                                                                                             |
| background     | BackgroundObject | N        |                                                                                                                                                                             |
| content.header | TextObject       | N        | 본문 제목<br>- 줄바꿈 가능 ('\n') |
| content.body   | TextObject       | Y       | 본문 내용<br>- 줄바꿈 가능 ('\n')<br>- Scrollable |
| content.footer | TextObject       | N        | 보조 설명                                                                                                                                                                       |

#### Sample Code

```text
{
    "type": "Display.FullText1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "서비스명"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#222"
    },
    "content": {
      "header": {"text": "본문 제목"},
      "body": {
        "text": "본문 내용입니다. '에펠탑'은 1889년 파리 마르스 광장에 지어진 탑으로, 프랑스의 대표적인 건축물입니다."
      },
      "footer": {"text": "background image example"}
    }
}
```

### FullText2

#### 형식

```text
{
    "type": "Display.FullText2",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "body": TextObject,     
        "footer": TextObject
    }
}
```

| Parameter      | Type             | Required | Description                                                                                                                                                                 |
|----------------|------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type           | string           | Y       | Display.FullText2                                                                                                                                                           |
| playServiceId  | string           | Y       | 현재 template을 전송하는 play service id                                                                                                                                   |
| token          | string           | Y       |                                                                                                                                                                             |
| duration       | string           | N        | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min       |
| title          | TitleObject      | Y       |                                                                                                                                                                             |
| background     | BackgroundObject | N        |                                                                                                                                                                             |
| content.body   | TextObject       | Y       | 본문 내용<br>- 줄바꿈 가능 ('\n')<br>- 최대 4줄까지 표현 (넘는 문자는 ... 처리) |
| content.footer | TextObject       | N        | 보조 설명                                                                                                                                                                       |

#### Sample Code

```text
{
    "type": "Display.FullText2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "날짜/시간"}
    },
    "background": {"color": "#465865"},
    "content": {
      "body": {
        "text": "오늘은 12월 24일 수요일입니다.\n오늘 미세먼지는 매우나쁨이네요.\n그냥 집에만 있어야겠어요."
      },
      "footer": {"text": "오후 6:03"}
    }
}
```

#### Sample Image

![](../../../../.gitbook/assets/fulltext2.png)

### ImageText1

#### 형식

```text
{
    "type": "Display.ImageText1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "imageAlign": "{{STRING}}"
        "header": TextObject,
        "body": TextObject,    
        "footer": TextObject
    }
}
```

| parameter          | type             | mandatory | description                                                                                                                                                                 |
|--------------------|------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type               | string           | Y        | Display.ImageText1                                                                                                                                                          |
| playServiceId      | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                   |
| token              | string           | Y        |                                                                                                                                                                             |
| duration           | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title              | TitleObject      | Y        |                                                                                                                                                                             |
| background         | BackgroundObject | N         |                                                                                                                                                                             |
| content.image      | ImageObject      | Y        |                                                                                                                                                                             |
| content.imageAlign | string           | Y        | LEFT, RIGHT                                                                                                                                                                |
| content.header     | TextObject       | Y        | 본문 제목<br>- 줄바꿈 가능 ('\n')<br>- 최대 3줄까지 표현 (넘는 문자는 ... 처리) |
| content.body       | TextObject       | N         | 본문 내용                                                                                                                                                                       |
| content.footer     | TextObject       | N         | 보조 설명<br>- 줄바꿈 가능 ('\n')<br>- 최대 2줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text
{
    "type": "Display.ImageText1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "content": {
      "header": {"text": "엔드 게임"},
      "body": {"text": "body text."},
      "footer": {"text": "13일째 1100만 돌파. 역대 외화 흥행 2위 달성"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "imageAlign": ""
    }
}
```

### ImageText2

#### 형식

```text
{
    "type": "Display.ImageText2",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "imageAlign": "{{STRING}}"
        "header": TextObject,     
        "body": TextObject
    }
}
```

| parameter          | type             | mandatory | description                                                                                                                                                                 |
|--------------------|------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type               | string           | Y        | Display.ImageText2                                                                                                                                                          |
| playServiceId      | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                   |
| token              | string           | Y        |                                                                                                                                                                             |
| duration           | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title              | TitleObject      | Y        |                                                                                                                                                                             |
| background         | BackgroundObject | N         |                                                                                                                                                                             |
| content.image      | ImageObject      | Y        |                                                                                                                                                                             |
| content.imageAlign | string           | Y        | LEFT, RIGHT |
| content.header     | TextObject       | N         | 본문 제목<br>최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| content.body       | TextObject       | Y        | 본문 내용<br>- 줄바꿈 가능 ('\n')<br>- 최대 6줄까지 표현 (넘는 문자는 ... 처리) |
| content.footer     | TextObject       | N         | 보조 설명<br>- 줄바꿈 가능 ('\n')<br>- 최대 2줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text

{
    "type": "Display.ImageText2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "content": {
      "header": {"text": "엔드 게임"},
      "body": {
        "text": "예상을 뛰어넘는 흥행몰이에 대부분의 언론에서 오프닝을 상향조정 했다. 현재 데드라인은 북미 제외 시장 한정 7억 달러, 헐리우드 리포터는 전체 9억 5천만 달러로 예상하고 있다. 또 이를 넘어 오프닝만 10억 달러[6]를 점치는 곳도 있었다. 그리고 미국의 박스 오피스 닷컴 및 매거진이 주요 매체 중에서는 처음으로 첫번째 주말 예측 기록을 발표했는데 북미에서만 3억 5000만 달러, 이외 지역에서는 7억 5000만 달러, 합이 11억 달러를 벌여들일 것으로 예측 집계했다.[7][8] 종전의 전세계 박스 오피스 기록은 이전 작의 6억 4100만 달러[9]를 해외 흥행으로만 갈아치운 셈이다."
      },
      "footer": {"text": "footer test"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "imageAlign": "left"
    }
}
```

### ImageText3

#### 형식

```text
{
    "type": "Display.ImageText3",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "header": TextObject,     
        "body": TextObject,
        "footer": TextObject,
    }
}
```

| parameter      | type             | mandatory | description                                                                                                                                                                 |
|----------------|------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type           | string           | Y        | Display.ImageText3                                                                                                                                                          |
| playServiceId  | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                   |
| token          | string           | Y        |                                                                                                                                                                             |
| duration       | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title          | TitleObject      | Y        |                                                                                                                                                                             |
| background     | BackgroundObject | N         |                                                                                                                                                                             |
| content.image  | ImageObject      | Y        |                                                                                                                                                                             |
| content.header | TextObject       | Y        | 본문 제목<br>최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| content.body   | TextObject       | N         | 본문 내용<br>- 줄바꿈 가능 ('\n')<br>- Scrollable |
| content.footer | TextObject       | N         | 보조설명<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text
{
    "type": "Display.ImageText3",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {"color": "#465865"},
    "content": {
      "header": {"text": "엔드 게임"},
      "body": {
        "text": "예상을 뛰어넘는 흥행몰이에 대부분의 언론에서 오프닝을 상향조정 했다. 현재 데드라인은 북미 제외 시장 한정 7억 달러, 헐리우드 리포터는 전체 9억 5천만 달러로 예상하고 있다. 또 이를 넘어 오프닝만 10억 달러[6]를 점치는 곳도 있었다. 그리고 미국의 박스 오피스 닷컴 및 매거진이 주요 매체 중에서는 처음으로 첫번째 주말 예측 기록을 발표했는데 북미에서만 3억 5000만 달러, 이외 지역에서는 7억 5000만 달러, 합이 11억 달러를 벌여들일 것으로 예측 집계했다.[7][8] 종전의 전세계 박스 오피스 기록은 이전 작의 6억 4100만 달러[9]를 해외 흥행으로만 갈아치운 셈이다."
      },
      "footer": {"text": "배급사 : 월트디즈니"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      }
    }
}
```

### ImageText4

#### 형식

```text
{
    "type": "Display.ImageText4",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "header": TextObject,     
        "body": TextObject,
        "footer": TextObject,
    }
}
```

| parameter      | type             | mandatory | description                                                                                                                                                                 |
|----------------|------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type           | string           | Y        | Display.ImageText4                                                                                                                                                          |
| playServiceId  | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                   |
| token          | string           | Y        |                                                                                                                                                                             |
| duration       | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title          | TitleObject      | Y        |                                                                                                                                                                             |
| background     | BackgroundObject | N         |                                                                                                                                                                             |
| content.image  | ImageObject      | Y        |                                                                                                                                                                             |
| content.header | TextObject       | Y        | 본문 제목<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| content.body   | TextObject       | Y        | 본문 내용<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| content.footer | TextObject       | N         | 보조설명<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text
{
    "type": "Display.ImageText4",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "My Favorite Movie"}
    },
    "background": {"color": "#465865"},
    "content": {
      "header": {"text": "본문 제목"},
      "body": {"text": "본문 내용"},
      "footer": {"text": "보조 설명"},
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      }
    }
}
```

### TextList1

#### 형식

```text
{
    "type": "Display.TextList1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        }
    ]
}
```

| parameter        | type             | mandatory | description                                                                                                                                                                 |
|------------------|------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type             | string           | Y        | Display.TextList1                                                                                                                                                           |
| playServiceId    | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                   |
| token            | string           | Y        |                                                                                                                                                                             |
| duration         | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title            | TitleObject      | Y        |                                                                                                                                                                             |
| background       | BackgroundObject | N         |                                                                                                                                                                             |
| badgeNumber      | bool             | N         | 사용자가 숫자(순서)를 발화하여 item을 선택하도록 badge를 표시할지 여부 (true - 표시함, false - 표시하지 않음)<br>default - false |
| listItems        | list             | Y        | Scrollable (스크롤이 불가능한 디바이스에서는 짤림)                                                                                                                                   |
| listItems.token  | string           | Y        | 클릭은 한 item 전체에서 가능                                                                                                                                                  |
| listItems.header | TextObject       | Y        | 본문 제목<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| listItems.body   | TextObject       | Y        | 본문 내용<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| listItems.footer | TextObject       | N         | 보조설명<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text
{
    "type": "Display.TextList1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "Movie Chart"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "listItems": [
      {
        "token": "{{111}}",
        "header": {"text": "1위"},
        "body": {"text": "앤드게임"},
        "footer": {"text": "평점 9.5/10"}
      },
      {
        "token": "{{222}}",
        "header": {"text": "2위"},
        "body": {"text": "캡틴마블"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{333}}",
        "header": {"text": "3위"},
        "body": {"text": "왓칭"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{444}}",
        "header": {"text": "4위"},
        "body": {"text": "요로나"},
        "footer": {"text": "평점 8.1/10"}
      }
    ]
}
```

### TextList2

#### 형식

```text
{
    "type": "Display.TextList2",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": TextObject,
            "footer": TextObject
        }
    ]
}
```

| parameter        | type             | mandatory | description                                                                                                                                                                 |
|------------------|------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type             | string           | Y        | Display.TextList2                                                                                                                                                           |
| playServiceId    | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                   |
| token            | string           | Y        |                                                                                                                                                                             |
| duration         | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title            | TitleObject      | Y        |                                                                                                                                                                             |
| background       | BackgroundObject | N         |                                                                                                                                                                             |
| badgeNumber      | bool             | N         | 사용자가 숫자(순서)를 발화하여 item을 선택하도록 badge를 표시할지 여부 (true - 표시함, false - 표시하지 않음)<br>default - false |
| listItems        | list             | Y        | Scrollable (스크롤이 불가능한 디바이스에서는 짤림)                                                                                                                                   |
| listItems.token  | string           | Y        | 클릭은 한 item 전체에서 가능                                                                                                                                                  |
| listItems.image  | ImageObject      | Y        |                                                                                                                                                                             |
| listItems.header | TextObject       | Y        | 본문 제목<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| listItems.body   | TextObject       | Y        | 본문 내용<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| listItems.footer | TextObject       | N         | 보조설명<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text
{
    "type": "Display.TextList2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "Movie Chart"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "1위"},
        "body": {"text": "앤드게임"},
        "footer": {"text": "평점 9.5/10"}
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "2위"},
        "body": {"text": "캡틴마블"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "3위"},
        "body": {"text": "왓칭 (watching someone who should be)"},
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "4위"},
        "body": {"text": "요로나"},
        "footer": {"text": "평점 8.1/10"}
      }
    ]
}
```

### TextList3

#### 형식

```text
{
    "type": "Display.TextList3",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": [ TextObjects ] ,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "body": [ TextObjects ],
            "footer": TextObject
        }
    ],
    "caption": TextObject
}
```

| parameter        | type                                                     | mandatory | description                                                                                                                                                                 |
|------------------|----------------------------------------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type             | string                                                   | Y        | Display.TextList3                                                                                                                                                           |
| playServiceId    | string                                                   | Y        | 현재 template을 전송하는 play service id                                                                                                                                   |
| token            | string                                                   | Y        |                                                                                                                                                                             |
| duration         | string                                                   | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title            | TitleObject                                              | Y        |                                                                                                                                                                             |
| background       | BackgroundObject                                         | N         |                                                                                                                                                                             |
| badgeNumber      | bool                                                     | N         |  사용자가 숫자(순서)를 발화하여 item을 선택하도록 badge를 표시할지 여부 (true - 표시함, false - 표시하지 않음)<br>default - false |
| listItems        | list                                                     | Y        | Scrollable (스크롤이 불가능한 디바이스에서는 짤림)                                                                                                                                   |
| listItems.token  | string                                                   | Y        | 클릭은 한 item 전체에서 가능                                                                                                                                                  |
| listItems.image  | ImageObject                                              | N         |                                                                                                                                                                             |
| listItems.header | TextObject                                               | Y        | 본문 제목<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| listItems.body   | TextObjects<br>(list of TextObject)       | Y | 본문 내용<br>- 줄바꿈 허용 / 최대 4줄<br>- footer 정의 시 3줄 제한 |
| listItems.footer | TextObject                                               | N         | 보조설명<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| caption          | TextObject                                               | N         | 전체 리스트 아이템들에 대한 보조설명<br>- 텍스트 길이 : 최대 2줄(단말에 따라 1줄) |

#### Sample Code

```text
{
    "type": "Display.TextList3",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "TextList3 - badge"},
      "subtext": {"text": "Q. {ASR} 알려줘"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#465865"
    },
    "badgeNumber": true,
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "본문제목"},
        "body": [{"text": "본문내용1"}, {"text": "본문내용2"}, {"text": "본문내용3"}],
        "footer": {"text": "보조설명"}
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "본문제목"},
        "body": [
          {"text": "본문내용1"},
          {"text": "본문내용2 (exactly)", "color": "red"},
          {"text": "본문내용3"},
          {"text": "본문내용4"}
        ]
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "3위"},
        "body": [
          {"text": "본문내용1"},
          {"text": "본문내용2"},
          {"text": "본문내용3"},
          {"text": "본문내용4"}
        ],
        "footer": {"text": "평점 9.2/10"}
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "4위 ㅁㄴㅇ xㅋㅌㅊ 123 234 asd"},
        "body": [
          {"text": "본문내용1 본문내용1 본문내용1 본문내용1"},
          {"text": "본문내용2"},
          {"text": "본문내용3"},
          {"text": "본문내용4"}
        ]
      }
    ],
    "caption": {"text": "caption"}
}
```

### ImageList1

#### 형식

```text
{
    "type": "Display.ImageList1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "footer": TextObject
        }
    ]
}
```

| parameter        | type             | mandatory | description                                                                                                                                                                                                                |
|------------------|------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type             | string           | Y        | Display.ImageList1                                                                                                                                                                                                         |
| playServiceId    | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                                                                  |
| token            | string           | Y        |                                                                                                                                                                                                                            |
| duration         | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title            | TitleObject      | Y        |                                                                                                                                                                                                                            |
| background       | BackgroundObject | N         |                                                                                                                                                                                                                            |
| badgeNumber      | bool             | N         | 사용자가 숫자(순서)를 발화하여 item을 선택하도록 badge를 표시할지 여부 (true - 표시함, false - 표시하지 않음)<br>default - false |
| badgeNumberStyle | json             | N         | 아래와 같은 Json으로 badge style 정의<br>- "background": "#f0f", // Container의 Color<br>- "color": "red", // Badge font color<br>- "border-radius": "10px" // radius |
| listItems        | list             | Y        | Scrollable (스크롤이 불가능한 디바이스에서는 짤림)                                                                                                                                                                                  |
| listItems.token  | string           | Y        | 클릭은 한 item 전체에서 가능                                                                                                                                                                                                 |
| listItems.image  | ImageObject      | Y        |                                                                                                                                                                                                                            |
| listItems.header | TextObject       | Y        | 본문 제목<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| listItems.footer | TextObject       | N         | 보조설명<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text
{
    "type": "Display.ImageList1",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "badgeNumber": true,
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "서비스명"}
    },
    "background": {
      "image": {
        "contentDescription": "{{STRING}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
            "size": "LARGE"
          }
        ]
      },
      "color": "#212171"
    },
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "아늑한 Jazz Mood"},
        "footer": {"text": "19곡"}
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "plow deep"},
        "footer": {"text": "29곡"}
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "운동 할 때 무한 반복해도 절대 질리지 않는 트랙들!"},
        "footer": {"text": "9곡"}
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
            }
          ]
        },
        "header": {"text": "절대 질리지 않는 트랙들!", "color": "red"},
        "footer": {"text": "29곡"}
      }
    ]
}
```

### ImageList2

#### 형식

```text

{
    "type": "Display.ImageList1",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "badgeNumber": true,
    "badgeNumberStyle": {
      "background": "#f0f",
      "color": "red",
      "border-radius": "10px"
    },
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "icon": ImageObject,
            "header": TextObject,
            "footer": TextObject
        },
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "icon": ImageObject,
            "header": TextObject,
            "footer": TextObject
        }
    ]
}
```

| parameter        | type             | mandatory | description                                                                                                                                                                                                                |
|------------------|------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type             | string           | Y        | Display.ImageList2                                                                                                                                                                                                         |
| playServiceId    | string           | Y        | 현재 template을 전송하는 play service id                                                                                                                                                                                  |
| token            | string           | Y        |                                                                                                                                                                                                                            |
| duration         | string           | N         | SHORT(default), MID, LONG, LONGEST<br>- SHORT - 7sec<br>- MID - 15sec<br>- LONG - 30sec<br>- LONGEST - 10min |
| title            | TitleObject      | Y        |                                                                                                                                                                                                                            |
| background       | BackgroundObject | N         |                                                                                                                                                                                                                            |
| badgeNumber      | bool             | N         | 사용자가 숫자(순서)를 발화하여 item을 선택하도록 badge를 표시할지 여부 (true - 표시함, false - 표시하지 않음)<br>default - false                                                                                 |
| badgeNumberStyle | json             | N         | 아래와 같은 Json으로 badge style 정의<br>- "background": "#f0f", // Container의 Color<br>- "color": "red", // Badge font color<br>- "border-radius": "10px" // radius |
| listItems        | list             | Y        | Scrollable (스크롤이 불가능한 디바이스에서는 짤림)                                                                                                                                                                                  |
| listItems.token  | string           | Y        | 클릭은 한 item 전체에서 가능                                                                                                                                                                                                 |
| listItems.image  | ImageObject      | Y        |                                                                                                                                                                                                                            |
| listItems.icon   | ImageObject      | N         | 상태 아이콘                                                                                                                                                                                                                     |
| listItems.header | TextObject       | Y        | 본문 제목<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |
| listItems.footer | TextObject       | N         | 보조설명<br>- 최대 1줄까지 표현 (넘는 문자는 ... 처리) |

#### Sample Code

```text
{
    "type": "Display.ImageList2",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
            "url": "http://someurl.com/name.png",
          }
        ]
      },
      "text": {"text": "서비스명"}
    },
    "background": {"color": "#212171"},
    "badgeNumber": false,
    "listItems": [
      {
        "token": "{{111}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      },
      {
        "token": "{{222}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      },
      {
        "token": "{{333}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      },
      {
        "token": "{{444}}",
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
            {
              "url": "data:image/png;base64,iVsomesomesomesome",
              "size": "LARGE"
            }
          ]
        },
        "header": {"text": "본문 제목"},
        "footer": {"text": "본문 내용"},
        "icon": {
          "sources": [
            {
              "url": "http://someurl.com/name.png",
              "size": "SMALL"
            }
          ]
        }
      }
    ]
}
```
