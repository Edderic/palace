require 'spec_helper'

describe 'visit home' do
  subject { page }

  before { visit root_path }

  it { expect(page).to have_content 'palace' }   
  it { expect(page).to have_content 'login' }   
  it { expect(page).to have_content 'about' }   
  it { expect(page).to have_content 'Start' }

  context 'click_on start', :js do
    before { click_on 'Start' }
    it { expect(page).not_to have_content 'Start' }
    it { expect(page).to have_css '.player_one.last.face_down' }
    it { expect(page).to have_css '.player_one.last.face_up' }
    it { expect(page).to have_css '.player_one.hand.face_up_for_player_one.face_down_for_player_two' }

    it { expect(page).to have_css '.used.face_up' }
    it { expect(page).to have_css '.new.face_down' }

    it { expect(page).to have_css '.player_two.last.face_down' }
    it { expect(page).to have_css '.player_two.last.face_up' }
    it { expect(page).to have_css '.player_two.hand.face_up_for_player_two.face_down_for_player_one' }
    
    it { expect(page).to have_css '.player_two.face_up' }
    it { expect(page).to have_css '.player_two.face_up' }
  end  
end