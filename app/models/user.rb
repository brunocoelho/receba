class User < ActiveRecord::Base
  has_many :transfers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  after_create :set_username

  def to_param
    self.username
  end

  %w(square small normal large).each do |method_name|
    define_method("#{method_name}_avatar_url") do
      "https://graph.facebook.com/#{self.uid}/picture?type=#{method_name}"
    end
  end

  class << self
    def find_for_facebook_oauth(auth, signed_in_resource=nil)
      user = User.where(provider: auth.provider, uid: auth.uid).first


      puts "tearjerker"
      puts auth.inspect

      unless user
        user = User.create(name: auth.extra.raw_info.name, provider: auth.provider,
                           uid: auth.uid, email: auth.info.email, username: auth.info.nickname,
                           location: auth.info.location, password: Devise.friendly_token[0,20])
      end

      user
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
          user.email = data['email'] if user.email.blank?
        end
      end
    end
  end

private
  def set_username
    self.username = self.name.gsub(' ', '-').downcase if self.username.blank?
    self.username = self.username.gsub('.', '-')
    self.save
  end
end