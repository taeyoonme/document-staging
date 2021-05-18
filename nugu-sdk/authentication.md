# Authentication

NUGU 플랫폼 인증은 [OAuth 2.0](https://tools.ietf.org/html/rfc6749)의 규격을 지원하고, NUGU의 회원 체계는 SK텔레콤의 [T아이디](https://www.skt-id.co.kr)를 따릅니다.

플랫폼 인증을 위해서는 NUGU에서 별도로 발급하는 `Client Id, Client Secret`과 제휴사에서 등록한 `Redirect Uri` 정보가 필요합니다. 인증 정보는 체험판 신청으로 발급 받을 수 있으며, 정식판 제휴 시에는 PoC 관리 메뉴에서 발급 받은 정보를 확인 할 수 있습니다.

## Authorize Endpoint

`response_type=code` 만 사용 됩니다.

`data` 파라미터를 사용하여 디바이스 일련번호를 전달 할 수 있습니다.

> {"deviceSerialNumber":"DEVICE\_SERIAL\_NUMBER"}
>
> %7B%22deviceSerialNumber%22%3A%22DEVICE\_SERIAL\_NUMBER%22%7D

{% api-method method="get" host="https://api.host.domain" path="/v1/auth/oauth/authorize" %}
{% api-method-summary %}
인증 요청 \(Authorize Endpoint\)
{% endapi-method-summary %}

{% api-method-description %}
\*NUGU계정 미사용, 체험판 사용 시에 불필요합니다.
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-query-parameters %}
{% api-method-parameter name="client\_id" type="string" required=true %}
발급받은 ClientId를 사용 합니다.
{% endapi-method-parameter %}

{% api-method-parameter name="response\_type" type="string" required=true %}
code 만 사용 됩니다.
{% endapi-method-parameter %}

{% api-method-parameter name="redirect\_uri" type="string" required=true %}
설정한 RedirectUri를 사용합니다.
{% endapi-method-parameter %}

{% api-method-parameter name="scope" type="string" required=true %}
\(TODO\)
{% endapi-method-parameter %}

{% api-method-parameter name="data" type="string" required=true %}
추가적인 데이터를 포함됩니다.
{% endapi-method-parameter %}

{% api-method-parameter name="state" type="string" required=true %}
CSRF를 위해 사용 되는 값입니다.
{% endapi-method-parameter %}
{% endapi-method-query-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=302 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 302 
Date: Mon, 14 Oct 2019 02:24:58 GMT
Location: {redirect_uri}?code={code}&state={state}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

## Token Endpoint

`grant_type=refresh_token`, `grant_type=authorization_code` , `grant_type=client_credentials` 가사용 됩니다.

NUGU계정 미사용, 체험판은 `grant_type=client_credentials` 을 사용합니다.

Client 인증 정보는 Body Parameter\(application/x-www-form-urlencoded\)를 사용 합니다.

{% api-method method="post" host="https://api.host.domain" path="/v1/auth/oauth/token" %}
{% api-method-summary %}
토큰 요청 \(Token Endpoint\)
{% endapi-method-summary %}

{% api-method-description %}
NUGU계정 미사용, 체험판 사용 시에는 code와 redirect\_url 입력이 불필요합니다.
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-form-data-parameters %}
{% api-method-parameter name="data" type="string" required=true %}
추가적인 데이터가 포함 됩니다. ex\) {"deviceSerialNumber":"DEVICE\_SERIAL\_NUMBER"}
{% endapi-method-parameter %}

{% api-method-parameter name="grant\_type" type="string" required=true %}
authorization\_code \(신규\), client\_credentials \(NUGU 회원 미사용, 체험\)
{% endapi-method-parameter %}

{% api-method-parameter name="code" type="string" required=false %}
응답 받은 code 값을 사용 합니다.
{% endapi-method-parameter %}

{% api-method-parameter name="redirect\_uri" type="string" required=false %}
인증 요청 시 사용된 redirect\_uri를 사용합니다.
{% endapi-method-parameter %}

{% api-method-parameter name="client\_id" type="string" required=true %}
발급 받은 ClientId를 사용합니다.
{% endapi-method-parameter %}

