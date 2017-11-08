describe('The Home Page', function() {
    beforeEach(function(){
        // reset and seed the database prior to every test
        cy.exec('env DB_PREFIX=cypress bin/rails db:schema:load');
    });

    it('clicking on blog', function() {
        cy.visit('/')
        cy.get('.button')
            .contains('Blog')
            .click()
    })
    it('making new blogpost', function () {
        cy
            .visit('http://admin:admin@localhost:3000/articles/new')
            .visit('localhost:3000/articles')
            .get('.button')
            .contains('New blogpost sooqa')
            .click()
            .get('textarea')
            .type('Trying cypress in action')
            .get('trix-editor')
            .type('Will it create a record in database?')
            .get('.button')
            .contains('Create Article')
            .click()



    })

})