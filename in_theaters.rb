require 'json'


movie_data = JSON.parse(File.read('in_theaters.json'))


def movie_info(movie_data)
  puts "In Theaters Now:"
  puts nil

  movies = movie_data["movies"]
  links = movie_data["links"]
  link_template = movie_data["link_template"]




end
movie_info(movie_data)



def print_movie(movie_hash)
  title = movie_hash["title"]
  mpaa_rating = movie_hash["mpaa_rating"]

  critic_score = movie_hash["ratings"]["critics_score"]
  audience_score = movie_hash["ratings"]["audience_score"]
  average_scores = (critic_score + audience_score) / 2

  puts "#{average_scores} - #{title} (#{mpaa_rating})"

end
#print_movie(movie_data["movies"][0])
