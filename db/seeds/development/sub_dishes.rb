sub_dishes = ["ドリンク", "豚汁", "ミニうどん", "コーンスープ","杏仁豆腐"]
kcals = ["42", "121", "136", "85", "60"]
prices = ["100", "150", "200", "120", "120"]

0.upto(4) do |idx|
  SubDish.create(
    sub_dish_name: sub_dishes[idx],
    sub_dish_price: prices[idx],
    recommend: (idx < 2),
    introduction: "ああああああ",
    sub_kcal: kcals[idx],
    stock: "10"
  )
end