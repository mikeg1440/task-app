user1 = User.create(username: "admin", email: "admin@mail.com", password: "admin", password_confirmation: "admin")

user1.tasks << Task.create(title: "Create task routes", description: "Make sure all task routes are setup and working")

user1.tasks << Task.create(title: "Make spec tests for tasks", description: "Create spec tests that check if task routes are working correctly")

user1.tasks << Task.create(title: "Create user routes", description: "Create the routes for managing users and sessions")

user1.tasks << Task.create(title: "DRY out CSS files and compress", description: "CSS files are a mess, there are some custom classes that are not used or redundant")

user1.tasks << Task.create(title: "Add theme customiztion", description: "Allow users to set different colors for the background and fonts etc..")
