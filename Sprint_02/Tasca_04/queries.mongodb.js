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
db.Restaurant.find({"address.coord.1":{$lt:-95.754168}});
db.Restaurant.find({$and : [{cuisine:{$nin:['American', 'American ']}},{"grades.score":{$gt:70}},{"address.coord.0":{$lt:-65.754168}}]});
db.Restaurant.find({cuisine:{$nin:['American', 'American ']}},{"grades.score":{$gt:70}},{"address.coord.0":{$lt:-65.754168}});
db.Restaurant.find({cuisine:{$nin:['American', 'American ']},"grades.grade":"A","borough":"Brooklyn"}).sort({cuisine:-1});
db.Restaurant.find({name:{$regex : "^Wil"}},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0});
db.Restaurant.find({name:{$regex : "ces$"}},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0});
db.Restaurant.find({name:{$regex : "Reg"}},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0});
db.Restaurant.find({borough:"Bronx","cuisine":{$in:["American","Chinese", "American "]}});
db.Restaurant.find({borough:{$in:["Staten Island", "Queens", "Bronx","Brooklyn"]}},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0});
db.Restaurant.find({borough:{$nin:["Staten Island", "Queens", "Bronx","Brooklyn"]}},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0});
db.Restaurant.find({"grades.score":{$lt:10}},{restaurant_id:1, name:1, borough:1, cuisine:1, _id:0, "grades.score":1});
db.Restaurant.find({ $or: [ { $and: [ { name: { $regex: "Fish" } }, { cuisine: { $nin: ["American", "Chinese"] } } ] }, { name: { $regex: "^Wil" } } ] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 });
db.Restaurant.find({grades:{$elemMatch: {"grade": "A","score": 11,"date": ISODate("2014-08-11T00:00:00Z")}}},{ restaurant_id: 1, name: 1, grades:1});
db.Restaurant.find({"grades.1.grade": "A","grades.1.score": 9,"grades.1.date": ISODate("2014-08-11T00:00:00Z")},{ restaurant_id: 1, name: 1, grades:1});
db.Restaurant.find({"address.coord.1":{$gt:42, $lt:52}},{restaurant_id:1,name:1,address:1,borough:1});
db.Restaurant.find({},{name:1, _id:0}).sort({$strcasecmp:["$name","ASC"]});
//db.Restaurant.find({},{name:1, _id:0});


