RSpec.describe User, type: :model do

  let(:name) { 'username' }
  let(:user) { User.create(name: 'pingpong', email: 'ping@pong.com') }
  let(:user2) { User.create(name: 'rspecer', email: 'rock@star.com') }
  let(:user_no_name) { User.create(email: 'nouser@name.com') }
  let(:user_no_email) { User.create(name: 'superme') }
  let(:task1) { Task.new(name: 'myTask1', amount: 8) }
  let(:task2) { Task.new(name: 'myTask2', amount: 4) }
  let(:group) { Group.create(name: 'Group1', user_id: user.id) }

  describe 'Users can be created' do
    it 'New User validates Presence of name' do
      user_no_name.save

      expect(user_no_name).to_not be_valid
    end

    it 'New User ignored absence of email' do
      user_no_email.save

      expect(user_no_email).to be_valid
    end

    it 'A user can create one Task' do
      task = Task.new(name: 'Tasker', amount: 1)
      task.author_id = user.id
      task.save

      expect(task).to be_valid
    end

    it 'A user can author many Tasks' do
      task1.author_id = user.id
      task1.save
      task2.author_id = user.id
      task2.save

      expect(Task.first.author_id).to eq(user.id)
      expect(Task.second.author_id).to eq(user.id)
    end

    it 'User can create a group' do
      group = user.groups.new(name: 'mygroup')
      group.save

      expect(group).to be_valid
    end
  end
end
