#!/bin/bash

# book data
curl -v -X PUT http://localhost:8091/riak/favs/db \
-H "Content-Type: text/html" \
-d "<html><body><h1>My new favorite DB is RIAK</h1></body></html>"

# book data
curl -v -X PUT http://localhost:8091/riak/animals/ace \
-H "Content-Type: application/json" \
-d '{"nickname" : "The Wonder Dog", "breed" : "German Shepherd"}'

# book data
curl -v -X PUT http://localhost:8091/riak/animals/polly?returnbody=true \
-H "Content-Type: application/json" \
-d '{"nickname" : "Sweet Polly Purebred", "breed" : "Purebred"}'

# book data
curl -X PUT http://localhost:8091/riak/cages/1 \
-H "Content-Type: application/json" \
-H "Link: </riak/animals/polly>; riaktag=\"contains\"" \
-d '{"room" : 101}'

# book data
curl -X PUT http://localhost:8091/riak/cages/2 \
-H "Content-Type: application/json" \
-H "Link:</riak/animals/ace>;riaktag=\"contains\",
  </riak/cages/1>;riaktag=\"next_to\"" \
-d '{"room" : 101}'

# book data
curl -X PUT http://localhost:8091/riak/cages/1 \
-H "Content-Type: application/json" \
-H "X-Riak-Meta-Color: Pink" \
-H "Link: </riak/animals/polly>; riaktag=\"contains\"" \
-d '{"room" : 101}'

# book data
curl -X PUT http://localhost:8091/riak/photos/polly.jpg \
-H "Content-type: image/jpeg" \
-H "Link: </riak/animals/polly>; riaktag=\"photo\"" \
--data-binary @polly_image.jpg

# Homework Q1
curl -X PUT http://localhost:8091/riak/animals/polly?returnbody=true \
-H "Content-Type: application/json" \
-H "Link:</riak/photos/polly.jpg>; riaktag=\"photo\"" \
-d '{"nickname" : "Sweet Polly Purebred", "breed" : "Purebred"}'

# Homework Q2
curl -i -X POST http://localhost:8091/riak/pdfs/ \
-H "Content-Type: application/pdf" \
--data-binary @noidea.pdf

# Homework Q3
curl -X PUT http://localhost:8091/riak/medicines/antibiotics/ \
-H "Content-type: image/jpeg" \
-H "Link: </riak/animals/ace>;riaktag=\"sick\"" \
--data-binary @pill.jpg

