# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'admin@lifesoft.com', password: '123456789', password_confirmation: '123456789')

#puts 'SETTING UP DEFAULT ROLES'
#role = Role.create!(:name => 'super_admin')
#puts 'New role created: ' << role.name
#role = Role.create!(:name => 'user')
#puts 'New role created: ' << role.name

# super_role = Role.create!(name: Role::USER_ROLE[:super_admin])
# Role.create!(name: Role::USER_ROLE[:user])


RolesUsers.create(role_id: super_role.id, user_id: user.id)