{% api-method-parameter name="client\_secret" type="string" required=true %}
발급 받은 ClientSecret을 사용합니다.
{% endapi-method-parameter %}
{% endapi-method-form-data-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 200 
Date: Mon, 14 Oct 2019 02:24:59 GMT
Content-Type: application/json;charset=UTF-8

{
  "access_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjM3MTg1MDM1NDYsInVzZXJfbmFtZSI6IkFMREZBS0sxQjhaUjU2MzE1QzVEIiwianRpIjoiYWU4ZWQ0MTEtZTljYy00NGRjLThlYjUtODc4NTdjM2QzNmFlIiwiY2xpZW50X2lkIjoic3BlYWtlci5udWd1Lm51MTEwIiwic2NvcGUiOltdLCJleHQiOnsidXNyIjoiQUxERkFLSzFCOFpSNTYzMTVDNUQiLCJwb2MiOiJzcGVha2VyLm51Z3UubnUxMTAiLCJkdmMiOiJBTERGRzU1WU1ZUkE5RTUyN0VCRCIsInRrbiI6IjNDNzMxMzEwOUIyQTQ1RTZCQjhBRUQ2MjBGRjNBMThGIn19.DrmLXJXBF9YL7-R7gtEg5dOLQ7UfYMlPKGp1WHNfx8M",
  "token_type" : "Bearer",
  "refresh_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NzM2MTE4OTksInVzZXJfbmFtZSI6IkFMREZBS0sxQjhaUjU2MzE1QzVEIiwianRpIjoiNjAzYTkyNjUtNTJmNS00ZDE2LWEzOWYtMTVkMGZhM2IxMTgyIiwiY2xpZW50X2lkIjoic3BlYWtlci5udWd1Lm51MTEwIiwic2NvcGUiOltdLCJhdGkiOiJhZThlZDQxMS1lOWNjLTQ0ZGMtOGViNS04Nzg1N2MzZDM2YWUiLCJleHQiOnsidXNyIjoiQUxERkFLSzFCOFpSNTYzMTVDNUQiLCJkdmMiOiJBTERGRzU1WU1ZUkE5RTUyN0VCRCIsInBvYyI6InNwZWFrZXIubnVndS5udTExMCIsInRrbiI6IjNDNzMxMzEwOUIyQTQ1RTZCQjhBRUQ2MjBGRjNBMThGIn19.F29whyNRE6LN3c9yfNTH3F9uN3W04aP2Jxav3rSSFoY",
  "expires_in" : 2147483646,
  "jti" : "ae8ed411-e9cc-44dc-8eb5-87857c3d36ae"
}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=400 %}
{% api-method-response-example-description %}
invalid\_request - 잘못 된 요청입니다.  
invalid\_grant - 유효하지 않은 grant\_type 입니다.  
unsupported\_grant\_type - 지원하지 않는 grant\_type 입니다.  
invalid\_scope - 유효하지 않은 scope 입니다.  
redirect\_uri\_mismatch - 요청 한 redirect\_uri와 일치하지 않습니다.  
unsupported\_response\_type - 지원하지 않는 response\_type 입니다.
{% endapi-method-response-example-description %}

```text
HTTP/1.1 400 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8

{"error":"invalid_grant","error_description":"Invalid authorization code: 0rrbEjnOfqxIv6uNic6C"}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=401 %}
{% api-method-response-example-description %}
error.unauthorized - 인가되지 않은 사용자 정보 입니다.  
error.unauthorized\_client - 인가되지 않은 클라이언트 입니다.  
error.invalid\_token - 유효하지 않은 토큰 입니다.  
error.invalid\_client - 유효하지 않은 클라이언 정보 입니다.  
error.access\_denied - 접근이 거부 되었습니다.  
code.user\_account\_closed - 탈퇴한 사용자 입니다.  
code.user\_account\_paused - 휴면 상태 사용자 입니다.  
code.user\_device\_disconnected - 연결 해제된 상태입니다.  
code.user\_device\_unexpected - 내부 검증 토큰이 불일치 합니다.
{% endapi-method-response-example-description %}

```text
HTTP/1.1 401 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8
WWW-Authenticate: Form realm="NUGU", error="invalid_client", error_description="Bad client credentials"

{"error":"invalid_client","error_description":"Bad client credentials"}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

{% api-method method="post" host="https://api.host.domain" path="/v1/auth/oauth/token" %}
{% api-method-summary %}
토큰 갱신 요청 \(Token Endpoint\)
{% endapi-method-summary %}

{% api-method-description %}
\*임시회원으로만 연동 가능한 체험판 사용 시에는 불필요합니다.
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-form-data-parameters %}
{% api-method-parameter name="data" type="string" required=true %}
추가적인 데이터가 포함 됩니다. ex\) {"deviceSerialNumber":"DEVICE\_SEERIAL\_NUMBER"}
{% endapi-method-parameter %}

{% api-method-parameter name="grant\_type" type="string" required=true %}
refresh\_token \(갱신\)
{% endapi-method-parameter %}

