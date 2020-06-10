def seed_users
  user_id = 0
  10.times do
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id = user_id + 1
  end
end

def seed_categories
  hobby = ['Arts', 'Crafts', 'Sports', 'Sciences', 'Collecting', 'Reading', 'Other']
  study = ['Arts and Humanities', 'Physical Science and Engineering', 'Math and Logic',
          'Computer Science', 'Data Science', 'Economics and Finance', 'Business',
          'Social Sciences', 'Language', 'Other']
  team = ['Study', 'Development', 'Arts and Hobby', 'Other']

  hobby.each do |name|
    Category.create(branch: 'hobby', name: name)
  end

  study.each do |name|
    Category.create(branch: 'study', name: name)
  end

  team.each do |name|
    Category.create(branch: 'team', name: name)
  end
end

def seed_posts
  categories = Category.all

  categories.each do |category|
    5.times do
      Post.create(
        title: Faker::Lorem.sentences[0],
        content: Faker::Lorem.sentences[0],
        user_id: rand(1..9),
        category_id: category.id
      )
    end
  end
end

puts 'OLD USERS'
puts 'Deleting files....'
User.all.destroy_all
puts ' - completed'
puts '---------------'
puts 'OLD CATEGORIES'
Category.all.destroy_all
puts ' - completed'
puts '---------------'
puts 'OLD POSTS'
Post.all.destroy_all
puts ' - completed'
puts '****************'
puts 'New Users'
puts '...Seeding'
seed_users
puts ' - completed'
puts '---------------'
puts 'New Categories'
puts '...Seeding'
seed_categories
puts ' - completed'
puts '---------------'
puts 'New Posts'
puts '...Seeding'
seed_posts
puts ' - completed'
