0.upto(5) do |idx|
  Bento.create(
    id: idx+1,
    box_id: idx+1,
    sum_kcal: 0,
    num: 0,
  )
end