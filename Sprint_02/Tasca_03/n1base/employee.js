db.createCollection('employee', {validator: {$jsonSchema: {bsonType: 'object',title: 'employee',required: ['name','lastname','worker_id'],properties:{name:{bsonType: 'string'},lastname:{bsonType: 'string'},worker_id:{bsonType: 'string'}}}}});