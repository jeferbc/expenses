# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.find_or_create_by(name: "Restaurantes")

Category.find_or_create_by(name: "Tienda")

Category.find_or_create_by(name: "Car")

Category.find_or_create_by(name: "Servicios")

Category.find_or_create_by(name: "Hogar")

Category.find_or_create_by(name: "Educación")

Category.find_or_create_by(name: "Diversión")

Category.find_or_create_by(name: "Viaje")

Purchase.find_or_create_by(name_purchases: "Compra")

Purchase.find_or_create_by(name_purchases: "Retiro")

Purchase.find_or_create_by(name_purchases: "Transferencia")

Purchase.find_or_create_by(name_purchases: "Pago")
