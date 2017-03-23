# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  - This application has three model classes, User, Recipe, and Review.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
  - Users have many recipes, and recipes have many reviews.
- [x] Include user accounts
  - The user is able to create an account with a username and password.
- [x] Ensure that users can't modify content created by other users
  - As well as redirecting the user when they try to edit/delete content that isn't theirs, the edit and delete buttons are hidden from users who didn't create that content.
- [x] Include user input validations
  - There are validations on all three models in this app.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
  - Errors are displayed on all pages but the login page, which just re-renders itself when meeting an error. I honestly wasn't sure how to get the errors to appear on that page.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
