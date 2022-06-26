namespace :delete_guest_data do
  desc "delete_guest_data"
  task destroy: :environment do
    user = User.find_by(email: "guest@example.com")
    user.post_animals.destroy_all
    user.animal_comments.destroy_all
    user.favorites.destroy_all
  end
end
