name = ["kugou", "nishio", "iioka", "hirokawa"]
0.upto(3) do |idx|
  Admin.create(
    name: "#{name[idx]}",
    password: "murasaki",
    password_confirmation: "murasaki"
  )
end