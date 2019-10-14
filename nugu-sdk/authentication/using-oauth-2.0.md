# Using OAuth 2.0

NUGU 플랫폼의 인증 규격은 [OAuth 2.0](https://tools.ietf.org/html/rfc6749) 입니다.

사용자 정보는 [T아이디](https://www.skt-id.co.kr)를 기반으로 합니다.

Token 교환을 위한 Client 인증은 Body Parameter\(application/x-www-form-urlencoded\)로 진행 됩니다.

Device Gateway는 고유한 Device 키를 포함해야 응답을 보장 받을 수 있습니다.

따라서 인증 요청시 아래 형으로 디바이스 고유 식별자\(Device Serial Number\)를 전달 할 수 있습니다.

```text
data=%7B%22deviceSerialNumber%22%3A%DEVICE_SERIAL_NUMBER%22%7D
```

{% api-method method="get" host="https://api.host.domain" path="/v1/auth/oauth/authorize" %}
{% api-method-summary %}
인증 요청 \(Authorize Endpoint\)
{% endapi-method-summary %}

{% api-method-description %}

{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-query-parameters %}
{% api-method-parameter name="client\_id" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="response\_type" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="redirect\_uri" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="scope" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="data" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="state" type="string" required=true %}

{% endapi-method-parameter %}
{% endapi-method-query-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=302 %}
{% api-method-response-example-description %}
 
{% endapi-method-response-example-description %}

```
HTTP/1.1 302 
Date: Mon, 14 Oct 2019 02:24:58 GMT
Location: {redirect_uri}?code=AY2V4chO87dfL8XLBy0p&state=
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

{% api-method method="post" host="https://api.host.domain" path="/v1/auth/oauth/token" %}
{% api-method-summary %}
토큰 요청 \(Token Endpoint\)
{% endapi-method-summary %}

{% api-method-description %}

{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-form-data-parameters %}
{% api-method-parameter name="grant\_type" type="string" required=true %}
authorization\_code
{% endapi-method-parameter %}

{% api-method-parameter name="code" type="string" required=true %}

{% endapi-method-parameter %}

{% api-method-parameter name="redirect\_uri" type="string" required=true %}

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

```
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
invalid\_request  
invalid\_grant  
unsupported\_grant\_type  
invalid\_scope  
redirect\_uri\_mismatch  
unsupported\_response\_type
{% endapi-method-response-example-description %}

```
HTTP/1.1 400 
Date: Mon, 14 Oct 2019 04:22:45 GMT
Content-Type: application/json;charset=UTF-8

{"error":"invalid_grant","error_description":"Invalid authorization code: 0rrbEjnOfqxIv6uNic6C"}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=401 %}
{% api-method-response-example-description %}
unauthorized  
unauthorized\_client  
invalid\_token  
invalid\_client  
access\_denied
{% endapi-method-response-example-description %}

```
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

{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-form-data-parameters %}
{% api-method-parameter name="grant\_type" type="string" required=true %}
refresh\_token
{% endapi-method-parameter %}

{% api-method-parameter name="refresh\_token" type="string" required=true %}

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

```
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
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

