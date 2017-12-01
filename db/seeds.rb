# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Course.destroy_all
Course.create([
	{term: 'Spring 2018', name: 'CMPT276: Introduction to Software Engineering'},
	{term: 'Spring 2018', name: 'CMPT307: Algorithm Design'}
])

# Remember it also has to pass the validators as well or it secretly fails
User.create([
	{username: 'Admin', password: '12345678A', last_name: 'Al', first_name: 'Admin',
	 email: 'admin@test.ca', role:'admin', tutor: true},
	{username: 'User1', password: '12345678A', last_name: 'James', first_name: 'Franco',
	 email: 'JFranco@test.ca', role:'user', tutor: true},
	{username: 'User2', password: 'A12345678', last_name: 'Jean', first_name: 'Billy',
	 email: 'Jimmy@test.ca', role: 'user', tutor: true},
	{username: 'Admin2', password: 'A12345678', last_name: 'Cucumber', first_name: 'James',
	 email: 'CuJames@test.ca', role: 'admin', tutor: true}
])


Topic.create([
	{description: 'tutor', title: 'Anyone able to help?', user_id: 2 , course_id: 1,
	 first_post: "Please?", pinned: false},
	{description: 'general', title: 'How was the exam', user_id: 4 , course_id: 2,
	 first_post: "Well?", pinned: false},
	{description: 'general', title: 'How was the exam', user_id: 1 , course_id: 2,
	 first_post: "Well?", pinned: false},
	{description: 'studygroup', title: 'How was the exam', user_id: 3 , course_id: 1,
	 first_post: "I did terrible. :(", pinned: false}
])


Review.create([
	{comment: "They are okay I guess...He gets kind of frustrated easily..", person_rating_id: 2, person_rated_id: 1},
	{comment: "Literally the best tutor ever!!", person_rating_id: 3, person_rated_id: 1},
	{comment: "I am never going to ask this person for help again..E-V-E-R!!", person_rating_id: 1, person_rated_id: 2},
	{comment: "User2 is an amazing tutor! I got an A+ after he tutored me!", person_rating_id: 3, person_rated_id: 2}
])