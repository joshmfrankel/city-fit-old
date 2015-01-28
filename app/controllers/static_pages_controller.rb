class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def test
    #http://stackoverflow.com/questions/4673424/ruby-nokogiri-need-to-put-node-value-to-an-array
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://api.indeed.com/ads/apisearch?publisher=2996227314299730&q=therapist&l=austin%2C+tx&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2")) do |config |
      config.noblanks
    end

    @result = doc.xpath('//result').map do |result|
      result.xpath( './/text()' ).map{ |node| node.text }
    end

  end
end
