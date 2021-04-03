#create can return false, create! will return an exception
user1 = User.create!(email: "fake1ne@fake.com", username: "fake1ne")
user1.reviews.create!(title: "The Matrix", year: 1999, rating: 5, content: "This movie was great! Cue bullet time!", user: user1)

user2 = User.create!(email: "2fake@fake.com", username: "2fake")
user2.reviews.create!(title: "The Empire Strikes Back", year: 1980, rating: 5, content: "YOU WON/'T BELIEVE WHO VADER IS!!", user: user2)

user3 = User.create!(email: "fak3@fake.com", username: "fak3")
user3.reviews.create!(title: "Godzilla vs. Kong", year: 2021, rating: 3, content: "Amazing movie? No. Did we get lots of giant monster fights? Absolutely!!", user: user3)
