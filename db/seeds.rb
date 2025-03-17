User.destroy_all

admin_password = ENV["ADMIN_PASSWORD"]

super_admin = User.find_or_create_by!(email: "clarisse@zigzag.com") do |user|
  user.password = admin_password
  user.password_confirmation = admin_password
  user.role = "admin"
end

user = User.find_or_create_by!(email: "user@zigzag.com") do |user|
  user.password = admin_password
  user.password_confirmation = admin_password
  user.role = "user"
end

puts "Super admin créé avec succès ! Email: #{super_admin.email} | Mot de passe: #{super_admin.password}"
