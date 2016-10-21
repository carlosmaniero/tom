describe('UserService', function() {
    var $httpBackend, $cookies, UserService, user_id;

    // Set the module
    beforeEach(module('trendOMeterApp'));

    // Add globals for any test
    beforeEach(inject(function($injector) {
        user_id = Math.ceil(Math.random() * 100);

        $httpBackend = $injector.get('$httpBackend');
        $cookies = $injector.get('$cookies');
        UserService = $injector.get('UserService');
    }));

    it('should create an anonymous user when starting the quiz', function(done){
        // Create a response for /users
        $httpBackend.when('POST', '/users', {anonym: true}).respond(201, {
            id: user_id,
            anonym: true
        });

        user = UserService.createAnonymous().then(function(response){
            // Check if request is done
            expect(response.status).toEqual(201);
            expect(response.data.id).toEqual(user_id);
            expect(response.data.anonym).toEqual(true);

            // Check if user_if cookies are created
            expect($cookies.get('user_id')).toEqual(user_id);
        }).finally(done);

        $httpBackend.flush();
    });

    it('should check if an user is logged', function(done){
        expect(UserService.getLogged()).toBeUndefined()
        // Create a cookie to simulate a logged user
        $cookies.set('user_id', user_id);
        expect(UserService.getLogged()).toEqual(user_id);
    });
});
