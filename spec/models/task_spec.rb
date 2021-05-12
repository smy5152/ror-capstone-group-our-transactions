RSpec.describe Task, type: :model do
  let(:user) { User.create(name: 'pingpong', email: 'ping@pong.com') }
  let(:group) { Group.create(name: 'Group1', user_id: user.id) }
  let(:task1) { Task.new(name: 'myTask1', amount: 8, group_id: group.id) }
  let(:task_no_name) { Task.new(amount: 8) }
  let(:task_no_amount) { Task.new(name: 'Task1') }

  describe 'Tasks can be created and validated' do
    it 'A user can create a Task' do
      task1.author_id = user.id
      task1.save

      expect(task1).to be_valid
    end

    it 'Task validates absence of name' do
      expect(task_no_name).to_not be_valid
    end

    it 'Task validates presence of transaction (duration)' do
      expect(task_no_amount).to_not be_valid
    end
  end
end
