sub_dishes = ["ドリンク", "豚汁", "ミニうどん", "コーンスープ","杏仁豆腐"]
kcals = ["42", "121", "136", "85", "60"]
prices = ["100", "150", "200", "120", "120"]

sub_intro = [
  "緑茶のホットorコールドを選ぶことができます。",
  "肉や野菜を炒めているため、旨みが凝縮されています。",
  "少しお腹が空いている方におすすめです。",
  "小さなお子様から幅広い年代の方に人気のあるスープです。",
  "ぷるぷる食感が癖になる一品です。"
]

0.upto(4) do |idx|
  SubDish.create(
    sub_dish_name: sub_dishes[idx],
    sub_dish_price: prices[idx],
    recommend: (idx < 2),
    introduction: sub_intro[idx],
    sub_kcal: kcals[idx],
    stock: "10"
  )
end