require 'rss'

class ArticlesController < ApplicationController
  def index
    @articles = []
    # I acknowledge that shelling out is an expensive process, but I'm also interested in spending less development time.
    # Also spoofing the user agent so I can hit the RSS feed repeatedly.
    rss = `curl -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5"  https://www.reddit.com/.rss`
    feed = RSS::Parser.parse(rss)
    @articles = feed.items
  end

  def starred
    @articles = Article.find(:all)
  end

  # There should be protection against storing dupes.
  def star
    params[:starred].each do |uri, headline|
      a = Article.new
      # Probably should've named this "url" instead.
      a.uri = uri
      a.headline = headline
      a.save
    end
    render action: 'starred'
  end
end
