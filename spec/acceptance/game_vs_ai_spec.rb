require 'spec_helper'

describe 'visit home' do
  subject { page }

  before { visit root_path }

  it { expect(page).to have_content 'palace' }   
  it { expect(page).to have_content 'login' }   
  it { expect(page).to have_content 'about' }   
  it { expect(page).to have_content 'Start' }

  context 'click_on start' do
    before { clicK_on 'Start' }
    it { expect(page).not_to have_content 'Start' }
  end  
end 