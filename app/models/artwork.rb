class Artwork < ApplicationRecord

  acts_as_taggable
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :image, destroy: false

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :Introduction, presence: true, length: {maximum: 300, too_long: "作品説明は最大%{count}文字以内で入力してください" }
  validates :tag_list, presence: true
  validates :image, presence: true

 # likesテーブルの「いいねしたユーザー：user_id」カラムにuser.idが存在するのか探す処理
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
