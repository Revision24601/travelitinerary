require 'rubygems'
require 'open-uri'
require 'google_places'


class SearchController < ApplicationController
  def index
  	@search_query = params[:query]

  	puts "PARAMS PLS" 
  	puts params
  	@client = GooglePlaces::Client.new("AIzaSyB8JsJYe-lexJph91XALK-XhPxPQZAlk48")

  	# @spots = @client.spots(41.9100711,12.5359979)

  	@placeholdertypesarray = ['museum', 'zoo', 'establishment']

  	@torontospots = @client.spots_by_query(@search_query)
  	@lat = @torontospots[0].lat
  	@lng = @torontospots[0].lng
  	@spots = @client.spots(@lat, @lng, :radius => 40000)
  	# @sortedspots = @spots.sort! { |a,b| a[:rating] <=> b[:rating] }
  	# @sortedspots = @spots.sort{|spots,b| b[:rating] <=> spots[:rating]}

  	# @spots = @client.spots(@lat, @lng, :radius => 40000)




  	# @spots_by_query = @client.spots_by_query(@search_query)

  	# if (@spots_by_query[0].types).eql? "political"
  	# 	@name = @spots_by_query.name
  	# end

  end

  def create

  end
end
