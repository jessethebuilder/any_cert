class Certificate < ActiveRecord::Base
  belongs_to :user
  belongs_to :giver, :class_name => 'User'

  validates :service_count, :numericality => {:greater_than_or_equal_to => 0, :allow_nil => true}

  validate :amount_or_service, :service_count_if_service
  validate :created_with_a_higher_amount_than_store_minimum, :on => :create

  private
    def amount_or_service
      errors.add(:amount, 'please specify a dollar amount and/or select a Service') if amount.nil? && service_id.nil?
      errors.add(:service_id, 'please specify a dollar amount and/or select a Service') if amount.nil? && service_id.nil?
    end

    def service_count_if_service
      errors.add(:service_count, 'Please specify a number of Services') if service_id && service_count.nil?
    end

    def created_with_a_higher_amount_than_store_minimum
      errors.add(:amount, "must be more than the minimum of $#{Store.first.minimum_amount}") unless amount.nil? || amount >= Store.first.minimum_amount
    end
  public
end
