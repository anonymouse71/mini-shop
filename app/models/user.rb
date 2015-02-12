class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  ####<$ Model Association $>####
  has_one :customer
  has_many :orders

  ####<$ Validation $>####
  validates_presence_of :first_name, :last_name, :email, :encrypted_password
  #validates_presence_of :email, :encrypted_password
  after_create :add_role_for_user


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        create_from_omniauth_facebook(auth)
      end
    end
  end

  def self.create_from_omniauth_facebook(auth)
    user                          = self.new
    user.first_name               = auth['info']['first_name']
    user.last_name                = auth['info']['last_name']
    user.profile_picture_provider = auth['info']['image']
    user.provider                 = auth['provider']
    user.uid                      = auth['uid']
    user.email                    = auth['info']['email']
    user.password                 = Devise.friendly_token[0,20]

    if auth['extra']['raw_info']['gender'] == 'male' || auth['extra']['raw_info']['gender'] == 'female'
      user.gender                 = auth['extra']['raw_info']['gender']
    end

    user.save(validate: true)
    user
  end

  private

  def add_role_for_user
    RolesUsers.create!(role_id: Role::USER_ROLE[:user], user_id: self.id)
  end
end