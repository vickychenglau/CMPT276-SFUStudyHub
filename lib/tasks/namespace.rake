namespace :namespace do
  desc "TODO"
  task user_id_increment: :environment do


    db_name_downcase = ActiveRecord::Base.connection.adapter_name.downcase

    if User.maximum(:id).to_i < 1000
      if db_name_downcase.start_with? "mysql"
        ActiveRecord::Base.connection.execute("ALTER TABLE users AUTO_INCREMENT = 1000")
      end
      if db_name_downcase.start_with? "postgres"
        ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq START with 1000 RESTART;")
      end
      if db_name_downcase.start_with? "sqlite"
        ActiveRecord::Base.connection.execute("insert into sqlite_sequence(name,seq) values('users', 1000)")
      end
    else
      puts "To perform this task your database shouldn't have records with id number higher than 1000"
    end


  end



end
