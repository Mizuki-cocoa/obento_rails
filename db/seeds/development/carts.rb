0.upto(10) do |idx|
  Cart.create(
    id: idx+1,
    customer_id: idx+1,
    sum_price: 0,
    all_kcal: 0
  )
end