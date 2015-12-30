Puzzle.destroy_all
Puzzle.create!([
  {title: "Sample1", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Example", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample2", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample3", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample4", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample5", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample6", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample7", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample8", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample9", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample10", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample11", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample12", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample13", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample14", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample15", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample16", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample17", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample18", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample19", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample20", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
  {title: "Sample21", height: 400, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450148827/sample.jpg", public_id: "sample", user_id: 1},
])

Score.destroy_all
Score.create!([
  {user_id: 1, puzzle_id: 1, puzzle_size: 3, puzzle_score: "00:33"},
  {user_id: 1, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:23"},
  {user_id: 1, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:01"},
  {user_id: 1, puzzle_id: 3, puzzle_size: 3, puzzle_score: "01:33"},
  {user_id: 1, puzzle_id: 4, puzzle_size: 3, puzzle_score: "00:34"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 3, puzzle_score: "00:22"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 7, puzzle_score: "02:26"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 5, puzzle_score: "00:44"},
  {user_id: 1, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:18"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 2, puzzle_score: "00:04"},
  {user_id: 2, puzzle_id: 8, puzzle_size: 5, puzzle_score: "01:23"},
  {user_id: 2, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:13"},
  {user_id: 2, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:21"},
  {user_id: 1, puzzle_id: 1, puzzle_size: 3, puzzle_score: "00:33"},
  {user_id: 1, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:23"},
  {user_id: 1, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:01"},
  {user_id: 1, puzzle_id: 3, puzzle_size: 3, puzzle_score: "01:33"},
  {user_id: 1, puzzle_id: 4, puzzle_size: 3, puzzle_score: "00:34"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 3, puzzle_score: "00:22"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 7, puzzle_score: "02:26"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 5, puzzle_score: "00:44"},
  {user_id: 1, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:18"},
  {user_id: 1, puzzle_id: 5, puzzle_size: 2, puzzle_score: "00:04"},
  {user_id: 2, puzzle_id: 8, puzzle_size: 5, puzzle_score: "01:23"},
  {user_id: 2, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:13"},
  {user_id: 2, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:21"}
])

User.destroy_all
User.create!([
  {first_name: "Wally", last_name: "West", email: "wallywest@gmail.com", username: "wally", password_digest: "$2a$10$Uo7mqSoLVeMTP//NWz4eiuwkJltu68.c0EgmXDCniFxgNBq3KYLNq", profile_picture: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1451217764/kqwwtdoj1hz8kzkq3pzq.jpg", public_id: "kqwwtdoj1hz8kzkq3pzq"},
  {first_name: "Alex", last_name: "Lee", email: "alex@gmail.com", username: "alex", password_digest: "$2a$10$Ly5EhQa8f2Sg6qFd7ydZwelvjGdgzo8NGy5BnwyFmssebXY.JCptK", profile_picture: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450935422/profile_sgpoeq.jpg", public_id: nil}
])
