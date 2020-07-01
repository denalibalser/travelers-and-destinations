Specs:

[x] Use Sinatra to build the app - Application Controller inherits from Sinatra::Base
[x] Use ActiveRecord for storing information in a database  - My models inherit from ActiveRecord::Base
[x] Include more than one model class (e.g. User, Post, Category) - Have Users and Destinations models
[x] Include at least one has_many relationship on your User model (e.g. User  has_many Posts) - Users have_many Destinations
[x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Desintations belong_to Users
[x] Include user accounts with unique login attribute (username or email) - in User model, included a validations for uniqueness of 'username' attribute 
[x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying -  the Destinations Controller includes CRUD routes 
[x] Ensure that users can't modify content created by other users - used the  authenticate and authorize helper methods 
[x] Include user input validations - user input validations included in User model
 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
[x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - completed the readme with specified requirements
Confirm

[x] You have a large number of small Git commits
[x] Your commit messages are meaningful
[x] You made the changes in a commit that relate to the commit message
[x] You don't include changes in a commit that aren't related to the commit message