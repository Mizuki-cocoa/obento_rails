0.upto(5) do |idx|
  Box.create(
    box_num: idx+1,
    box_name: "#{idx+1}個入り弁当",
    box_price: 100*(idx+6),
  )
end