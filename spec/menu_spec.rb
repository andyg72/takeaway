require 'menu'

describe Menu do 

let(:menu){Menu.new}

  it 'should load the menu' do
    expect(menu.menu_list.length).to be > 0
  end
  
end