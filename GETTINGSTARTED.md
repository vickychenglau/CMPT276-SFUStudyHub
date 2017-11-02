Using Linux Ubuntu 16.04

## Setting up locally
Remember to already have SSH set up with your github account and Vicky added you
are a collaborator to the repository.
Go to the directory where you want to store the repository.

In the cmd line which initializes git to that folder

  "git init"

Fork the repo

  "git clone git@github.com:vickychenglau/CMPT276-SFUStudyHub.git"

Next is set yourself so you will be pushing to the repo
  "git remote add origin git@github.com:vickychenglau/CMPT276-SFUStudyHub.git"

Check if you can indeed added the new repository

  "git remote -v"

Add tracking to the development branch

  "git checkout --track origin/development-1"

Check which branch you are and make sure you are on development-1 branch, it will be in green

  "git branch"

Then create a new branch of your own. In my example I will call it YOURBRANCH

  "git checkout -b YOURBRANCH"

Make any changes in YOURBRANCH and do not forget to commit them

  "git add ."

  "git commit -m "Did some changes""

  "git push -u origin YOURBRANCH"

When you want to merge to development branch

  "git checkout development-1"

  "git merge YOURBRANCH"

  "git push -u origin development-1"

## Ruby

Do not forget to set up your database, and user. Login as Postgres

  "sudo -u postgres psql postgres"

Create the database and the user

  "CREATE DATABASE cmpt276;"

  "CREATE DATABASE cmpt276_test;"

  "CREATE USER cmpt276 PASSWORD 'thecmpt276Passw0rd';"

  "GRANT ALL PRIVILEGES ON DATABASE cmpt276 TO cmpt276;"

Quit and do not forget to rake the database. You may get an error because I placed my model in there that requires foreign keys not yet made

  "rake db:migrate"

Generate controller and models. You can also get rid of them by rails destroy controller/model

  "rails generate controller CONTROLLERNAME VIEW1 VIEW2"
  
  "rails generate model MODELNAME COLUMN1:TYPE COLUMN2:TYPE"
