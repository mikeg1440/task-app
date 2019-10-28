user1 = User.create(username: "admin", email: "admin@mail.com", password: "root")

user1.tasks << Task.create(title: "Create task routes", description: "Make sure all task routes are setup and working")

user1.tasks << Task.create(title: "Make spec tests for tasks", description: "Create spec tests that check if task routes are working correctly")

user1.tasks << Task.create(title: "Create user routes", description: "Create the routes for managing users and sessions")
