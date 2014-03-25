namespace :calc do
  task :followers_per_hour => :environment do
    include Calc
    calc_metric_count_per_hour(WbUser.all, "followers")
  end

  task :bi_followers_per_hour => :environment do
    include Calc
    calc_metric_count_per_hour(WbUser.all, "bi_followers")
  end

  task :friends_per_hour => :environment do
    include Calc
    calc_metric_count_per_hour(WbUser.all, "friends")
  end

  task :statuses_per_hour => :environment do
    include Calc
    calc_metric_count_per_hour(WbUser.all, "statuses")
  end

  task :favourites_per_hour => :environment do
    include Calc
    calc_metric_count_per_hour(WbUser.all, "favourites")
  end

  task :all => ["followers_per_hour", "bi_followers_per_hour", "friends_per_hour", "statuses_per_hour", "favourites_per_hour"] do
  end
end