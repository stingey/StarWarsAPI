class PagesController < ApplicationController
	$rooturl = "http://swapi.co/api/"
	$basepeople ='http://swapi.co/api/people/'
	$baseplanet = 'http://swapi.co/api/planets/'
	def home
		indexurl = open('http://swapi.co/api/')
  		things = indexurl.read
  		parsed_json = JSON.parse(things)
  		@menuitems = parsed_json
	end

	def people
		@thing = params[:action]
		baseurl= $rooturl + @thing
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@peoplenext = parsed_json['next']
		@page=@peoplenext.split('/')[-1]
		@people = parsed_json['results']
		for x in @people
      x['id']=x['url'].split('/')[-1]
    end

	end
	def planets
		@thing = params[:action]
		baseurl=$rooturl + @thing
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@planet = parsed_json['results']
		for x in @planet
			x['id'] = x['url'].split('/')[-1]
		end
	end

	def films
		@thing = params[:action]
		baseurl=$rooturl + @thing
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@film = parsed_json['results']
		for x in @film
			x['id'] = x['url'].split('/')[-1]
		end
	end
	def species
		@thing = params[:action]
		baseurl=$rooturl + @thing
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@species = parsed_json['results']
		for x in @species
			x['id'] = x['url'].split('/')[-1]
		end
	end
	def vehicles
		@thing = params[:action]
		baseurl=$rooturl + @thing
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@vehicle = parsed_json['results']
		for x in @vehicle
			x['id'] = x['url'].split('/')[-1]
		end
	end
	def starships
		@thing = params[:action]
		baseurl=$rooturl + @thing
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@starship = parsed_json['results']
		for x in @starship
			x['id'] = x['url'].split('/')[-1]
		end
	end

	def peopleprofile
		@id=params[:id]
		baseurl=$basepeople+@id
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@name=parsed_json['name'].downcase
		@height = parsed_json['height'].downcase
    @mass = parsed_json['mass'].downcase
    @haircolor = parsed_json['hair_color'].downcase
    @skincolor = parsed_json['skin_color'].downcase
    @eyecolor = parsed_json['eye_color'].downcase
    @birthyear = parsed_json['birth_year'].downcase
    @homeworld = parsed_json['homeworld'].downcase
		@worldid= @homeworld.split('/')[-1]
		url_open = open(@homeworld)
    url_read = url_open.read
    url_parsed = JSON.parse(url_read)
    @planet_name = url_parsed['name']
    @films = []
    for x in parsed_json['films']
      @films << x
    end

	end

	def planetprofile
		@id=params[:id]
		baseurl=$baseplanet+@id
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@name=parsed_json['name'].downcase
		@rotation=parsed_json['rotation_period']
		@climate=parsed_json['climate'].downcase
		@gravity=parsed_json['gravity'].downcase
		@terrain=parsed_json['terrain'].downcase
		@population=parsed_json['population'].downcase

	end

	def filmsprofile
		@id=params[:id]
		baseurl="http://swapi.co/api/films/"+@id
		index = open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@title=parsed_json['title'].downcase
		@episode=parsed_json['episode_id']
		@opening=parsed_json['opening_crawl'].downcase
		@director=parsed_json['director'].downcase
		@release=parsed_json['release_date'].downcase
	end

	def speciesprofile
		@id=params['id']
		baseurl="http://swapi.co/api/species/"+@id
		index=open(baseurl)
		read = index.read
		parsed_json = JSON.parse(read)
		@name = parsed_json['name'].downcase
		@classification = parsed_json['name'].downcase
		@designation = parsed_json['name'].downcase
		@skin_color = parsed_json['skin_colors'].downcase
		@language = parsed_json['language'].downcase

	end
end
