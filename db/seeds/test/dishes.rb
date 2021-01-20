dishes = ["唐揚げ", "メンチカツ", "白身フライ", "ちくわ天", "エビフライ", 
  "鯖塩焼き", "鮭塩焼き", "ハンバーグ", "焼肉", "生姜焼き" , "野菜炒め" , 
  "豆もやしナムル" , "ポテトサラダ" , "小松菜と油揚げの和え物" , "きんぴらごぼう", "ひじき煮" ]

kcals = ["84", "134", "179", "77", "77", "138", "113",
  "223", "252", "267", "143", "42", "69", "32", "35", "99"]

0.upto(15) do |idx|
  Dish.create(
    dish_name: dishes[idx],
    recommend: (idx < 2),
    introduction: "ああああああ",
    dish_kcal: kcals[idx],
    stock: "10"
  )
end

0.upto(15) do |idx|
  filename = "/obento/app/assets/images/dish/dish#{idx+1}.png"
  path = Rails.root.join(__dir__, filename)
  m = Dish.find_by!(id: idx+1)

  File.open(path) do |f|
    m.dish_picture.attach(io: f, filename: filename)
  end
end