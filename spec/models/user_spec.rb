
require_relative '../spec_helper.rb'

describe 'User' do

  context 'should allow created user to be' do

    it 'valid if created with proper variables' do
      user = User.create(username: "tester", email: "tester@mail.com", password: "password", password_confirmation: "password" )
      expect(user).to be_valid
    end

    it 'invalid if created without a email' do
      user = User.create(username: "tester", password: "password", password_confirmation: "password" )
      expect(user).to be_invalid
    end

    it 'invalid if created without a password' do
      user = User.create(username: "tester", email: "tester@mail.com")
      expect(user).to be_invalid
    end

    it 'invalid if created without a password confirmation' do
      user = User.create(username: "tester", email: "tester@mail.com", password: 'password')
      expect(user).to be_invalid
    end

    it 'invalid if created without a username' do
      user = User.create(email: "tester@mail.com", password: "password", password_confirmation: "password" )
      expect(user).to be_invalid
    end

  end

  context 'allows task manipulation through the user class' do

    user = User.create(username: "tester", email: "tester@mail.com", password: "password", password_confirmation: "password" )

    it 'can sort all tasks according to their priority' do
      user.tasks << Task.create(title: "Create task routes", description: "Make sure all task routes are setup and working", priority: 'High')
      user.tasks << Task.create(title: "Make spec tests for tasks", description: "Create spec tests that check if task routes are working correctly", priority: 'Medium')
      user.tasks << Task.create(title: "DRY out CSS files and compress", description: "CSS files are a mess, there are some custom classes that are not used or redundant", priority: 'Low')
      user.tasks << Task.create(title: "Create user routes", description: "Create the routes for managing users and sessions", priority: 'High')
      user.tasks << Task.create(title: "Add theme customiztion", description: "Allow users to set different colors for the background and fonts etc..", priority: 'Medium')

      tasks = user.sort_tasks_by_priority

      expect(tasks.last.title).to eq('DRY out CSS files and compress')
    end

    it 'can sort all tasks by due time' do

      user.tasks << Task.create(title: "Create task routes", description: "Make sure all task routes are setup and working", priority: 'High', due_time: Time.now + 60*60)
      user.tasks << Task.create(title: "Make spec tests for tasks", description: "Create spec tests that check if task routes are working correctly", priority: 'High', due_time: Time.now)
      user.tasks << Task.create(title: "DRY out CSS files and compress", description: "CSS files are a mess, there are some custom classes that are not used or redundant", priority: 'High', due_time: Time.now + 10*60)

      tasks = user.sort_tasks_by_priority
      expect(tasks.first.title).to eq('Make spec tests for tasks')
    end
  end

end
