describe('my web server', () => {
  it('works fine', () => {
    cy.visit('http://localhost:8080/')
    cy.contains('Index of /')
  })
})