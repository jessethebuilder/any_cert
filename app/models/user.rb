class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates :uid, :uniqueness => true, :allow_nil => true, :allow_blank => true
  validates :name, :presence => true

  validate :tos_accepted, :on => :create
  private
  def tos_accepted
    errors.add :tos_confirmation, 'you must accept our Terms of Service Agreement' unless tos_confirmation
  end
  public

  def User.parse_omniauth(omniauth_hash, user = nil)
    user ||= find_omniauth_authorized_user_or_build(omniauth_hash)
    user.password = random_password if user.new_record?
    user.parse_from_omniauth(omniauth_hash)
  end

  def parse_from_omniauth(omniauth_hash)
    self.provider = omniauth_hash.provider
    self.uid = omniauth_hash.uid
    self.name = omniauth_hash.info.name
    self.email = omniauth_hash.info.email if read_attribute(:email).blank?
    self.facebook_image = omniauth_hash.info.image
    self.oauth_token = omniauth_hash.credentials.token
    self.oauth_expires_at = Time.at(omniauth_hash.credentials.expires_at)
    self
  end

  private

  def User.find_omniauth_authorized_user_or_build(omniauth_hash)
    user = where(omniauth_hash.slice(:provider, :uid)).first
    user ||= where(:email => omniauth_hash.info.email).first
    user ||= User.new
    user
  end

  def User.random_password
    (0...20).map{ (65 + Random.rand(26)).chr }.join
  end

  #def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  #  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #  if user
  #    return user
  #  else
  #    registered_user = User.where(:email => auth.info.email).first
  #    if registered_user
  #      return registered_user
  #    else
  #      user = User.create(name:auth.extra.raw_info.name,
  #                         provider:auth.provider,
  #                         uid:auth.uid,
  #                         email:auth.info.email,
  #                         password:Devise.friendly_token[0,20])
  #    end
  #  end
  #end
  #
  #def apply_omniauth(auth)
  #  self.email = auth['extra']['raw_info']['email']
  #  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['extension']['token'])
  #end
end
