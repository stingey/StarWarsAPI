class PagesController < ApplicationController
	$rooturl = "http://swapi.co/api/"
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
end
