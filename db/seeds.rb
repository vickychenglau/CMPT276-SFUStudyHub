# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Course.destroy_all
Course.create([ {name: 'CMPT276: Introduction to Software Engineering'},
									{name: 'CMPT307: Algorithm Design'},
									{name: 'CMPT225: Algorithms and Database analysis'}] )

User.create([
	{ username: 'TestAdmin', password: 'TestAdmin', last_name: 'Admin', first_name: 'Test',
		email: 'testadmin@test.ca', role: 'admin' },
	{ username: 'TestUser', password: 'TestUser', last_name: 'User', first_name: 'Test',
		email: 'testuser@test.ca', role: 'user' }])
# Remember it also has to pass the validators as well or it secretly fails
User.create([{username: 'Admin', password: '12345678', last_name: 'Al', first_name: 'Admin',
	email: 'admin@test.ca', role:'admin'},
	{username: 'User1', password: '12345678', last_name: 'James', first_name: 'Franco',
		email: 'JFranco@test.ca', role:'user'},
		{username: 'User2', password: 'a12345678', last_name: 'Jean', first_name: 'Billy',
			email: 'Jimmy@test.ca', role: 'user'},
			{username: 'Admin2', password: 'a12345678', last_name: 'Cucumber', first_name: 'James',
				email: 'CuJames@test.ca', role: 'admin'}])

Topic.create([
	{description: 'tutor', title: 'Anyone able to help?', user_id: 2 , course_id: 1, first_post: "Please?"},
	{description: 'general', title: 'How was the exam', user_id: 4 , course_id: 2, first_post: "Well?"},
	{description: 'general', title: 'How was the exam', user_id: 1 , course_id: 2, first_post: "Well?"},
	{description: 'studygroup', title: 'How was the exam', user_id: 3 , course_id: 1, first_post: "I did terrible. :("}
	])
