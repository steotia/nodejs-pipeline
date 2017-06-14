var request = require('supertest');

var app = require('../app.js');

describe('A unit test', function(){
    it("to test exclamation", function(done){
        request(app)
            .get("/")
            .expect(200, "Hello World!")
            .end(function (err) {
                if(err) {
                    return done(err);
                }
                return done();
            })
    })
});