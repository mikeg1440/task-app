
# Create 5 new user with the same password of 'password'
5.times do
  name = Faker::Name.first_name
  User.create(username: name, email: "#{name}@mail.com", password: "password", password_confirmation: "password" )
end

user1 = User.first
user1.tasks << Task.create(title: "Create task routes", description: "Make sure all task routes are setup and working", priority: 'High')
user1.tasks << Task.create(title: "Make spec tests for tasks", description: "Create spec tests that check if task routes are working correctly", priority: 'Medium')
user1.tasks << Task.create(title: "Create user routes", description: "Create the routes for managing users and sessions", priority: 'High')
user1.tasks << Task.create(title: "DRY out CSS files and compress", description: "CSS files are a mess, there are some custom classes that are not used or redundant", priority: 'Low')
user1.tasks << Task.create(title: "Add theme customiztion", description: "Allow users to set different colors for the background and fonts etc..", priority: 'Medium')

# Add a task to find where a random quote came from for all 5 users
User.all.each do |user|
  user.tasks.build(title: "Find where this quote came from", description: Faker::Movie.quote)
end

# Add task to read a book
User.all.each do |user|
  user.tasks.build(title: "Read this book", description: "Read this book called #{Faker::Book.title}")
end

# Add task to research a author
User.all.each do |user|
  user.tasks.build(title: "Research this author", description: "Find all the information you can on the author #{Faker::Book.author}")
end
