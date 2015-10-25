# Rails Mini-Project: Putting it all together

## Overview

### This week, we talked about

* rails
* database schema design (use the online schema designer)
* authentication
* authorization
* git workflow
* This afternoon, use these new skills to add the following features to a new Rails application. TDD is not dead.

# Project Option 1: IdeaBox

###Let's create an app to record your ideas.

### Categories

ideas belong to a category
categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create or destroy categories)
users can create, edit/update, show, and destroy only their own ideas
when a user types a new idea into the form, there is a selection dropdown for choosing the correct category
Images

allow users to add images to their ideas
an image can have many ideas and an idea can have many images
images can only be created by an admin user
The most simplistic way to implement images is to store a url to an online image. If you're feeling fancy and want to upload your own images, check out Carrierwave or Paperclip.

### Authentication and Authorization

* users need to log in to see their ideas
* users can only see their own ideas -- they should not be able to visit another user's page
* users cannot create ideas for other users
* users cannot create new categories -- only the admin can do that
* users cannot create images -- only the admin can do that; however, a user can assign an image to their idea
* Optional Extensions

Use Heroku to host your app
Implement OAuth login

Use Heroku to host your app
Implement Twitter or Github OAuth login
Homework

Fork or clone the repository so that you and your original pair each have a separate copy. Finish implementing the features individually using TDD. Add the link to your personal repository to this document.

Resources

Nested Routes
Carrierwave
Paperclip
Form Helpers in Rails
