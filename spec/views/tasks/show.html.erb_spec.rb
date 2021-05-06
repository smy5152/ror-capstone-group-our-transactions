require 'rails_helper'

RSpec.describe 'tasks/show', type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
                            name: 'Name',
                            amount: 2
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
