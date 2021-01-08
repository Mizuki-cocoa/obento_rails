0.upto(5) do |idx|
  Bento.create(
    id: idx,
    box_id: idx,
    sum_kcal: 0,
    num: 0,
  )
end