{% api-method-parameter name="refresh\_token" type="string" required=true %}
신규 발급 시 응답 받은 refresh\_token을 사용합니다.
{% endapi-method-parameter %}

{% api-method-parameter name="client\_id" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="client\_secret" type="string" required=true %}

{% endapi-method-parameter %}
{% endapi-method-form-data-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 200 
Date: Mon, 14 Oct 2019 03:01:27 GMT
Content-Type: application/json;charset=UTF-8

{
  "access_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjM3MTg1MDU3MzQsInVzZXJfbmFtZSI6IkFMREZBS0sxQjhaUjU2MzE1QzVEIiwianRpIjoiNzcyNWVmNGYtNzc4Yy00NDUyLTk3ZWItODE0NWVmNWIyOTNkIiwiY2xpZW50X2lkIjoic3BlYWtlci5udWd1Lm51MTEwIiwic2NvcGUiOltdLCJleHQiOnsidXNyIjoiQUxERkFLSzFCOFpSNTYzMTVDNUQiLCJkdmMiOiJBTERGRzU1WU1ZUkE5RTUyN0VCRCIsInBvYyI6InNwZWFrZXIubnVndS5udTExMCIsInRrbiI6IjNDNzMxMzEwOUIyQTQ1RTZCQjhBRUQ2MjBGRjNBMThGIn19.pKy2WqIWtKCybQT8jGZsYUyvGg3ZdtQ4zzTSj7IeRYQ",
  "token_type" : "Bearer",
  "refresh_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NzM2MTE4OTksInVzZXJfbmFtZSI6IkFMREZBS0sxQjhaUjU2MzE1QzVEIiwianRpIjoiNjAzYTkyNjUtNTJmNS00ZDE2LWEzOWYtMTVkMGZhM2IxMTgyIiwiY2xpZW50X2lkIjoic3BlYWtlci5udWd1Lm51MTEwIiwic2NvcGUiOltdLCJhdGkiOiI3NzI1ZWY0Zi03NzhjLTQ0NTItOTdlYi04MTQ1ZWY1YjI5M2QiLCJleHQiOnsidXNyIjoiQUxERkFLSzFCOFpSNTYzMTVDNUQiLCJkdmMiOiJBTERGRzU1WU1ZUkE5RTUyN0VCRCIsInBvYyI6InNwZWFrZXIubnVndS5udTExMCIsInRrbiI6IjNDNzMxMzEwOUIyQTQ1RTZCQjhBRUQ2MjBGRjNBMThGIn19.AkXWHMuUlKYKs3wP92roaBWQaFmuW7e4kKmlhmrWDZc",
  "expires_in" : 2147483646,
  "jti" : "7725ef4f-778c-4452-97eb-8145ef5b293d"
}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=400 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 400 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8

{"error":"invalid_grant","error_description":""}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=401 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 401 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8
WWW-Authenticate: Form realm="NUGU", error="invalid_client", error_description="Bad client credentials"

{"error":"invalid_client","error_description":"Bad client credentials"}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

## Revoke Endpoint

{% api-method method="post" host="" path="/v1/auth/oauth/revoke" %}
{% api-method-summary %}
연결 해제 \(Revoke Endpoint\)
{% endapi-method-summary %}

{% api-method-description %}

{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-form-data-parameters %}
{% api-method-parameter name="data" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="token" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="client\_id" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="client\_secret" type="string" required=true %}

{% endapi-method-parameter %}
{% endapi-method-form-data-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 200 
Date: Mon, 14 Oct 2019 03:01:27 GMT
Content-Type: application/json;charset=UTF-8

{}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=400 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 400 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8

{"error":"invalid_token","error_description":""}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=401 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 401 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8

{"error":"invalid_client","error_description":""}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

## Introspect Endpoint

{% api-method method="post" host="" path="/v1/auth/oauth/introspect" %}
{% api-method-summary %}
연결 조회 \(Introspect Endpoint\)
{% endapi-method-summary %}

{% api-method-description %}

{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-form-data-parameters %}
{% api-method-parameter name="data" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="token" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="client\_id" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="client\_secret" type="string" required=true %}

{% endapi-method-parameter %}
{% endapi-method-form-data-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 200 
Date: Mon, 14 Oct 2019 03:01:27 GMT
Content-Type: application/json;charset=UTF-8

{
"active":true
}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=400 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 400 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8

{"error":"invalid_token","error_description":""}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=401 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```text
HTTP/1.1 401 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8

{"error":"invalid_client","error_description":""}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

