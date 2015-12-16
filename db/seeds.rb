User.destroy_all
u = User.create(:first_name => "Wally", :last_name => "West", :email => "wallywest@gmail.com", :password => "foobar", :password_confirmation => "foobar")

# Puzzle.destroy_all
# p = puzzle = Puzzle.create(:title => "Batman Logo", :height => 308, :width => 600, :path => "batman-logo/Batman-Logo.gif", :user_id => "1")

# u.puzzles << p;