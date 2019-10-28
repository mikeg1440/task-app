

# Todo-App

Task ROUTES

GET       '/'                   index
GET       '/tasks'              tasks/index
GET       '/tasks/new'          tasks/new
GET       '/tasks/:id'          tasks/show
GET       '/tasks/:id/edit'     tasks/edit
PATCH     '/tasks/:id'          {update}
DELETE    '/tasks/:id'          {delete}


User ROUTES

GET       '/login'              users/login
GET       '/signup'             users/signup
GET       '/logout'             users/logout
POST      '/login'              {login user}
POST      '/signup'             {create user}

*1. create tasks routes
*2. make sure tasks routes are working
3. create users ROUTES
4. test users routes
5. link users and tasks
6. add asthetics
