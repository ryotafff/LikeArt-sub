# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.all.empty?
Admin.create!(
  id: 1,
  email: 'test@user',
  password: 'testtest',
  password_confirmation: 'testtest'
  )
end

if User.all.empty?
User.create!(
 [
  {
  id: 1,
  email: '1@1',
  name: '一郎',
  password: '111111',
  password_confirmation: '111111',
  },
  {
  id: 2,
  email: '2@2',
  name: 'Taro',
  password: '111111',
  password_confirmation: '111111',
  },
  {
  id: 3,
  email: '3@3',
  name: 'Ryo',
  password: '111111',
  password_confirmation: '111111',
  },
  {
  id: 4,
  email: '4@4',
  name: 'Hana',
  password: '111111',
  password_confirmation: '111111',
  },
 ]
 )
end

Artwork.create!(
  [
  {
  id: 2,
  user_id: 1,
  title:'愛は空中に Love is in the Air',
  artist_name: 'Banksy',
  Introduction: '火炎瓶の代わりに花束が描かれたこの絵は、バンクシーの作品の中でもっとも有名な絵の一つで、暴力やテロに対するアンチテーゼ、平和への祈りのメッセージが感じ取れる作品です。',
  tag_list: '現代アート,グラフィティアート',
  image: open("./db/images/artwork1.jpg")
  },
  {
  id: 3,
  user_id: 2,
  title:'真珠の耳飾りの少女',
  artist_name: 'ヨハネス・フェルメール',
  Introduction: 'オランダで最も美しい絵画として知られている作品です!キャンバスに油彩で描かれてます。',
  tag_list: '西洋美術,オランダ',
  image: open("./db/images/artwork2.jpg")
  },
  {
  id: 4,
  user_id: 3,
  title:'南瓜',
  artist_name: '草間彌生',
  Introduction: '草間彌生の作品の中でも、最も有名で人気あるモチーフであるかぼちゃを描いた作品です。かぼちゃの中のドットの描き方が繊細で素晴らしいです',
  tag_list: '現代アート,日本',
  image: open("./db/images/artwork3.jpg")
  },
  {
  id: 5,
  user_id: 4,
  title:'ラディアント・ベイビー',
  artist_name: 'キース・ヘリング',
  Introduction: '鮮やかな色彩、動きのある造形は生命と結束の強いメッセージ性を表現した作品です！',
  tag_list: '現代アート,ニューヨーク',
  image: open("./db/images/artwork4.jpg")
  },
  ]
 )




