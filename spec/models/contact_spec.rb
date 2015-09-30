require 'rails_helper'

describe Contact do
  it 'is valid with a firstname, lastname and email'
  it 'is invalid without a firstname'
  it 'is invalid without a lastname'
  it 'is invalid without a email address'
  it 'is invalid with a duplicate email address'
  it 'return a contacts full name as a string'
end
