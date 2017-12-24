require 'rails_helper.rb'

feature 'Creating posts - ' do
  before do
    user = create :user
    sign_in_with user
  end

  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/coffee.jpg")
    fill_in 'post[caption]', with: 'nom nom nom #Coffeetime'
    click_button 'Create Post'
    # Have to visit profile to see own image!
    #click_button 'Profile'
    visit '/YEAHMAN'
    expect(page).to have_content('#Coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
    expect(page).to have_content('YEAHMA')
  end

  scenario 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'post[caption]', with: 'nom nom nom #Coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('can\'t be blank')
  end

end
