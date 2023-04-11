# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * `2.7.4`

* Rails version
  * `6.0.0`
 
* Running instructions
  * `rake db:setup`
  * `rails s`


* API endpoints
  * `GET localhost:3000/courses`

  * `POST localhost:3000/courses`
    ```
      {
        "name": "course1",
        "description": "course description",
        "tutors_attributes": [
          {
            "name": "tutor 1"
          },
          {
            "name": "tutor 2"
          }
        ]
      }
     ```
     
  * `PUT localhost:3000/courses`
      ```
      {
        "id": 1
        "name": "course1",
        "description": "course description",
      }
      ```
      
  * Running tests
    * `bin/rake`
