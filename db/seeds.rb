# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Course.destroy_all
Course.create( name: 'CMPT276: Introduction to Software Engineering' )

User.create([
	{ username: 'TestAdmin', password: 'TestAdmin', last_name: 'Admin', first_name: 'Test',
		email: 'testadmin@test.ca', role: 'admin' },
	{ username: 'TestUser', password: 'TestUser', last_name: 'User', first_name: 'Test',
		email: 'testuser@test.ca', role: 'user' }])

Topic.create([{description: 'tutor', title: 'Anyone able to help?' },
	{description: 'general', title: 'How was the test?'}])
