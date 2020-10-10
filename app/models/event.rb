class Event < ApplicationRecord

	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :post_comments

	attachment :image, destroy: false

	validates :title, presence: { message: "イベント名を入力してください" }
	validates :artist, presence: { message: "アーティスト名を入力してください" }
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :place, presence: { message: "開催場所を入力してください" }
	validates :address, presence: { message: "住所を入力してください" }
	validates :price, presence: { message: "料金を入力してください" }
	validates :Introduction, presence: { message: "イベント説明を入力してください" }, length: {maximum: 300, too_long: "イベント説明は最大%{count}文字以内で入力してください" }

	enum hold_status: { 開催予定: 0, 開催中: 1, 開催終了: 2, }

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

# likesテーブルの「いいねしたユーザー：user_id」カラムにuser.idが存在するのか探す処理
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end



end
