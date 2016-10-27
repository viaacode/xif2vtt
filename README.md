# xif2vtt
Microservice that converts a XIF subtitle to VTT format

## General
This serice listens to a RabbitMQ queue and will transform and publish the XIF posted as 'data' to the WebVTT format along with the correlation id originally sent with the request.

## Usage
Publish a message with the following format on the request queue:
```
{
	"correlationid": "correlationid0",
	"data": "&lt;XIF version=&quot;1.0&quot;&gt;&lt;/XIF&gt;"
}
```

The response will be posted on the response queue using the following format:
```
{
  "response": {
    "correlationId": "correlationid0",
    "status": "OK",
    "data": "WEBVTT\n\n1\n00:00:00.220 --> 00:00:05.170\nSample subtitle text."
  }
}
```
