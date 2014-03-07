class Store < ActiveRecord::Base
  has_many :addresses, :as => :has_address

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates :minimum_amount, :presence => true, :numericality => {:greater_than => 0, :only_integer => true}

  validate :only_1_store_exists, :on => :create
  private
  def only_1_store_exists
    errors.add 'Only 1 store can be created' if Store.count > 0
  end
  public

end
