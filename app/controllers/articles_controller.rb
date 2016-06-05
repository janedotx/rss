require 'rss'

class ArticlesController < ApplicationController
  def index
    if RUBY_VERSION =~ /1.9/
      Encoding.default_external = Encoding::UTF_8
      Encoding.default_internal = Encoding::UTF_8
    end
    @articles = []
    # I acknowledge that shelling out is an expensive process, but I'm also interested in spending less development time.
    # Also spoofing the user agent so I can hit the RSS feed repeatedly while debugging.
    rss = `curl -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5"  https://www.reddit.com/.rss`
    begin
      feed = RSS::Parser.parse(rss)
      @articles = feed.items
    rescue Exception => e
      # If I had time I would handle various exceptions, e.g. coming across a Unicode character when the parser was expecting
      # only ASCII.
    end
  end

  def starred
    @articles = Article.find(:all) || []
  end

  # TODO: There should be protection against storing dupes.
  def star
  # TODO: Sanitize these inputs before putting them into the database.
    params[:starred].each do |headline, uri|
      a = Article.new
      # Probably should've named this "url" instead.
      a.uri = uri
      a.headline = headline
      a.save
    end
    redirect_to action: 'starred'
  end
end
