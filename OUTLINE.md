


# Outline

#### Task ROUTES

```
GET       '/'                   index
GET       '/tasks'              tasks/index
GET       '/tasks/new'          tasks/new
GET       '/tasks/:id'          tasks/show
GET       '/tasks/:id/edit'     tasks/edit
PATCH     '/tasks/:id'          {update}
DELETE    '/tasks/:id'          {delete}
```

#### User ROUTES

```
GET       '/login'              users/login
GET       '/signup'             users/signup
GET       '/logout'             users/logout
POST      '/login'              {login user}
POST      '/signup'             {create user}
```

- [x] create tasks routes
- [x] make sure tasks routes are working
- [x] create users ROUTES
- [x] test users routes
- [x] link users and tasks
- [ ] add aesthetics
