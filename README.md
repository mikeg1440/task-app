
# Task App

```
___________              __        _____                 
\__    ___/____    _____|  | __   /  _  \ ______ ______  
  |    |  \__  \  /  ___/  |/ /  /  /_\  \\____ \\____ \
  |    |   / __ \_\___ \|    <  /    |    \  |_> >  |_> >
  |____|  (____  /____  >__|_ \ \____|__  /   __/|   __/
               \/     \/     \/         \/|__|   |__|    
```

## Description
  This is a to do list app that allows users to sign up with a unique username and email and then create tasks that are due.  The main page displays all the users tasks.  Tasks must have a title and you can optionally add a larger description if you want to elaborate on the task.  You also have the option of setting a due date and due time, the tasks will turn red when the due date or due time has passed.  Also you have the ability to set a priority level, the priority level will determine the order in which the tasks show up on the main '/tasks' page.  On the tasks listings page you can check the box if the task if completed as well as edit any task and of course delete any task.  There is a button to clear off all the completed tasks if you want to delete multiple at once.  Finally there is a button in the footer called `Edit Account` that gives users the ability to change their username, email or password.  

  **NOTE**
  There are validations on usernames and emails to so that you can only use usernames that have not been used before and you must enter a email.  Error messages should get displayed stating this is you try.


## Installation
  To install this app you need to have Ruby installed.  Just run `bundle install` to install all necessary gem files.  If you want you can set the program environment with a variable like this `SINATRA_ENV=test`, it defaults to development if none is set.  Next execute `rake db:migrate` to run all the migrations and set up the database.  I ran the it with `shotgun` but you could use `rack` if you wanted to.
