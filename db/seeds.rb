Puzzle.create!([
  {title: "Apollo", height: 338, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450333575/h70idx5kqlnmvnepmuag.gif", public_id: "h70idx5kqlnmvnepmuag", user_id: 1},
  {title: "batman", height: 308, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450335442/exdfn5mecmmlhsvdvgty.png", public_id: "exdfn5mecmmlhsvdvgty", user_id: 1},
  {title: "comic heroes", height: 393, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450953703/vfzj5kszenm1j2v9vm3d.jpg", public_id: "vfzj5kszenm1j2v9vm3d", user_id: 1},
  {title: "Shivan Dragon", height: 481, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450953727/hbwsmb3jqkgcq8uvlaq5.jpg", public_id: "hbwsmb3jqkgcq8uvlaq5", user_id: 1},
  {title: "Star Wars", height: 338, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450953748/jbqkexqxrvms50bjjukh.jpg", public_id: "jbqkexqxrvms50bjjukh", user_id: 1},
  {title: "Where is Wally", height: 376, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450953768/bglbyyags7n592iczt8e.jpg", public_id: "bglbyyags7n592iczt8e", user_id: 1},
  {title: "Pier", height: 337, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450954648/ljbnccuc2mfxlzhjrcyp.jpg", public_id: "ljbnccuc2mfxlzhjrcyp", user_id: 1},
  {title: "Frankie", height: 400, width: 300, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1451132917/nixpxh9kja87yt0cexvc.jpg", public_id: "nixpxh9kja87yt0cexvc", user_id: 1},
  {title: "Flash", height: 338, width: 600, path: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1451132966/mexlzufwyb9m1hihvtrf.jpg", public_id: "mexlzufwyb9m1hihvtrf", user_id: 1}
])

Score.create!([
  {user_id: 1, puzzle_id: 1, puzzle_size: 3, puzzle_score: "00:33"},
  {user_id: 1, puzzle_id: 1, puzzle_size: 3, puzzle_score: "00:23"},
  {user_id: 1, puzzle_id: 1, puzzle_size: 3, puzzle_score: "00:01"},
  {user_id: 1, puzzle_id: 1, puzzle_size: 3, puzzle_score: "01:33"},
  {user_id: 1, puzzle_id: 1, puzzle_size: 3, puzzle_score: "00:34"},
  {user_id: 1, puzzle_id: 2, puzzle_size: 3, puzzle_score: "00:22"},
  {user_id: 1, puzzle_id: 3, puzzle_size: 7, puzzle_score: "02:26"},
  {user_id: 1, puzzle_id: 3, puzzle_size: 5, puzzle_score: "00:44"},
  {user_id: 1, puzzle_id: 4, puzzle_size: 3, puzzle_score: "00:18"},
  {user_id: 1, puzzle_id: 4, puzzle_size: 2, puzzle_score: "00:04"},
  {user_id: 2, puzzle_id: 4, puzzle_size: 5, puzzle_score: "01:23"},
  {user_id: 2, puzzle_id: 3, puzzle_size: 3, puzzle_score: "00:13"},
  {user_id: 2, puzzle_id: 6, puzzle_size: 3, puzzle_score: "00:21"}
])

User.create!([
  {first_name: "Wally", last_name: "West", email: "wallywest@gmail.com", username: "wally", password_digest: "$2a$10$Uo7mqSoLVeMTP//NWz4eiuwkJltu68.c0EgmXDCniFxgNBq3KYLNq", profile_picture: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1451217764/kqwwtdoj1hz8kzkq3pzq.jpg", public_id: "kqwwtdoj1hz8kzkq3pzq"},
  {first_name: "Alex", last_name: "Lee", email: "alex@gmail.com", username: "alex", password_digest: "$2a$10$Ly5EhQa8f2Sg6qFd7ydZwelvjGdgzo8NGy5BnwyFmssebXY.JCptK", profile_picture: "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450935422/profile_sgpoeq.jpg", public_id: nil}
])
