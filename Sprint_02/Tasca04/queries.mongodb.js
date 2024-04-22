use ('exercici1_Restaurant');
db.Restaurant.find();
db.Restaurant.find({},{restaurant_id:1, name:1, borough:1,cuisine:1});
db.Restaurant.find({},{restaurant_id:1, name:1, borough:1,cuisine:1,_id:0});
db.Restaurant.find({},{restaurant_id:1, name:1, borough:1,cuisine:1,_id:0, "address.zipcode":1});
db.Restaurant.find({borough:'Bronx'});
db.Restaurant.find({borough: 'Bronx'}).limit(5);
db.Restaurant.find({borough: 'Bronx'}).skip(5).limit(5);
db.Restaurant.find({"grades.score":{$gt:90}});
db.Restaurant.find({grades:{$elemMatch: {"score":{$gt:80, $lt:100}}}});

