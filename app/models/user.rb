class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password
  
  has_many :feeds

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  # attr_accessible :username, :email, :password, :password_confirmation

  def self.authenticate(username_or_email="", login_password="")
    if  EMAIL_REGEX.match(username_or_email)    
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
    
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
  
  def clear_password
    self.password = nil
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
