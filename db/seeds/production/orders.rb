0.upto(10) do |idx|
  Order.create(
    id: idx+1,
    customer_id: idx+1,
    reserve_date: "2021/01/04",
    deliver_date: "2021/01/04",
    deliver_address: "住所",
  )
end