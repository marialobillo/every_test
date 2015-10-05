require 'rails_helper'

describe Contact do

  it "has a valid factory" do
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  it 'is invalid without a firstname' do
    contact = FactoryGirl.build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include "can't be blank"
  end

  it 'is invalid without a lastname' do
    contact = FactoryGirl.build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it 'is invalid without a email address' do
    contact = FactoryGirl.build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    Contact.create(
      firstname: 'Maria', lastname: 'Tester',
      email: 'tester@example.com'
    )
    contact = Contact.new(
      firstname: 'Jane', lastname: 'Tester',
      email: 'tester@example.com'
    )
    contact.valid?
    expect(contact.errors[:email]).to include "has already been taken"
  end

  it 'returns a contacts full name as a string' do
    contact = FactoryGirl.build(:contact, firstname: 'Jane', lastname: 'Doe')
    expect(contact.name).to eq 'Jane Doe'
  end


  describe "filter last name by letter" do
    before :each do
      @smith = Contact.create(
        firstname: 'John',
        lastname: 'Smith',
        email: 'jsmith@exmaple.com'
      )
      @jones = Contact.create(
        firstname: 'Tim',
        lastname: 'Jones',
        email: 'tjones@example.com'
      )
      @johnson = Contact.create(
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
