require 'spec_helper'

describe Store do
  describe 'Validations' do
    it{ should validate_presence_of :name }


  end

  describe 'Associatiosn' do
    it{ should have_many :addresses }
  end
end
