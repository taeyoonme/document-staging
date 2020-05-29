# Display Interface

Display Interface를 사용하면 화면을 가진 디바이스에서 화면에 필요한 정보를 보여줄 수 있습니다. Display Interface 사용하여 Play는 Display Template을 구성하여 화면을 제어할 수 있습니다. 디바이스와 관계없이 하나의 Template이 여러 디스플레이 대응하게 됩니다.

Display Interface를 사용하기 위해서는 우선 `General` &gt; `기본 정보` 페이지의 Capability Interface에서 `Display 제어` 항목을 `ON`으로 설정해야 합니다.

![](../../../../.gitbook/assets/capability_audio_1.jpg)

{% hint style="danger" %}
Display Interface는 AudioPlayer를 위한 Display와 중첩하여 사용하지 않는 것을 권장합니다. 불가피한 경우, Display Interface의 우선순위를 높여서 사용하는 것을 권장합니다.
{% endhint %}

### 

## 지원 디바이스 및 해상도

현재 Display Interface를 지원하는 디바이스와 해상는 다음과 같습니다.

| 디바이스 | Size \(px\) | Orientation |
| :---: | :---: | :---: |
| NU300 | 1280 x 800 | Landscape |
| Btv | 1920 x 1080 | Landscape |

### 

## Template Types

다음과 같은 유형의 화면 Template을 지원합니다.

| Type | NU300 | Btv |
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
| TextList4 | ![](../../../../.gitbook/assets/textlist4_nu300.png) | ![](../../../../.gitbook/assets/textlist4_btv.png) |
| ImageList1 | ![](../../../../.gitbook/assets/imagelist1_nu300.png) | ![](../../../../.gitbook/assets/imagelist1_btv.png) |
| ImageList2 | ![](../../../../.gitbook/assets/imagelist2_nu300.png) | ![](../../../../.gitbook/assets/imagelist2_btv.jpg) |
| ImageList3 | ![](../../../../.gitbook/assets/imagelist3_nu300.png) | ![](../../../../.gitbook/assets/imagelist3_btv%20%281%29.png) |

## Context

화면이 나타나는 동안 해당 화면의 token 값을 전달됩니다. Event가 발생하는 경우는 template display되는 상황이기 때문에 context는 함께 전달됩니다.

```yaml
{
    "Display": {
        "version": "1.0",
        "playServiceId": "{{STRING}}",
        "token": "{{STRING}}"
    }
}
```

| Parameter | Type | 필수 | Description |
| :--- | :---: | :---: | :--- |
| version | string | Y | 인터페이스 버전 |
| playServiceId | string | N | template을 전송한 Play의 play service id |
| token | string | N | 클릭하는 template을 식별하기 위한 unique identifier |

## 

## 화면 구성 요소

Template 유형 별로 알아보기 전, 화면 구성 요소에 대해 알아보겠습니다.

### TTS

String type의 필드에 "{{$TTS}}"라고 입력하면, Play가 응답으로 내보낸 발화 텍스트를 해당 필드에 채워서 보냅니다.

```yaml
{
  "type": "Display.ImageText2",
  "version": "1.0",
  "token": "TTS Test",
  "title": {
    "logo": {
      "sources": [
        {
          "url": "http://someurl.com/name.png"
        }
      ]
    },
    "text": {
      "text": "TTS Test logo"
    }
  },
  "content": {
    "imageAlign": "LEFT",
    "header": {
      "text": "TTS Test header"
    },
    "image": {
      "sources": [
        {
          "url": "http://someurl.com/name.png"
        }
      ]
    },
    "body": {
      "color": null,
      "text": "{{$TTS}}"
    }
  }
}
```



### TitleObject

화면 상단의 타이틀 영역에 들어갈 요소입니다. NU300 화면 상단 왼쪽의 홈 버튼은 기본으로 제공되는 버튼으로 TitleObject와는 무관합니다.

```yaml
{
    "logo": ImageObject,
    "text": TextObject,
    "subtext" : TextObject,
    "subicon" : ImageObject,
    "button" : TextObject
}
```

