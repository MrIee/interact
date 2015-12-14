User.destroy_all
User.create(:first_name => "Wally", :last_name => "West", :email => "wallywest@gmail.com", :password => "foobar", :password_confirmation => "foobar")

Puzzle.destroy_all
puzzle = Puzzle.create(:title => "Batman Logo", :height => 308, :width => 600, :path => "Batman-Logo.gif")

Piece.destroy_all
p1 = Piece.create(:label => "p1", :path => "Batman-Logo_01.gif")
p2 = Piece.create(:label => "p2", :path => "Batman-Logo_02.gif")
p3 = Piece.create(:label => "p3", :path => "Batman-Logo_03.gif")
p4 = Piece.create(:label => "p4", :path => "Batman-Logo_04.gif")
p5 = Piece.create(:label => "p5", :path => "Batman-Logo_05.gif")
p6 = Piece.create(:label => "p6", :path => "Batman-Logo_06.gif")
p7 = Piece.create(:label => "p7", :path => "Batman-Logo_07.gif")
p8 = Piece.create(:label => "p8", :path => "Batman-Logo_08.gif")
p9 = Piece.create(:label => "p9", :path => "Batman-Logo_09.gif")

puzzle.pieces << p1 << p2 << p3 << p4 << p5 << p6 << p7 << p8 << p9