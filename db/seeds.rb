Participation.destroy_all
Quote.destroy_all
Chapter.destroy_all
Book.destroy_all
Movie.destroy_all
Character.destroy_all

puts "Destroy all"
api_key = ""
host_url = "https://the-one-api.herokuapp.com/v1/"
headers = { "Authorization" => "Bearer #{api_key}" }

url = host_url + "book"
books = JSON.parse(RestClient.get(url, headers))["docs"]
books.each do |book|
  Book.create!(api_id: book["_id"], name: book["name"])
end

puts "Create #{Book.count} Books"

url = host_url + "character"
characters = JSON.parse(RestClient.get(url, headers))["docs"]

characters.each do |character|
  Character.create!(
      height: character["height"],
      race: character["race"],
      gender: character["gender"],
      birth: character["birth"],
      spouse: character["spouse"],
      death: character["death"],
      realm: character["realm"],
      hair: character["hair"],
      name: character["name"],
      wikiUrl: character["wikiUrl"],
      api_id: character["_id"]
    )
end

puts "Create #{Character.count} Characters"

url = host_url + "movie"
movies = JSON.parse(RestClient.get(url, headers))["docs"]

movies.each do |movie|
  Movie.create!(
    name: movie["name"],
    runtimeInMinutes: movie["runtimeInMinutes"],
    budgetInMillions: movie["budgetInMillions"],
    boxOfficeRevenueInMillions: movie["boxOfficeRevenueInMillions"],
    academyAwardNominations: movie["academyAwardNominations"],
    academyAwardWins: movie["academyAwardWins"],
    api_id: movie["_id"],
  )
end

puts "Create #{Movie.count} movies"


url = host_url + "chapter"
chapters = JSON.parse(RestClient.get(url, headers))["docs"]

chapters.each do |chapter|
  book = Book.find_by(api_id: chapter["book"])
  position = book.chapters&.count.to_i + 1
  Chapter.create!(
    position: position,
    title: "Chapter #{position}",
    book: book,
    api_id: chapter["_id"]
  )
end

puts "Create #{Chapter.count} Chapters"


url = host_url + "quote"
quotes = JSON.parse(RestClient.get(url, headers))["docs"]

quotes.each do |quote|
  Quote.create!(
    dialog: quote["dialog"],
    movie: Movie.find_by(api_id: quote["movie"]),
    character: Character.find_by(api_id: quote["character"]),
    api_id: quote["_id"]
  )
end

puts "Create #{Quote.count} Quotes"



100.times do
  Participation.create(
   chapter: Chapter.all.sample,
   character: Character.all.sample
  )
end

puts "Create #{Participation.count} Participations"





