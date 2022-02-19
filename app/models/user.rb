class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: [:inactive, :admin, :inspector, :guard, :janitor, :doctor, :nurse, :office, :technic], _prefix: true

  after_initialize :set_default_role, :if => :new_record?

  validates :name, presence: true
  validates :surname, presence: true
  
  has_many :inspections
  has_many :cleaning_requests

  def set_default_role
    self.role ||= :inactive
  end
end