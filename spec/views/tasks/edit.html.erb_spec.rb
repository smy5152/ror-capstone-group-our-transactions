require 'rails_helper'

RSpec.describe 'tasks/edit', type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
                            name: 'MyString',
                            amount: 1
                          ))
  end

  it 'renders the edit task form' do
    render

    assert_select 'form[action=?][method=?]', task_path(@task), 'post' do
      assert_select 'input[name=?]', 'task[name]'

      assert_select 'input[name=?]', 'task[amount]'
    end
  end
end
