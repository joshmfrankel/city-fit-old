class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def test
    client = Indeed::Client.new Rails.application.secrets.indeed_api

    params = {
        :q => 'ruby',
        :l => 'austin',
        :userip => '1.2.3.4',
        :useragent => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2)',
    }

    @result = client.search(params)
  end
end
