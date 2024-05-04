user = User.new(user_name: "Webspire", name: "DON", email: "rafeek.ahmed1968@gmail.com",mobile_number: 8610002422, password_digest: "$2a$12$KhYF00VtR6F2nLMHfVy/FueJfRoIqjyiIdl45sYz6dYQfU7L1D8C2")
user.user_profile.attach(io: File.open('app/assets/images/user-default-icon.png'), filename: 'user-default-icon.png',
content_type: 'image/png')
# user.story.attach(io: File.open("app/assets/images/extra-stories/story2.jpg").to_io, filename: "story1.jpg",content_type: "image/jpg")
user.save!

for i in 2..12
    # Create user first and then run attaching stories and user_profile to them
    user = User.new(user_name: FFaker::Name.unique.name, name: FFaker::Name.name, email: FFaker::Internet.email, mobile_number: rand(1000000000..9999999999), password_digest: "$2a$12$KhYF00VtR6F2nLMHfVy/FueJfRoIqjyiIdl45sYz6dYQfU7L1D8C2")
    user.story.attach(io: File.open("app/assets/images/extra-stories/story#{i}.jpg").to_io, filename: "story#{i}.jpg" )
    user.user_profile.attach(io: File.open("app/assets/images/user-default-icon.png").to_io, filename: "user-default-icon.png")
    user.save!
end
