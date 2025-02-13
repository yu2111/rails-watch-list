require 'open-uri'
Movie.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
(1..10).to_a.each do |num|
  url = "http://tmdb.lewagon.com/movie/top_rated?page=#{num}"
  response = JSON.parse(URI.open(url).read)

  response['results'].each do |movie_hash|
    puts
    p movie_hash
    # create an instance with the hash
    Movie.create!(
      poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
      rating: movie_hash['vote_average'],
      title: movie_hash['title'],
      overview: movie_hash['overview']
    )
  end
end

puts "movies added"
