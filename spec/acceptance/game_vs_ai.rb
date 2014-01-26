require 'spec_helper'

describe 'visit home' do
  subject { page }

  before { visit root_path }

  it { expect(page).to have_content 'palace' }   
end 