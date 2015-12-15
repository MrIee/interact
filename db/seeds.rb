User.destroy_all
User.create(:first_name => "Wally", :last_name => "West", :email => "wallywest@gmail.com", :password => "foobar", :password_confirmation => "foobar")

Puzzle.destroy_all
puzzle = Puzzle.create(:title => "Batman Logo", :height => 308, :width => 600, :path => "batman-logo/Batman-Logo.gif")