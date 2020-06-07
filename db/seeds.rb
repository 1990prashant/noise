# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
milestone = Milestone.find_or_initialize_by(name: 'Early 10000')
if milestone.new_record?
  milestone.required_steps = 10000
  milestone.save
end

badge = Badge.find_or_initialize_by(name: "Bronze")
if badge.new_record?
  badge.required_level = 1
  badge.save
end


5.times do |i|
  user = User.find_or_initialize_by(email: "bot-#{i}@example.com")
  if user.new_record?
    user.name = "Bot #{i}"
    user.password = "123456"
    user.password_confirmation = "123456"
    user.save
  end
  user.update_attributes(total_steps: 11000, level: i)
end