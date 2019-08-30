# MakersBnB specification
## We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.


## MVP

### Users should be able to name their space, provide a short description of the space, and a price per night

As a owner  
So that I can let people see what my space is like  
I want to be able to name my space

As a owner  
So that I can let people see what my space is like  
I want to be able to post a description

As a owner  
So that I can let people see how much it costs  
I want to be able to list the price per night

As a potential tenant  
So that I can rent space  
I want to be able to view a list of spaces


### User Stories

As a User  
So that I can use the site  
I want to be able to sign up

As a user  
So that I can rent my property  
I want to be able to list my property 

As a potential tenant  
So that I can plan my holidays  
I want to see what dates spaces are available  

As a owner  
So that I can change the detail  
I can update my space details.  

As a owner 
So that I can delete my spaces
I want to be able to delete a space

As a owner
So that I can update my space
I want to be able to edit a space


### Database setup

Make sure you're in the MakersBnB directory. Then type in:

```bash
# Create the databases
createdb makersbnb
createdb makersbnb_test

# Run a script to create tables
ruby db/create_tables.rb
```








