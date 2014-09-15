require 'bundler/setup'
Bundler.require

require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("http://www.reddit.com"))   
puts page.class   # => Nokogiri::HTML::Document


   
puts page.css("page")[0].html 

