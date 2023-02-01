class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  #this gives you custom message for the error
  validates :email, :uniqueness => { :message => "El correo ya esta registrado." }
  
  #an even better way
  def email=(email)
    super(email.downcase.strip)
  end
end
