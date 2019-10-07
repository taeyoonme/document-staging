# SmartHomeAttribute

NUGU스마트홈을 통해 스마트홈 기기를 제어할 때 Capability나 Directive에 따라 포함되는 Attributes가 있습니다. SmartHome Attributes는 다양한 사용자 발화에 대응하여 아래와 같이 사용자 발화 데이터를 정규화하여 SmartHomeBackendProxy에 제어 요청을 보낼 때 포함합니다. IoT ServiceProvider는 지원하고자 하는 기능에 맞는 Directive가 어떠한 Attribute를 갖는지 확인하고 지원할 Attribute를 선택해야 합니다.

| SmartHomeAttribute | Description |
| :--- | :--- |
| airflowType | 설정하고자 하는 airflowType의 사용자 발화 정보. 해당 parameter의 value는 Device Discovery 당시 Response한 supprtedAirflowTypes 중 하나로 요청됩니다. |
| airflowDelta | airflowType을 몇 단계 조절할지에 대한 사용자 발화 정보입니다. 해당 parameter가 없을 경우에는 1단계를 올리도록 설정해야 합니다. |
| brightnessLevel | 사용자가 SmartHomeDevice에 설정하고자 하는 밝기의 발화 정보입니다. 1부터 100까지 설정할 수 있습니다. |
| brightnessDelta | 설정 밝기를 몇 단계 조절지에 대한 사용자 발화 정보입니다. 해당 정보가 없을 경우 1단계를 올리도록 설정합니다. |
| colorType | 사용자가 SmartHomeDevice에 설정하고자 하는 색상 정보입니다. |
| deviceTemperatureLevel | 사용자가 SmartHomeDevice에 설정하고자 하는 자체설정온도의 발화정보입니다. |
| humidityLevel | 사용자가 SmartHomeDevice에 설정하고자 하는 습도의 발화 정보입니다. %단위입니다. |
| humidityDelta | 설정습도를 몇 % 조절지에 대한 사용자 발화 정보입니다. 해당 정보가 없을 경우 humidityStep만큼 올리도록 설정합니다. |
| mode | 설정하고자 하는 mode의 사용자 발화 정보, 해당 parameter의 value는 Device Discovery 당시 응답한 supportedModes 중 하나로 요청됩니다. |
| temperatureLevel | 사용자가 SmartHomeDevice에 설정하고자 하는 온도\(섭씨\)의 발화 정보입니다. |
| temperatureDelta | 설정온도를 몇 도\(섭씨\) 올릴지에 대한 사용자 발화 정보입니다. 해당 정보가 없을 경우에는 temperatureStep만큼 올리도록 설정합니다. |

