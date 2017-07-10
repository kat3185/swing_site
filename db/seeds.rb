# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
student = Role.find_or_create_by!(name: "Student")
admin = Role.find_or_create_by!(name: "Admin")
owner = Role.find_or_create_by!(name: "Owner")

ken = User.find_or_create_by({
  first_name: "Ken",
  last_name: "Thomas",
  email: "ken.thomas.08@gmail.com",
  password: "password",
  password_confirmation: "password_confirmation"
  })
ken.save!

UserRole.find_or_create_by!(user: ken, role: owner)

sarah = User.find_or_create_by(first_name: "Sarah", last_name: "Gettah", email: "hiiamsarahsemail@gmail.com")
sarah.password = "password"
sarah.password_confirmation = "password"
sarah.save!

UserRole.find_or_create_by!(user: sarah, role: student)

kellian = User.find_or_create_by(first_name: "Kellian", last_name: "Pletcher", email: "definitelykellian@gmail.com")
kellian.password = "password"
kellian.password_confirmation = "password"
kellian.save!

UserRole.find_or_create_by!(user: kellian, role: admin)

body = %q{
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in arcu ut leo eleifend aliquam sit amet eu justo. Maecenas vehicula ante sed nisl rhoncus rhoncus. Nullam nec diam eleifend, rhoncus eros vel, auctor augue. Cras aliquet arcu eu lectus commodo, et ornare tortor accumsan. Sed sollicitudin sem quis massa ultricies scelerisque sed at mi. Nullam feugiat placerat ex pretium convallis. Vivamus pulvinar luctus tristique. Phasellus sit amet nulla rhoncus, blandit enim ut, luctus leo. Fusce blandit lacinia posuere. In efficitur lacus a condimentum faucibus.

Aliquam erat volutpat. Proin dapibus eget metus sit amet auctor. Sed sodales lorem vel eleifend accumsan. Nunc nisi felis, volutpat et pulvinar at, efficitur ut nisl. Pellentesque rhoncus eleifend quam quis sollicitudin. Phasellus bibendum dolor diam, eleifend dignissim augue pharetra at. Vestibulum nec diam egestas nisl gravida vestibulum quis ac quam. Etiam arcu ex, vestibulum non enim vitae, cursus tempus odio.

Sed rutrum urna id quam sagittis, vitae consequat nisl scelerisque. Nulla lacinia porttitor mauris vel dignissim. Etiam tempus vestibulum eros, nec mollis odio efficitur id. Mauris vel ornare ex. Fusce vitae lacus lobortis, iaculis nulla eu, sollicitudin felis. Pellentesque ipsum eros, scelerisque sed vulputate quis, placerat et arcu. Nunc porta mauris vitae erat sagittis lacinia. Morbi mi lacus, dignissim nec gravida ut, tristique ut neque. Aliquam ultricies dictum dolor, eu ultricies dolor ornare sed. Sed ut quam felis.
}

Post.find_or_create_by!(title: "What a cool site!", body: body)
