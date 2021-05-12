RSpec.describe Group, type: :model do
  let(:name) { 'username' }
  let(:user) { User.create(name: 'pingpong', email: 'ping@pong.com') }
  let(:user2) { User.create(name: 'rspecer', email: 'rock@star.com') }
  let(:task1) { Task.new(name: 'myTask1', amount: 8, author_id: user.id, group_id: group.id) }
  let(:task2) { Task.new(name: 'myTask2', amount: 4) }
  let(:group) { Group.create(name: 'Group1', user_id: user.id) }
  let(:group2) { Group.create(user_id: user.id) }

  describe 'New Group created and validated' do
    it 'User can create a group' do
      group = user.groups.new(name: 'mygroup', user_id: user.id)
      group.save

      expect(group).to be_valid
    end

    it 'Group validates absence of name' do
      expect(group2).to_not be_valid
    end
  end
end
