Puzzle.destroy_all
Puzzle.create!([
  {title: "Apollo", height: 338, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450333575/h70idx5kqlnmvnepmuag.gif", public_id: "h70idx5kqlnmvnepmuag", user_id: 1},
  {title: "batman", height: 308, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450335442/exdfn5mecmmlhsvdvgty.png", public_id: "exdfn5mecmmlhsvdvgty", user_id: 1}
])

Score.destroy_all
Score.create!([
  {user_id: 1, puzzle_id: 1, puzzle_score: "00:33", puzzle_size: 3},
  {user_id: 1, puzzle_id: 1, puzzle_score: "00:23", puzzle_size: 3},
  {user_id: 1, puzzle_id: 1, puzzle_score: "00:01", puzzle_size: 3},
  {user_id: 1, puzzle_id: 1, puzzle_score: "01:33", puzzle_size: 3},
  {user_id: 1, puzzle_id: 1, puzzle_score: "00:34", puzzle_size: 3}
])

User.destroy_all
User.create!([
  {first_name: "Wally", last_name: "West", email: "wallywest@gmail.com", username: "wally", password_digest: "$2a$10$W8fNuHR33bI6wPGvIsN1pOcx/RQk6OVfLR8/j2/IMjX3dJ6CSDOUG"}
])
