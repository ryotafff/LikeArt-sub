class Artwork < ApplicationRecord

  acts_as_taggable
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :image, destroy: false

  validates :title, presence: { message: "作品名を入力してください" }
  validates :artist_name, presence: { message: "アーティスト名を入力してください" }
  validates :Introduction, presence: { message: "作品説明を入力してください" }, length: {maximum: 300, too_long: "作品説明は最大%{count}文字以内で入力してください" }
  validates :tag_list, presence: { message: "タグを入力してください" }
  validates :image, presence: { message: "作品画像を入力してください" }

 # likesテーブルの「いいねしたユーザー：user_id」カラムにuser.idが存在するのか探す処理
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
