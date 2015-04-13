class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :wikis
  has_many :collaborations
  has_many :collaboration_wikis, through: :collaborations, :source => :wiki
  
  after_initialize :set_default_role
  
  def set_default_role
    self.role ||= 'standard'
  end
  
  def upgrade_to_premium
    self.update_attribute(:role, "premium")
  end
  
  def admin?
    role == 'admin'
  end
  
  def standard?
    role == 'standard'
  end
  
  def premium?
    role == 'premium'
  end
  
end
