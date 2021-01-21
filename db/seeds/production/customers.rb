# names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
# fnames = ["佐藤", "鈴木", "高橋", "田中"]
# gnames = ["太郎", "次郎", "花子"]

# 0.upto(9) do |idx|
#   Customer.create(
#     id: idx+1,
#     full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
#     user_name: names[idx],
#     address: "〇〇都〇〇区＊-△-☓",
#     tel_num: "080-0000-1111",
#     password: "obento!",
#     password_confirmation: "obento!"
#   )
# end