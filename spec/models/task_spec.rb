
require_relative '../spec_helper.rb'

describe 'Task' do

  user = User.create(username: "tester", email: "tester@mail.com", password: "password", password_confirmation: "password" )

  it 'should be invalid without a title' do
    task = user.tasks.build(description: 'Take out trash before dinner', due_time: Time.now + 60*60)
    user.save
    expect(task).to be_invalid
  end

  it 'should be valid with a title' do
    task = user.tasks.build(title: 'Empty trash')
    user.save
    expect(task).to be_valid
  end

  it 'should be valid with a description' do
    task = user.tasks.build(title: 'Empty trash', description: 'Take out trash before dinner')
    user.save
    expect(task).to be_valid
  end

  it 'should be valid with a due time' do
    task = user.tasks.build(title: 'Empty trash', description: 'Take out trash before dinner', due_time: Time.now + 60*60)
    user.save
    expect(task).to be_valid
  end


end
