# rest_api

The rest_api simulates a simple Rest API exposing basic operations over `Element` entity
________________________________________________________________________________

## Elements

#### Get all

Get all elements from 'database'
```
curl GET 'http://<HOST>/v1/rest_api/elements/'
```
##### Responses

* 200 OK

```
[
  {
    "id": "default-e1",
    "name": "Element 1",
    "description": "Lorem ipsum dolor sit amet",
    "date": "2020-09-07T13:22:15.52Z",
    "success": true,
    "amount": 5
  },
  {
    "id": "default-e2",
    "name": "Element 2",
    "description": "Ut enim ad minim veniam",
    "date": "2020-09-07T13:22:15.52Z",
    "success": false,
    "amount": 0
  },
  {
    "id": "default-e3",
    "name": "Element 3",
    "description": "Excepteur sint occaecat cupidatat non proident,",
    "date": "2020-09-07T13:22:15.52Z",
    "success": true,
    "amount": 15
  }
]
```

###### Error Codes:

* 500 Internal Server Error

#### Get one

Get one element from 'database' by id
```
curl GET 'http://<HOST>/v1/rest_api/elements/{id}'
```

##### Responses

* 200 OK

```
{
  "id": "default-e1",
  "name": "Element 1",
  "description": "Lorem ipsum dolor sit amet",
  "date": "2020-09-07T13:22:15.52Z",
  "success": true,
  "amount": 5
}
```

###### Error Codes:

* 404 Not Found
* 500 Internal Server Error

#### Create

Add a new element to 'database'
```
curl POST 'http://<HOST>/v1/rest_api/elements/' \
--header 'Content-Type: application/json' \
--data-raw '{
      "name": "new element",
      "description": "description",
      "success": true,
      "amount": 5
    }
}'
```

##### Responses

* 201 Created

```
HTTP/1.1 201
Location: /v1/rest_api/elements/{generated_id}
```

###### Error Codes:

* 500 Internal Server Error

#### Delete

Delete element from 'database'
```
curl DELETE 'http://<HOST>/v1/rest_api/elements/{id}'
```

##### Responses

* 204 No Content

###### Error Codes:

* 404 Not Found
* 500 Internal Server Error
