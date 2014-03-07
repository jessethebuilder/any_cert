s = Store.new :name => Faker::Company.name, :minimum_amount => Random.rand(1..1000), :phone => '360-670-9312', :email => 'jessethebuilder@yahoo.com',
              :facebook_id => STORE_OPTS[:facebook_id], :facebook_secret => STORE_OPTS[:facebook_secret], :facebook_app_name => STORE_OPTS[:facebook_app_name]
s.save!

4.times do
  ser = Service.new :name => Faker::Commerce.product_name, :active => true, :cost_per_service => Random.rand(1.0..100.0)
  ser.save!
end