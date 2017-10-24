# SFU Study Hub
CMPT 276 Group Project
Group 2

Heroku link: https://sfu-study-hub.herokuapp.com/
Heroku git link: https://git.heroku.com/sfu-study-hub.git

# Project Proposal:

## Abstract
The SFU Study Hub will be a centralized web application that connects students with tutors and their fellow classmates in order to help them succeed in their studies. The app will include student and tutor profiles (along with related functions such as tutor search and session scheduling), class-specific discussion boards for tutors to advertise their services and students to find tutors and/or study groups, as well as ways to facilitate connections such as private messaging and suggested study groups. This web application also seeks to make it easier on the users, by reminding them of tutoring or study sessions they signed up for.

## How is this problem solved currently?
Currently, the features of our proposed website are not available in a centralized place that specifically targets the SFU community. Most tutors currently advertise their services either using flyers posted around campus or by posting on different websites like Craigslist or HelpHub. However, since these sites cover such a wide range of subjects and populations, it’s difficult to attract a sufficiently large group of potential tutors and tutees at SFU to make it a “go-to” site when a student here is looking to find tutors or tutees for a specific class. While talkSFU caters to the SFU population, tutors who use this site to advertise are limited to posting on a discussion board rather than having more detailed profiles such as on HelpHub or italki (an online language learning site).

SFU class-specific discussion boards do not exist in a centralized place either. Students who want to ask questions about a course, either before enrolling in it or while the course is in progress, may post in a variety of places such as talkSFU, the SFU subreddit, or a course discussion page (e.g. Canvas). However, not all classes have an online discussion board or Canvas site, and on sites like talkSFU or reddit, class-specific posts can quickly get buried. In contrast, our app will have a dedicated page for each class for people to post all of their questions.

Another website that is similar to having a class discussion board is Piazza which connects students to their professors and TA’s. Discussions boards may only be created by the professors. With SFU Study Hub, there will be discussion boards for each class that do not require instructor to create. This will make it easier for students to connect to other students in their class, or tutors that would be willing to help.

## How will this project make life easier?
The SFU Study Hub will connect students to their classmates and provides a platform for them to actively engage in discussion about any course related content via discussion boards. It will help students form potential study groups and match up with tutors if they wish to seek extra help in a course. On the other hand, the SFU Study Hub will also serve as a place for private tutors to advertise themselves if they wish to take in students. Users will be able to find the best matches for potential tutors or future study group sessions as the SFU Study Hub takes into account the user’s schedule and filters search results according to his or her preference. Our application conveniently schedule and remind users of any study and tutoring sessions they are interested in participating in.

## Who is the target audience? Who will use your product?
Our target audience are tutors for SFU courses looking to find a way to advertise their services find students in need of their services, as well as students attending SFU who would like help with their studies.

## Does this problem have many individual features, or one main feature with many subproblems?
This problem has multiple individual features with subproblems.

One feature is a message board which has a thread for each course. Within each
thread will be a topic listing all the available tutors as well as their hourly rates, and additional threads for advertisements, tutoring requests, and group study requests, and general help. We will be using the SFU Course Outline API to add the information of each course being offered in their respective threads.The replies in each thread can also be voted up or down. Users can also search for specific threads in the forums. This message board will also include an announcement thread for admins to inform users of any news and a suggestion thread for when users have any improvements in mind.

The tutors and tutees will also have their own profiles. The tutors will have their hourly rates, courses they’re tutoring, as well as ratings from their tutees on it. It will also mention their preferred locations for tutoring sessions, as well as include a calendar regarding their availabilities (will be elaborated more on later). There will also be a log of all their prior tutoring sessions and scheduled future ones. The tutee’s profiles will include the courses they are taking. The user’s past responses in the message board, how often they respond, and how often their responses are voted the best can also be seen on their profile. The profile will also have a blurb space for the users to write whatever they may want.

There will also be a private messaging system for the users to communicate one on one to each other, such as when a tutor and a tutee wish to discuss when the session will be and how it’ll be conducted or any other details. A user can private message another user by clicking on a button in their profile.

The calendar mentioned earlier will use the Google Calendar API and allow tutors to input their availabilities for whichever courses they can tutor. It will also have a filter function, allow users to filter by courses, times, locations, and rates. It will also remind the users of which sessions they signed up for.

In addition, the users will notified of suggestions based off of their courses, location, and other information. These suggestions will consist of upcoming tutoring sessions and study groups near their current location and will use the Google Maps API to find nearby events.

There will also be a payment feature for tutors using the Paypal API.

## What are some sample stories/scenarios? For example, as a regular user to your site, what types of things can I do? As an admin for your site? This are the ‘stories’ of your project.

Any student user would be able to start threads in course-specific discussion boards for advice. For example, users may ask about other student’s experiences with a professor or help with understanding a specific example covered in lecture. From a tutee perspective, you would be able to create threads to request for a tutor or to start a study group. You would also be able to select tutors based on their payment rates and schedules, contact them via private messaging to arrange sessions, and rate them. On the other hand, tutors would be able to create threads advertising their services, specifying their method of delivery and availability on their profiles. Both tutee and tutor users would be able to access and manipulate their calendar in order to work out an optimal schedule for tutoring and study sessions. They will also be reminded of these sessions in advance.

Admins will be able to edit and delete any responses in the message board. They can also post announcements in the announcement thread. Users will be able to report other users to the admins, and the admins are able to ban users if necessary.


## Is the amount of work required in this proposal enough for five group members?
Yes, it is more than enough. We have five epics: the message board, the profiles, the private messaging function, the calendar and reminders function, and suggestion functions. We also have subproblems we would like to solve in each epic such as all the features being implemented in the message board and calendar. We also have additional problems to solve, such as the payment system.


---

# ruby-getting-started

A barebones Rails app, which can easily be deployed to Heroku.

This application support the [Getting Started with Ruby on Heroku](https://devcenter.heroku.com/articles/getting-started-with-ruby) article - check it out.

## Running Locally

Make sure you have Ruby installed.  Also, install the [Heroku Toolbelt](https://toolbelt.heroku.com/).

```sh
$ git clone git@github.com:heroku/ruby-getting-started.git
$ cd ruby-getting-started
$ bundle install
$ bundle exec rake db:create db:migrate
$ heroku local
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```sh
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

or

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Docker

The app can be run and tested using the [Heroku Docker CLI plugin](https://devcenter.heroku.com/articles/local-development-with-docker-compose).

Make sure the plugin is installed:

    heroku plugins:install heroku-docker

Configure Docker and Docker Compose:

    heroku docker:init

And run the app locally:

    docker-compose up web

The app will now be available on the Docker daemon IP on port 8080.

To work with the local database and do migrations, you can open a shell:

    docker-compose run shell
    bundle exec rake db:migrate

You can also use Docker to release to Heroku:

    heroku create
    heroku docker:release
    heroku open

## Documentation

For more information about using Ruby on Heroku, see these Dev Center articles:

- [Ruby on Heroku](https://devcenter.heroku.com/categories/ruby)
