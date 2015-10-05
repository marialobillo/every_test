require 'rails_helper'

describe Contact do

  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it 'is invalid without a firstname' do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include "can't be blank"
  end

  it 'is invalid without a lastname' do
    contact = build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it 'is invalid without a email address' do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    create(:contact,
      email: 'tester@example.com'
    )
    contact = build(:contact,
      email: 'tester@example.com'
    )
    contact.valid?
    expect(contact.errors[:email]).to include "has already been taken"
  end

  it 'returns a contacts full name as a string' do
    contact = build(:contact, firstname: 'Jane', lastname: 'Doe')
    expect(contact.name).to eq 'Jane Doe'
  end


  describe "filter last name by letter" do
    before :each do
      @smith = create(:contact,
        firstname: 'John',
        lastname: 'Smith',
        email: 'jsmith@exmaple.com'
      )
      @jones = create(:contact,
        firstname: 'Tim',
        lastname: 'Jones',
        email: 'tjones@example.com'
      )
      @johnson = create(:contact,
        firstname: 'John',
        lastname: 'Johnson',
        email: 'jjohnson@example.com'
      )
    end

    context "with matching letters" do
      it 'return a sorted array of results that match' do
        expect(Contact.by_letter("J")).to eq [@johnson, @jones]
      end
    end

    context "non-matching letters" do
      it 'omits result that do not match' do
        expect(Contact.by_letter("J")).not_to include @smith
      end
    end
  end

end
