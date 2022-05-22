warehouses = Warehouse.create([
  {name: 'Celadon Warehouse'},
  {name: 'Viridian Warehouse'}
])

items = Item.create([
  {
    name: 'Sunglasses',
    quantity: 200,
    warehouse_id: warehouses.first.id
  },
  {
    name: 'Shoes',
    quantity: 20,
    warehouse_id: warehouses.first.id
  },
  {
    name: 'Shirt',
    quantity: 150,
    warehouse_id: warehouses.last.id
  }
])