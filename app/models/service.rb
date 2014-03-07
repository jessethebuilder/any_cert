class Service < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

  def Service.active
    where(:active => true)
  end

end
