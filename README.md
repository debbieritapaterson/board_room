# The Board Room
Welcome to The Board Room: A place for extreme sports enthusiasts to store their treasured gear and chat to others about theirs.

Create an account and upload your favorite gear here: 
https://board-room.herokuapp.com/

##Features:
 - Signup/Login (displays current user)
 - View all user's gear
 - Upload your gear to build your virtual board room
 - Comment on other user's gear 
 - Responsive Mobile/Web Design


## Technologies Used:
Ruby
HTML/CSS
Postgres SQL

##Approach taken

Backend:SQL database stores user details, gear details and comments. Server side program was built in Ruby to connect the user display to the database.
Front End: HTML/CSS used to display user information, gear and comments as well as enable the user to manage (edit/delete their content).

The app was built with a extreme sports enthusiast in mind - the core feature being the ability to build and manage a virtual board room. Embedded ruby files display the majority of the information to the user with the help of HTML components and CSS styling (including the use of media queries for responsiveness). 

Three SQL tables (users, gear_items and comments store the basic information in the postgres database) and employ the help of Sinatra web server gem to serve this information to the app. 

##Upcoming Features and Fixes:

Fixes:
- Enable default comment deletion status (to be false) in postgres table so that author is displayed on new comments.
- Optimization of nav bar for viewing on mobile screens.

Features: 
- Wishlist: bookmark other users gear by adding them to your wishlist.
- Integration with shop API to display purchase information and link to stores. 
- Allow users to upload a gallery of photos of their gear in use.



