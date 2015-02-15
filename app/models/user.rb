class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:linkedin]

  has_many :ideas

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email-address
	    user.password = Devise.friendly_token[0,20]
	    user.first_name = auth.info.first-name   # assuming the user model has a name
	    user.last_name = auth.info.last-name # assuming the user model has an image
	    user.headline = auth.info.headline
	    user.location = auth.info.location
	    user.profile_pic = auth.info.public-profile-url
	    user.save!
	  end
	end

	def self.new_with_session(params, session)
	    super.tap do |user|
	      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
	    end
	  end
end
