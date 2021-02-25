namespace :db do
  desc 'Add members'
  task :seed => :environment do
    Member.create(name: "Aaron", url: "https://www.reddit.com")
    Member.create(name: "David", url: "https://www.cnn.com")
    Member.create(name: "Susan", url: "https://www.bbc.com")
    Member.create(name: "Carl", url: "https://www.yahoo.com")
    Member.create(name: "Joe", url: "https://www.bing.com")
    Member.create(name: "Cat", url: "https://www.google.com")
    Member.create(name: "kumar", url: "https://www.kotaku.com")
    Member.create(name: "Kevin", url: "https://www.times.com")
  end
end
