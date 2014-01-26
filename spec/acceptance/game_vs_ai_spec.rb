require 'spec_helper'

describe 'visit home' do
  subject { page }

  before { visit root_path }

  it { expect(page).to have_content 'palace' }   
  it { expect(page).to have_content 'signin' }   
  it { expect(page).to have_content 'about' }   
end 