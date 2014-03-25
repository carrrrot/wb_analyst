namespace :fetch do
  task :wb_users => :environment do
    include Fetch
    fetch_wb_users(WbUser.joins(:wb_competitors).select("distinct(wb_users.id)").all)
  end

  # task :all => ["target_user", "status", "status_sentiment"] do
  # end
end
