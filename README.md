


# Task App

```
___________              __        _____                 
\__    ___/____    _____|  | __   /  _  \ ______ ______  
  |    |  \__  \  /  ___/  |/ /  /  /_\  \\____ \\____ \
  |    |   / __ \_\___ \|    <  /    |    \  |_> >  |_> >
  |____|  (____  /____  >__|_ \ \____|__  /   __/|   __/
               \/     \/     \/         \/|__|   |__|    
```

![Screenshot of Task App UI](https://i.imgur.com/ygagaxI.png)

### Contents

- [Description](#Description)
- [Installation](#Installation)
- [Pull Request Process](#Pull-Request-Process)
- [Contributing](#Contributing)
- [License](#License)

## Description
  This is a to do list app that allows users to sign up with a unique username and email and then create tasks that are due.  The main page displays all the users tasks.  Tasks must have a title and you can optionally add a larger description if you want to elaborate on the task.  You also have the option of setting a due date and due time, the tasks will turn red when the due date or due time has passed.  Also you have the ability to set a priority level, the priority level will determine the order in which the tasks show up on the main '/tasks' page.  On the tasks listings page you can check the box if the task if completed as well as edit any task and of course delete any task.  There is a button to clear off all the completed tasks if you want to delete multiple at once.  Finally there is a button in the footer called `Edit Account` that gives users the ability to change their username, email or password.  

  **NOTE**
  There are validations on usernames and emails to so that you can only use usernames that have not been used before and you must enter a email.  Error messages should get displayed stating this is you try.

## Installation
  To install this app you need to have Ruby installed.  Just run `bundle install` to install all necessary gem files.  If you want you can set the program environment with a variable like this `SINATRA_ENV=test`, it defaults to development if none is set.  Next execute `rake db:migrate` to run all the migrations and set up the database.  Finally just start a local server, I was running it with gem `shotgun` so I was accessing the app at [http://localhost:9393/](http://localhost:9393/) but you could use `rackup` if you wanted to as well.

## Contributing

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change.

Please note we have a code of conduct, please follow it in all your interactions with the project.

###### Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a
   build.
2. Update the README.md with details of changes to the interface, this includes new environment
   variables, exposed ports, useful file locations and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this
   Pull Request would represent. The versioning scheme we use is [Git](https://git-scm.com/).
4. You may merge the Pull Request in once you have the sign-off of two other developers, or if you
   do not have permission to do that, you may request the second reviewer to merge it for you.


## License


  <img src="https://camo.githubusercontent.com/107590fac8cbd65071396bb4d04040f76cde5bde/687474703a2f2f696d672e736869656c64732e696f2f3a6c6963656e73652d6d69742d626c75652e7376673f7374796c653d666c61742d737175617265" alt="License" data-canonical-src="http://img.shields.io/:license-mit-blue.svg?style=flat-square" style="max-width:100%;">

  [MIT License](http://opensource.org/licenses/mit-license.php)
