require 'json'


movie_data = JSON.parse(File.read('in_theaters.json'))



def print_movie(movie_hash)
  title = movie_hash["title"]
  mpaa_rating = movie_hash["mpaa_rating"]
  average_scores = return_rating(movie_hash)

  cast_members = cast_members(movie_hash, 3)

  puts "#{average_scores} - #{title} (#{mpaa_rating})"

end
#print_movie(movie_data["movies"][0])


def return_rating(movie_hash)
  critic_score = movie_hash["ratings"]["critics_score"]
  audience_score = movie_hash["ratings"]["audience_score"]
  average_scores = (critic_score + audience_score) / 2
  return average_scores
end


def cast_members(movie_hash, num_cast_members = 0)
  all_cast = movie_hash["abridged_cast"]
  cast_names = []
  all_cast.each do |cast_member|
    name = cast_member["name"]
    cast_names << name
  end
  puts "#{cast_names.slice(0, num_cast_members)}"
  return cast_names.slice(0, num_cast_members)
end
cast_members(movie_data["movies"][0], 3)


#CONGLOMERATE FUNCTION-------------------------------------------------------
def movie_info(movie_data)
  puts "In Theaters Now:"
  puts nil

  movies = movie_data["movies"]
  links = movie_data["links"]
  link_template = movie_data["link_template"]

end
#movie_info(movie_data)
