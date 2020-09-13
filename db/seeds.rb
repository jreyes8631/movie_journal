#Create 2 users:

jose = User.create(name: "jose", email: "jreyes8631@gmail.com", password: "mospozey")
naya = User.create(name: "Nayara", email: "nayare26@gmail.com", password: "mospozey2")

#create 2 movie

movie_one = Movie.create(title: "matrix", user_id: 1)
movie_two = Movie.create(title: "beuty and the beast", user_id: 2, description: "Scify movie")

#create 2 mreview

jose_review = Review.create(movie_id: movie_one.id, user_id: jose.id, rating: "5 starts", comment: "best movie ever")
naya_review = Review.create(movie_id: movie_two.id, user_id: naya.id, rating: "5 starts", comment: "best Disney movie ever")
