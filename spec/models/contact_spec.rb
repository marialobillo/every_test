require 'rails_helper'

describe Contact do
  it 'is valid with a firstname, lastname and email' do
    contact = Contact.new(
      firstname: 'Maria',
      lastname: 'Lobillo',
      email: 'tester@example.com'
    )
    expect(contact).to be_valid
  end

  it 'is invalid without a firstname' do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end
  it 'is invalid without a lastname'
  it 'is invalid without a email address'
  it 'is invalid with a duplicate email address'
  it 'return a contacts full name as a string'
end
