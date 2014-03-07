require 'spec_helper'

describe User do
  describe 'Validations' do
    it{ should validate_presence_of :email }
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :password }
  end

  describe 'Associations' do
    it{ should have_many :certs }
  end


end
