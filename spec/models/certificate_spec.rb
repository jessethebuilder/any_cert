require 'spec_helper'

describe Certificate do
  let(:cert){ create :certificate }
  specify 'factory' do
    cert.should be_valid
  end

  describe 'Validations' do
    it 'should validate that an #amount OR a Service are specified' do
      cert.amount, cert.service_id = nil
      expect{ error.save! }.to raise_error('Please specify a dollar amount or select a Service')
    end

    it 'should validate that IF a Service is specified, a #procedure_count is ALSO specified' do
      cert.service = create(:service)
      cert.service_count = nil
      expect{ cert.save! }.to raise_error('Please specify a number of Services')
    end

  end

  describe 'Associations' do
    it{ should belong_to :procedure }
    it{ should belong_to :user }
  end
end
