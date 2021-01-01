class Post < ApplicationRecord
  validates :content, {presence: true}
  validates :user_id, {presence: true}
  has_many :comments, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end
  
end
