require 'rails_helper'

describe Phone do

  it 'does not allow duplicate phone numbers per contact' do
    contact = Contact.create(
      firstname: 'Joe',
      lastname: 'Tester',
      email: 'joetester@example.com'
    )
    contact.phones.create(
      phone_type: 'home',
      phone: '444-555-666'
    )

    mobile_phone = contact.phones.build(
      phone_type: 'mobile',
      phone: '444-555-666'
    )

    mobile_phone.valid?
    expect(mobile_phone.errors[:phone]).to include("has already been taken")
  end
end
