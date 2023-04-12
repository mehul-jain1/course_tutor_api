# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * `2.7.4`

* Rails version
  * `7.0.4`
 
* Running instructions
  * `rake db:setup`
  * `rails s`


* API endpoints
  * `GET localhost:3000/courses`
   * example response:
   ```
     [
         {
             "id": 1,
             "name": "Sheldon Volkman",
             "description": "Quo ipsa reprehenderit. _Temporibus_ quam voluptas. Officia aut est.",
             "created_at": "2023-04-11T17:02:50.604Z",
             "updated_at": "2023-04-11T17:02:50.604Z",
             "tutors": [
                 {
                     "id": 1,
                     "name": "Kieth Wunsch",
                     "course_id": 1,
                     "created_at": "2023-04-11T17:02:50.615Z",
                     "updated_at": "2023-04-11T17:02:50.615Z"
                 },
                 {
                     "id": 2,
                     "name": "Tim Bergnaum",
                     "course_id": 1,
                     "created_at": "2023-04-11T17:02:50.618Z",
                     "updated_at": "2023-04-11T17:02:50.618Z"
                 }
             ]
         },
         {
             "id": 2,
             "name": "course1",
             "description": "course description",
             "created_at": "2023-04-11T17:04:59.855Z",
             "updated_at": "2023-04-11T17:04:59.855Z",
             "tutors": [
                 {
                     "id": 3,
                     "name": "tutor 1",
                     "course_id": 2,
                     "created_at": "2023-04-11T17:04:59.858Z",
                     "updated_at": "2023-04-11T17:04:59.858Z"
                 },
                 {
                     "id": 4,
                     "name": "tutor 2",
                     "course_id": 2,
                     "created_at": "2023-04-11T17:04:59.860Z",
                     "updated_at": "2023-04-11T17:04:59.860Z"
                 }
             ]
         }
     ]
   ```

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
