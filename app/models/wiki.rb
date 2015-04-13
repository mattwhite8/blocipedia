class Wiki < ActiveRecord::Base
  belongs_to :user
  
  has_many :collaborations
  has_many :collaboration_users, through: :collaborations, :source => :user 
  
  
  scope :visible_to, -> (user) { user.role == 'admin' || user.role == 'premium' ? all : where(private: false) }
  
 
  def public?
    private == false  
  end
  
  
end
