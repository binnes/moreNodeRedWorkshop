# API Practical

In this section you will need to create an API that supports both GET and POST methods and also the client functionality to test the API.

The API will display time in a given location

## GET API

This method will return the time at the requested city.  Options will allow the caller to specify the format of the response and also if the output is in 12H or 24H format.

- Method : **GET**
- URL : **/time/at/*[city or server]*** where city will be one of London, Washington, Singapore or Sydney.  If server is specified then the time at the server location (local time) is provided.
- query parameters :
  - **format** will have the value **long** or **short**.  If it is not specified then short if the default behaviour
  - **time-format** will have the value **24H** or **12H**.  If it is not specified then 24H is the default behaviour

The API will use the Accept header to return either JSON (application/json) or plain text (text/plain).  Ensure the correct header is set for the format of the data returned to the client.  If no type is specified or an unsupported/invalid format is requested, say application/xml, then it should be ignored and JSON should be returned.

Assuming the time is 1:47PM, for short format the output should be:

- text : "13:47"
- json : { "time" : "13:47"}

for long format the output should be:

- text : "Time at [city or server] is 13:37"
- json: { "Location" : [city or server], "time" : "13:47" }

The value for 12H should be 1:47 PM and for 24H 13:47.

*The aim of this practical is to get the API implementation correct rather than the correct functionality of the API, so you don't need to worry about daylight savings time when calculating time differences between cities, just use the time differences that exist today.*

The status code should be set to reflect the output, 200 if everything worked OK.  Refer to the status codes to get an appropriate code if the city or server parameter is not set or is not a valid value.  If any of the query parameters contain invalid vales they should be ignored and the default value used.

## POST API

The post API should have exactly the same functionality, but this time there are no parameters or query parameters.  All input data is provided in a JSON body to the request.

{
  "location" : "[city or server]",
  "format" : "[long | short]",
  "time-format" : "[12H|24H]"
}

format and time-format properties are optional

The response should be the same as the GET API

## Testing the APIs

Create a number of flows to test both the GET and POST versions of your API, use ```http://localhost:1880``` as the server address to call local APIs.  You should test valid options and also invalid options to ensure your APIs meet the above specifications.
