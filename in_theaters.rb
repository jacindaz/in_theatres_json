require 'json'


movie_data = JSON.parse(File.read('in_theaters.json'))


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
  #puts "#{cast_names.slice(0, num_cast_members)}"
  return cast_names.slice(0, num_cast_members)
end
#cast_members(movie_data["movies"][0], 3)


def cast_members_string(cast_array)
  cast_members = ""
  cast_array.each do |member|
    if cast_array.last != member
      cast_members << "#{member}, "
    else
      cast_members << member
    end
  end
  #puts cast_members
  return cast_members
end
#cast_members_string(["Andrew", "Emma", "Jamie"])

#PRINTS A SINGLE MOVIE-------------------------------------------------------
def print_movie(movie_hash)
  title = movie_hash["title"]
  mpaa_rating = movie_hash["mpaa_rating"]
  average_scores = return_rating(movie_hash)
  cast_members_array = cast_members(movie_hash, 3)
  cast = cast_members_string(cast_members_array)

  puts "#{average_scores} - #{title} (#{mpaa_rating}) starring #{cast}"

end
#print_movie(movie_data["movies"][0])


#CONGLOMERATE FUNCTION-------------------------------------------------------
def movie_info(movie_data)
  puts "In Theaters Now:"
  puts nil

  movies = movie_data["movies"]
  links = movie_data["links"]
  link_template = movie_data["link_template"]

end
#movie_info(movie_data)
