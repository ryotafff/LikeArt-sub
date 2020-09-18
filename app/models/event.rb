class Event < ApplicationRecord

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :post_comments

	attachment :image, destroy: false

	validates :title, presence: true
	validates :artist, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :place, presence: true
	validates :address, presence: true
	validates :price, presence: true
	validates :Introduction, presence: true, length: {maximum: 300}

	enum hold_status: { 開催予定: 0, 開催中: 1, 開催終了: 2, }

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

# likesテーブルの「いいねしたユーザー：user_id」カラムにuser.idが存在するのか探す処理
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end



end
