# README

How to run the app:
1. run: `bundle install`
2. change mysql connect credentials: config/database.yml
3. run create db command: `rails db:create`
4. run migrate: `rails db:migrate`
4. run seeds: `rails db:seed`
5. import pisano-survey.postman_collection.json into Postman to check the endpoints, you have to change the auth token for user

## Docker setup
- docker-compose build
- docker-compose up
- docker exec -it pisano-survey_web_1 bundle exec rake db:create
- docker exec -it pisano-survey_web_1 bundle exec rake db:migrate
- docker exec -it pisano-survey_web_1 bundle exec rake db:seed