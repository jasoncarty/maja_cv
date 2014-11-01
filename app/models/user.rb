class User < ActiveRecord::Base
  has_secure_password(validations: false)

  attr_writer :validate_password
  attr_writer :password_change
  attr_accessor :current_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }, if: :validate_password?
  validates :password, confirmation: true, if: :validate_password?
  validates_presence_of :current_password, on: :update, if: :password_change?
  validates :confirmation_token, uniqueness: true, allow_blank: true
  validates :reset_password_token, uniqueness: true, allow_blank: true
  validates :remember_me_token, uniqueness: true, allow_blank: true

  after_validation :log_errors, :if => Proc.new {|m| m.errors}

  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n")
  end

  def self.find_by_login(params)
    errors = ''
    user   = User.find_by_email(params[:email])
    if user
      errors = "This account has not yet been confirmed" unless user.confirmed?
      unless user.authenticate(params[:password])
        errors = "Invalid password"
      end
    else
      errors = "Invalid email address"
    end
    [user, errors]
  end

  def confirmed?
    if !self.confirmed_at.blank? && self.confirmed_at < Time.now
      true
    else
      false
    end
  end

  def validate_password?
    return true if @validate_password.nil?
    @validate_password
  end

  def authenticate_passwords(params)
    result = false
    if self.authenticate(params[:user][:current_password])
      result = true
    else 
      errors[:current_password] << 'Your need to enter your current password in order to change your password'
    end
    result
  end

  def password_change?
    return false if @password_change.nil?
    @password_change
  end
end
