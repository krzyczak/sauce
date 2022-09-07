context('Actions', () => {
  beforeEach(() => {
    cy.visit('http://localhost:8080')
  })
  it('.type() - type into a DOM element', () => {
    // https://on.cypress.io/type
    cy.get('.action-email')
        .type('fake@email.com').should('have.value', 'fake@email.com')
  })
})
