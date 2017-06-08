
namespace :development do

  desc 'create test article'
  task create_test_article: :environment do
    require 'factory_girl_rails'
    FactoryGirl.create(:article)
  end

  task :clean_temp do
    `rm tmp/*`
  end
end


