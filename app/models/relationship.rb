class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  has_many :activities, as: :action
  after_create :create_relationship_activity 


  private
  def create_relationship_activity 
  	activities.create(user_id: follower.id)
  end

end
