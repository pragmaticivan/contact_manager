require 'spec_helper'

describe ContactManager do
  it 'has a version number' do
    expect(ContactManager::VERSION).not_to be nil
  end

  it 'finds a contact by email' do
    row =  ContactManager.find_by_email('contacts.csv','LisaESauceda@armyspy.com')
    expect(row).to eq('Last: Sauceda, First: Lisa, Phone: 3076999741, E-Mail: LisaESauceda@armyspy.com')
  end

  it 'finds a contact by letter' do
    row = ContactManager.find_by_letter('contacts.csv','g')
    expect(row).to match_array(['Last: Ghent, First: Amy, Phone: 7324301260, E-Mail: AmyJGhent@dayrep.com'])
  end
  it 'finds multiple contacts by letter' do
    row =  ContactManager.find_by_letter('contacts.csv','s')
    expect(row).to contain_exactly('Last: Sauceda, First: Lisa, Phone: 3076999741, E-Mail: LisaESauceda@armyspy.com',
                                   'Last: Sauceda, First: Lisa, Phone: 3076999741, E-Mail: LisaESauceda@armyspy.com',
                                   'Last: Shryock, First: William, Phone: 7704585414, E-Mail: WilliamLShryock@rhyta.com')
  end
end