| Parameter | Type | 필수 | Description | NU300 | Btv |
| :--- | :--- | :--- | :--- | :--- | :--- |
| logo | ImageObject | Y | 투명 배경의 이미지로 제공해야 함\(PNG\) | 50x50 가로 Size Flexible | STB2부터 적용 예정 사이즈 미정 |
| text | TextObject | Y | 제목 | 42sp, \#FFFFFF  | 36sp, \#1A1A1A  |
| subtext | TextObject | N | 부제목 | 공백 포함 20자 |  |
| subicon | ImageObject | N | subText 왼쪽에 노출될 서브아이콘 | 위치 : subText 왼쪽 size : 36 x 36dp | 위치 : subText 왼쪽 size : 30 x 30dp |
| button | TextObject | N | 우측에 위치하는 버튼 \(버튼 안의 Text만 정의가능\) |  |  |

### 

### ImageObject

```yaml
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

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| contentDescription | string | N |  |
| heightPixels | long | N |  |
| size | string | N | X\_SMALL, SMALL, MEDIUM, LARGE, X\_LARGE 화면 크기별 최적화를 위해 size 정보를 넣는 것을 권장합니다. |
| sources | list | Y |  |
| url | string | Y |  |
| widthPixels | long | N |  |
| heightPixels | long | N |  |

Size 별 권장 사이즈는 아래의 표를 참고하세요.

| Size Value | Recommended Size \(in pixels\) |
| :---: | :---: |
| X\_SMALL | 480 x 320 |
| SMALL | 720 x 480 |
| MEDIUM | 960 x 640 |
| LARGE | 1280 x 800 |
| X\_LARGE | 1920 x 1080 |

### 

### BackgroundObject

```yaml
{
    "image": ImageObject,
    "color": "{{STRING}}"
}
```

image와 color가 동시에 존재하면 image의 우선순위가 높습니다.

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">type</th>
      <th style="text-align:left">&#xD544;&#xC218;</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">image</td>
      <td style="text-align:left">ImageObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">color</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>hex color code</p>
        <p>(default : #000000)</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">opacity</td>
      <td style="text-align:left">number</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">NU300&#xC5D0;&#xB9CC; &#xC720;&#xD6A8;
        <br />default : 0.7</td>
    </tr>
  </tbody>
</table>

### 

### TextObject

```yaml
{
    "text": "{{STRING}}",
    "color": "{{STRING}}"
}
```

| Parameter | type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| color | string | N | hex color code |
| style | json | N | 기본적으로는 상위 스타일\(directive 등\)을 따르며,  FullText1,2의 body text에만 적용 가능. CSS 속성은 모두 가능하며, 다음의 값들을 가질 수 있다. text-align : left, center, right opacity : 0 ~ 1 display : block, inline, none margin : 10px  예 : { "text-align":"center", "display": "block"} |
| text | string | Y |  |

TextObject는 Scrollable이 명시된 경우만 스크롤이 가능합니다.



### ButtonObject

```yaml
{
    "text": "{{STRING}}",
    "token": "{{STRING}}"
}
```

| Parameter | type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| text | string | Y | 버튼 텍스트 |
| token | string | Y | 클릭 시 전달될 토큰 값 |

## 

## Template 별 directive

Display Interface에서는 크게 4종류의 Template을 제공하며, 화면을 닫을 때는 close directive를 사용해야 합니다.

* FullText : 텍스트로 화면을 구성할 때 사용합니다.
* ImageText : 이미지와 텍스트를 함께 구성할 때 사용합니다. 
* TextList : 텍스트를 중심으로 리스트를 표현할 때 사용합니다. 
* ImageList : 이미지를 중심으로 리스트를 표현할 때 사용합니다.

### FullText1

#### 형식

```yaml
{
    "type": "Display.FullText1",
    "version": "1.0",
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

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.FullText1 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| content.header | TextObject | N | 본문 제목 - 줄바꿈 가능 \('\n'\) |
| content.body | TextObject | Y | 본문 내용 - 줄바꿈 가능 \('\n'\) - Scrollable |
| content.footer | TextObject | N | 보조 설명 |

#### Sample Code

```yaml
{
      "type": "Display.FullText1",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "NUGU 백과"
        }
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
        "color": ""
      },
      "content": {
        "header": {
          "text": "독도"
        },
        "body": {
          "text": "‘독도’는 동해의 남서부인 울릉도와 오키 제도 사이에 있는 섬으로, 동도와 서도를 포함하고 총 91개의 섬들로 이루어져 있습니다."
        },    
        "footer": {
            "text": "출처 : 위키피디아"
        }
      }
    }
}
```

#### 샘플 이미지

![](../../../../.gitbook/assets/2019-11-07-10.40.57.png)



### FullText2

#### 형식

```yaml
{
    "type": "Display.FullText2",
    "version": "1.0",
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

| Parameter | Type | 필 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.FullText2 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| content.body | TextObject | Y | 본문 내용 - 줄바꿈 가능 \('\n'\) - 최대 4줄까지 표현 \(넘는 문자는 ... 처리\) |
| content.footer | TextObject | N | 보조 설명 |

#### Sample Code

```yaml
{
    "type": "Display.FullText2",
    "version": "1.0",
    "playServiceId": "{{playServiceId}}",
    "token": "{{token}}",
    "title": {
      "logo": {
        "contentDescription": "{{contentDescription}}",
        "sources": [
          {
              "url": "http://someurl.com/name.png"
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

![](../../../../.gitbook/assets/fulltext2.png)

### ImageText1

#### 형식

```yaml
{
    "type": "Display.ImageText1",
    "version": "1.0",
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

| parameter | type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.ImageText1 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| content.image | ImageObject | Y |  |
| content.imageAlign | string | Y | LEFT, RIGHT |
| content.header | TextObject | Y | 본문 제목 - 줄바꿈 가능 \('\n'\) - 최대 3줄까지 표현 \(넘는 문자는 ... 처리\) |
| content.body | TextObject | N | 본문 내용 |
| content.footer | TextObject | N | 보조 설명 - 줄바꿈 가능 \('\n'\) - 최대 2줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.ImageText1",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "추천 영화"
        }
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
          }
      },
      "content":{
        "header": {
          "text": "알라딘"
        },
        "body":{
          "text": "모험, 가족, 판타지"
        },
        "footer": {
          "text": "머나먼 사막 속 신비의 아그라바 왕국의 시대. 좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법..."
        },
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        }
    }
}
```

![](../../../../.gitbook/assets/imagetext1.png)



### ImageText2

#### 형식

```yaml
{
    "type": "Display.ImageText2",
    "version": "1.0",
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

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.ImageText2 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| content.image | ImageObject | Y |  |
| content.imageAlign | string | Y | LEFT, RIGHT |
| content.header | TextObject | N | 본문 제목 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| content.body | TextObject | Y | 본문 내용 - 줄바꿈 가능 \('\n'\) - 최대 6줄까지 표현 \(넘는 문자는 ... 처리\) |
| content.footer | TextObject | N | 보조 설명 - 줄바꿈 가능 \('\n'\) - 최대 2줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.ImageText2",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "추천 영화"
        }
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
          }
      },
      "content":{
        "header": {
          "text": "알라딘"
        },
        "body":{
          "text": "머나먼 사막 속 신비의 아그라바 왕국의 시대. 좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법 램프를 찾아 나섰다가 주인에게 세 가지 소원을 들어주는 지니를 만나게 되고..."
        },
        "footer": {
          "text": "모험, 가족, 판타지"
        },
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        }
    }
}
```

![](../../../../.gitbook/assets/imagetext2%20%281%29.png)

### ImageText3

#### 형식

```yaml
{
    "type": "Display.ImageText3",
    "version": "1.0",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "header": TextObject,     
        "body": TextObject,
        "footer": TextObject
    }
}
```

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.ImageText3 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| content.image | ImageObject | Y |  |
| content.header | TextObject | Y | 본문 제목 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| content.body | TextObject | N | 본문 내용 - 줄바꿈 가능 \('\n'\) - Scrollable |
| content.footer | TextObject | N | 보조설명 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.ImageText3",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "추천 영화"
        }
      },
      "background": {
        "color": "#0F336C"
      },
      "content":{
        "header": {
          "text": "알라딘"
        },
        "body":{
          "text": "머나먼 사막 속 신비의 아그라바 왕국의 시대. 좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법 램프를 찾아 나섰다가 주인에게 세 가지 소원을 들어주는 지니를 만나게 되고..."
        },
        "footer": {
          "text": "모험, 가족, 판타지"
        },
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        }
    }
}
```

![](../../../../.gitbook/assets/imagetext3%20%281%29.png)





### ImageText4

#### 형식

```yaml
{
    "type": "Display.ImageText4",
    "version": "1.0",
    "playServiceId": "{{STRING}}",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "content": {
        "image": ImageObject,
        "header": TextObject,     
        "body": TextObject,
        "footer": TextObject
    }
}
```

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.ImageText4 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| content.image | ImageObject | Y |  |
| content.header | TextObject | Y | 본문 제목 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| content.body | TextObject | Y | 본문 내용 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| content.footer | TextObject | N | 보조설명 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.ImageText4",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "추천 영화"
        }
      },
      "background": {
        "color": "#0F336C"
      },
      "content":{
        "header": {
          "text": "알라딘"
        },
        "body":{
          "text": "2019.12.24 개봉"
        },
        "footer": {
          "text": "모험, 가족, 판타지"
        },
        "image": {
          "contentDescription": "{{STRING}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        }
    }
}
```

![](../../../../.gitbook/assets/imagetext4.png)



### TextList1

#### 형식

```yaml
{
    "type": "Display.TextList1",
    "version": "1.0",
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

| Parameter | Type | 필 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.TextList1 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| badgeNumber | bool | N | 사용자가 숫자\(순서\)를 발화하여 item을 선택하도록 badge를 표시할지 여부 \(true - 표시함, false - 표시하지 않음\) default - false |
| listItems | list | Y | Scrollable \(스크롤이 불가능한 디바이스에서는 짤림\) |
| listItems.token | string | Y | 클릭은 한 item 전체에서 가능 |
| listItems.header | TextObject | Y | 본문 제목 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.body | TextObject | Y | 본문 내용 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.footer | TextObject | N | 보조설명 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.TextList1",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "발라드 차트"
        }
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
          }
      },
      "listItems": [
        {
          "token": "{{111}}",
          "header": {
            "text": "1위"
          },
          "body": {
            "text": "오늘도 빛나는 너에게"
          },
          "footer": {
            "text": "마크툽(Maktub)"
          }
        },
        {
          "token": "{{222}}",
          "header": {
            "text": "2위"
          },
          "body": {
            "text": "2002"
          },
          "footer": {
            "text": "Anne-Marie"
          }
        },
        {
          "token": "{{333}}",
          "header": {
            "text": "3위"
          },
          "body": {
            "text": "사계 (Four Seasons)"
          },
          "footer": {
            "text": "태연(TAEYEON)"
          }
        },
        {
          "token": "{{444}}",
          "header": {
            "text": "4위"
          },
          "body": {
            "text": "워커홀릭"
          },
          "footer": {
            "text": "볼빨간 사춘기"
          }
        }
    ]
}
```





### TextList2

#### 형식

```yaml
{
    "type": "Display.TextList2",
    "version": "1.0",
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

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.TextList2 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| badgeNumber | bool | N | 사용자가 숫자\(순서\)를 발화하여 item을 선택하도록 badge를 표시할지 여부 \(true - 표시함, false - 표시하지 않음\) default - false |
| listItems | list | Y | Scrollable \(스크롤이 불가능한 디바이스에서는 짤림\) |
| listItems.token | string | Y | 클릭은 한 item 전체에서 가능 |
| listItems.image | ImageObject | Y |  |
| listItems.header | TextObject | Y | 본문 제목 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.body | TextObject | Y | 본문 내용 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.footer | TextObject | N | 보조설명 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.TextList2",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "발라드 차트"
        }
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
        }
      },
      "listItems": [
        {
          "token": "{{111}}",
          "header": {
            "text": "1"
          },
          "body": {
            "text": "오늘도 빛나는 너에게"
          },
          "footer": {
            "text": "마크툽(Maktub)"
          },
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png",
                    "size": "LARGE"
                }
              ]
          }
        },
        {
          "token": "{{222}}",
          "header": {
            "text": "2"
          },
          "body": {
            "text": "2002"
          },
          "footer": {
            "text": "Anne-Marie"
          },
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png",
                    "size": "LARGE"
                }
              ]
          }
        },
        {
          "token": "{{333}}",
          "header": {
            "text": "3"
          },
          "body": {
            "text": "사계 (Four Seasons)"
          },
          "footer": {
            "text": "태연(TAEYEON)"
          },
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png",
                    "size": "LARGE"
                }
              ]
          }
        },
        {
          "token": "{{444}}",
          "header": {
            "text": "4"
          },
          "body": {
            "text": "워커홀릭"
          },
          "footer": {
            "text": "볼빨간 사춘기"
          }
        }
    ]
}
```

![](../../../../.gitbook/assets/textlist1.png)

### 

### TextList3

#### 형식

```yaml
{
    "type": "Display.TextList3",
    "version": "1.0",
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

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.TextList3 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| badgeNumber | bool | N | 사용자가 숫자\(순서\)를 발화하여 item을 선택하도록 badge를 표시할지 여부 \(true - 표시함, false - 표시하지 않음\) default - false |
| listItems | list | Y | Scrollable \(스크롤이 불가능한 디바이스에서는 짤림\) |
| listItems.token | string | Y | 클릭은 한 item 전체에서 가능 |
| listItems.image | ImageObject | N |  |
| listItems.header | TextObject | Y | 본문 제목 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.body | TextObjects \(list of TextObject\) | Y | 본문 내용 - 줄바꿈 허용 / 최대 4줄 - footer 정의 시 3줄 제한 \(footer객체는 빈객체\({}\)로도 정의가 되어 있으면 3줄로 제한됨\) |
| listItems.footer | TextObject | N | 보조설명 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| caption | TextObject | N | 전체 리스트 아이템들에 대한 보조설명 - 텍스트 길이 : 최대 2줄\(단말에 따라 1줄\) |

#### Sample Code

```yaml
{
      "type": "Display.TextList3",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "추천 영화"
        }
      },
      "background": {
        "color": "#0F336C"
      },
      "badgeNumber": true,
      "listItems": [
        {
          "token": "{{111}}",
          "header": {
            "text": "알라딘"
          },
          "body": [
            {"text": "감독 : 가이 리치"},
            {"text": "출연 : 윌 스미스, 메나 마수드, 나오미 누구지?"},
            {"text": "개봉일자 : 2019.5.23"},
            {"text": "전체 관람가"}
          ],
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png",
                    "size": "LARGE"
                }
              ]
          }
        },
        {
          "token": "{{222}}",
          "header": {
            "text": "어벤저스 엔드게임"
          },
          "body": [{
            "text": "감독: 안소니 루소, 조 루소"
          }],
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png",
                    "size": "LARGE"
                }
              ]
          }
        }
    ]
}
```

![](../../../../.gitbook/assets/textlist3.png)



### TextList4

#### 형식

```yaml
{
    "type": "Display.TextList4",
    "version": "1.0",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "listItems": [
        {
            "header": TextObject,
            "body": [ TextObjects ],
            "button": ButtonObject
        }
    ]
}
```

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Type</th>
      <th style="text-align:left">&#xD544;&#xC218;</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">type</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Display.TextList4</td>
    </tr>
    <tr>
      <td style="text-align:left">version</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xC778;&#xD130;&#xD398;&#xC774;&#xC2A4; &#xBC84;&#xC804;, &#xAE30;&#xBCF8;&#xAC12;&#xC740;
        1.0</td>
    </tr>
    <tr>
      <td style="text-align:left">playServiceId</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xD604;&#xC7AC; template&#xC744; &#xC804;&#xC1A1;&#xD558;&#xB294; play
        service id</td>
    </tr>
    <tr>
      <td style="text-align:left">token</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">duration</td>
      <td style="text-align:left">string</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">SHORT(default), MID, LONG, LONGEST
        <br />- SHORT - 7sec
        <br />- MID - 15sec
        <br />- LONG - 30sec
        <br />- LONGEST - 10min</td>
    </tr>
    <tr>
      <td style="text-align:left">title</td>
      <td style="text-align:left">TitleObject</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">background</td>
      <td style="text-align:left">BackgroundObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left"></td>
    </tr>
    <tr>
      <td style="text-align:left">listItems</td>
      <td style="text-align:left">list</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">Scrollable (&#xC2A4;&#xD06C;&#xB864;&#xC774; &#xBD88;&#xAC00;&#xB2A5;&#xD55C;
        &#xB514;&#xBC14;&#xC774;&#xC2A4;&#xC5D0;&#xC11C;&#xB294; &#xC9E4;&#xB9BC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.header</td>
      <td style="text-align:left">TextObject</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">&#xBCF8;&#xBB38; &#xC81C;&#xBAA9;
        <br />- &#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
        &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.body</td>
      <td style="text-align:left">TextObjects
        <br />(list of TextObject)</td>
      <td style="text-align:left">Y</td>
      <td style="text-align:left">List &#xC544;&#xC774;&#xD15C;&#xC758; &#xBCF8;&#xBB38; &#xB0B4;&#xC6A9;
        <br
        />- &#xCD5C;&#xB300; 1&#xC904;&#xAE4C;&#xC9C0; &#xD45C;&#xD604; (&#xB118;&#xB294;
        &#xBB38;&#xC790;&#xB294; ... &#xCC98;&#xB9AC;)</td>
    </tr>
    <tr>
      <td style="text-align:left">listItems.button</td>
      <td style="text-align:left">ButtonObject</td>
      <td style="text-align:left">N</td>
      <td style="text-align:left">
        <p>List &#xC544;&#xC774;&#xD15C;&#xC758; &#xBC84;&#xD2BC;</p>
        <p>- body&#xAC00; 2&#xC904;&#xC778; &#xACBD;&#xC6B0;&#xC5D0; &#xCD5C;&#xC801;&#xD654;
          &#xB418;&#xC5B4; &#xC788;&#xC74C;</p>
      </td>
    </tr>
  </tbody>
</table>

#### Sample Code

```yaml
{
      "type": "Display.TextList4",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "추천 영화"
        }
      },
      "background": {
        "color": "#0F336C"
      },
      "listItems": [
        {
          "token": "{{111}}",
          "header": {
            "text": "알라딘"
          },
          "body": [
            {"text": "머나먼 사막 속 신비의 아그라바 왕국의 시대."},
            {"text": "좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법 램프를 찾아 나섰다가 말았다가~"}
          ],
          "button": {
            "text": "상세보기",
            "token": "{{button1}}"
          }
        },
        {
          "token": "{{222}}",
          "header": {
            "text": "알라딘"
          },
          "body": [
            {"text": "머나먼 사막 속 신비의 아그라바 왕국의 시대."},
            {"text": "좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법 램프를 찾아 나섰다가 말았다가~"}
          ],
          "button": {
            "text": "상세보기",
            "token": "{{button1}}"
          }
        },
        {
          "token": "{{333}}",
          "header": {
            "text": "알라딘"
          },
          "body": [
            {"text": "머나먼 사막 속 신비의 아그라바 왕국의 시대."},
            {"text": "좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법 램프를 찾아 나섰다가 말았다가~"}
          ],
          "button": {
            "text": "상세보기",
            "token": "{{button1}}"
          }
        }
    ]
}
```

![](../../../../.gitbook/assets/textlist4.png)









### ImageList1

#### 형식

```yaml
{
    "type": "Display.ImageList1",
    "version": "1.0",
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

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.ImageList1 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| badgeNumber | bool | N | 사용자가 숫자\(순서\)를 발화하여 item을 선택하도록 badge를 표시할지 여부 \(true - 표시함, false - 표시하지 않음\) default - false |
| badgeNumberStyle | json | N | 아래와 같은 Json으로 badge style 정의 - "background": "\#f0f", // Container의 Color - "color": "red", // Badge font color - "border-radius": "10px" // radius |
| listItems | list | Y | Scrollable \(스크롤이 불가능한 디바이스에서는 짤림\) |
| listItems.token | string | Y | 클릭은 한 item 전체에서 가능 |
| listItems.image | ImageObject | Y |  |
| listItems.header | TextObject | Y | 본문 제목 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.footer | TextObject | N | 보조설명 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.ImageList1",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "내 플레이리스트"
        }
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
          }
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
                    "size": "LARGE"
                }
            ]
          },
          "header": {
            "text": "감성 리메이크"
          },
          "footer": {
            "text": "19곡"
          }
        },
        {
          "token": "{{222}}",
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "Deep Plow"
          },
          "footer": {
            "text": "29곡"
          }
        },
        {
          "token": "{{333}}",
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "운동 할 때 무한 반복해도 절대 질리지 않는 트랙들!"
          },
          "footer": {
            "text": "9곡"
          }
        }
    ]
}
```

![](../../../../.gitbook/assets/imagelist1.png)



### ImageList2

#### 형식

```yaml
{
    "type": "Display.ImageList1",
    "version": "1.0",
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

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.ImageList2 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| badgeNumber | bool | N | 사용자가 숫자\(순서\)를 발화하여 item을 선택하도록 badge를 표시할지 여부 \(true - 표시함, false - 표시하지 않음\) default - false |
| badgeNumberStyle | json | N | 아래와 같은 Json으로 badge style 정의 - "background": "\#f0f", // Container의 Color - "color": "red", // Badge font color - "border-radius": "10px" // radius |
| listItems | list | Y | Scrollable \(스크롤이 불가능한 디바이스에서는 짤림\) |
| listItems.token | string | Y | 클릭은 한 item 전체에서 가능 |
| listItems.image | ImageObject | Y |  |
| listItems.icon | ImageObject | N | 상태 아이콘 |
| listItems.header | TextObject | Y | 본문 제목 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.footer | TextObject | N | 보조설명 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |

#### Sample Code

```yaml
{
      "type": "Display.ImageList2",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "내 플레이리스트"
        }
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
          }
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
          "header": {
            "text": "감성 리메이크"
          },
          "footer": {
            "text": "19곡"
          },
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
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "Deep Plow"
          },
          "footer": {
            "text": "1분 34초"
          },
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
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "운동 할 때 무한 반복해도 절대 질리지 않는 트랙들!"
          },
          "footer": {
            "text": "9곡"
          }
        }
    ]
}
```

![](../../../../.gitbook/assets/imagelist2%20%281%29.png)



### ImageList3

#### 형식

```yaml

{
    "type": "Display.ImageList3",
    "version": "1.0",
    "token": "{{STRING}}",
    "duration": "{{STRING}}",
    "title" : TitleObject,
    "background": BackgroundObject,
    "listItems": [
        {
            "token": "{{STRING}}",
            "image": ImageObject,
            "header": TextObject,
            "icon": ImageObject
        }
    ]
}
```

| Parameter | Type | 필수 | Description |
| :--- | :--- | :--- | :--- |
| type | string | Y | Display.ImageList3 |
| version | string | Y | 인터페이스 버전, 기본값은 1.0 |
| playServiceId | string | Y | 현재 template을 전송하는 play service id |
| token | string | Y |  |
| duration | string | N | SHORT\(default\), MID, LONG, LONGEST - SHORT - 7sec - MID - 15sec - LONG - 30sec - LONGEST - 10min |
| title | TitleObject | Y |  |
| background | BackgroundObject | N |  |
| listItems | list | Y | Scrollable \(스크롤이 불가능한 디바이스에서는 짤림\) |
| listItems.token | string | Y | 클릭 시에 전달될 토 |
| listItems.header | TextObject | Y | List 제 - 최대 1줄까지 표현 \(넘는 문자는 ... 처리\) |
| listItems.image | ImageObject | Y | List 이미지 - 리스트 제목 좌측에 위치하는 이미지 |
| listItems.icon | TextObject | N | icon 이미지 - 리스트 제목 우측에 위치하는 new 등의 배지 |

#### Sample Code

```yaml
{
      "type": "Display.ImageList3",
      "version": "1.0",
      "playServiceId": "{{playServiceId}}",
      "token": "{{token}}",
      "title" : {
        "logo": {
          "contentDescription": "{{contentDescription}}",
          "sources": [
              {
                  "url": "http://someurl.com/name.png"
              }
          ]
        },
        "text": {
            "text": "내 플레이리스트"
        }
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
          }
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
          "header": {
            "text": "감성 리메이크"
          },
          "icon": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png",
                    "size": "X_SMALL"
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
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "Deep Plow"
          }
        },
        {
          "token": "{{333}}",
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "운동 할 때 무한 반복해도 절대 질리지 않는 트랙들!"
          }
        },
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
          "header": {
            "text": "감성 리메이크"
          }
        },
        {
          "token": "{{222}}",
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "Deep Plow"
          }
        },
        {
          "token": "{{333}}",
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "운동 할 때 무한 반복해도 절대 질리지 않는 트랙들!"
          }
        },
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
          "header": {
            "text": "감성 리메이크"
          }
        },
        {
          "token": "{{222}}",
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "Deep Plow"
          }
        },
        {
          "token": "{{333}}",
          "image": {
            "contentDescription": "{{STRING}}",
            "sources": [
                {
                    "url": "http://someurl.com/name.png"
                }
            ]
          },
          "header": {
            "text": "운동 할 때 무한 반복해도 절대 질리지 않는 트랙들!"
          }
        }
    ]
}
```

![](../../../../.gitbook/assets/imagelist3%20%281%29.png)

