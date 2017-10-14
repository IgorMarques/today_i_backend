# Daily App

This app is is a backend to a to do list intended to help people who have daily meetings.

You can create and toggle tasks that you are working or plan to work on soon.

## Intro

This app has two major components: 
- A [frontend app](https://github.com/IgorMarques/today_i) in pure HTML/CSS/Javascript
- A backend app Ruby on Rails (this project)

This repo is from the backend-end only. Check the frontend app [here](https://github.com/IgorMarques/today_i)

## Running

Assuming you already have a Ruby on Rails 5 env set up, do the following:

Install dependencies
```shell
$ bundle install
```
Create database
```shell
$ rails db:create db:migrate
```
Run the app
```
$ rails s
```

## API documentation

`GET itens`

Response:
```javascript
{
  "data": {
    "todays_itens": [
      {
        "id": 7,
        "description": "I'll work on this today",
        "done": false
      }
    ],
    "yesterdays_itens": [
      {
        "id": 4,
        "description": "Item I completed yesterday",
        "done": true
      },
    ],
    "todays_complete_itens": [
      {
        "id": 8,
        "description": "Item I completed today",
        "done": true
      },
      {
        "id": 10,
        "description": "Another Item I completed today",
        "done": true
      }
    ]
  }
}
```

`POST itens/create`

Params:
```javascript
{
  description: 'A new item description'
}
```

Response:
```javascript
{
  "data": {
      {
        "id": 11,
        "description": "A new item description",
        "done": false
      }
  }
}
```

`POST itens/:id/toggle`

Response:
```javascript
{
  "data": {
      {
        "id": 12,
        "description": "An item that was marked as complete",
        "done": true
      }
  }
}
```

