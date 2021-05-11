# require 'capybara/rspec'

RSpec.describe 'Sign in', type: :system do
  before :each do
    User.create(name: 'Rockstar')
  end

  it 'Sign In: Registered User, Valid username message' do
    visit '/login'

    within('#new_session') do
      fill_in 'Name', with: 'Rockstar'
    end

    sleep(3)
    click_button 'Sign In'

    sleep(3)
    expect(page).to have_content('You logged in succesfully as Rockstar')
  end

  it 'Sign In: Unregistered User, Invalid Username message' do
    visit '/login'

    within('#new_session') do
      fill_in 'Name', with: 'Notregistered'
    end

    sleep(3)
    click_button 'Sign In'

    sleep(3)
    expect(page).to have_content('Please Sign In or create a New User')
  end

  describe 'ADD: New Task page' do
    it 'Error: Authentication Warning' do
      visit new_task_path
      sleep(3)

      expect(page).to have_content('You need to Sign In or register as a New User to continue')
    end
  end
end
