Address.create!([
  {city: "Dnipro", street: nil},
  {city: "Kyiv", street: nil}
])
CreditCard.create!([
  {name: nil, addr_id: 2}
])
Order.create!([
  {name: "First", bill_addr_id: 1, ship_addr_id: 2}
])
User.create!([
  {name: "Alex", addr_id: 1}
])
