require 'spec_helper'

describe 'visit home', :js do
  subject { page }

  before { visit root_path }

  it 'should have the right nav bar content' do
    expect(page).to have_content 'palace'    
    expect(page).to have_content 'login'    
    expect(page).to have_content 'about'    
    expect(page).to have_content 'Start'
  end

  context 'click_on start', :js do
    before { click_on 'Start' }

    it 'should have the right decks and amount of cards' do
      expect(page).not_to have_content 'Start'

      should_have_player_decktype_count(1, '.last.face_down', 3)
      should_have_player_decktype_count(1, '.last.face_up', 3)
      should_have_player_decktype_count(1, '.hand', 3)
      should_have_player_decktype_count(2, '.last.face_down', 3)
      should_have_player_decktype_count(2, '.last.face_up', 3)
      should_have_player_decktype_count(2, '.hand', 3)

      should_have_decktype_count('.new.face_down', 34)
      should_have_decktype_count('.used.face_up', 0)
    end
  end  
end

def should_have_decktype_count(type, count)
  expect(page.all("#neutral #{type}.deck .card").count).to eq count
end

def should_have_player_decktype_count(index, type, count)
  expect(page.all("#player_#{index} #{type}.deck .card").count).to eq count
end

