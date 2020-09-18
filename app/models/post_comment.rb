class PostComment < ApplicationRecord

belongs_to :user
belongs_to :event , optional: true
belongs_to :artwork, optional: true

validates :comment, presence: true

end
