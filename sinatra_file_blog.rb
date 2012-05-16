require 'sinatra'
require 'slim'
require 'rdiscount'

helpers do
  def markdown(md) RDiscount.new(md, :smart).to_html end
  def tilde_split(f)
    article = {}
    article[:published], article[:slug], article[:title] = File.basename(f, '.md').split('~')
    article[:title].gsub!('+', ' ')
    article
  end
  def get_articles
    articles = []
    Dir.glob('articles/*.md').each do |f|
      articles.push(tilde_split(f))
    end
    articles.sort_by { |article| article[:published] }.reverse
  end
  def get_article(slug)
    f = Dir.glob("articles/*~#{slug}~*.md").first
    if f
      article = tilde_split(f)
      article[:body] = File.open(f) { |f| File.read(f) }
      article
    end
  end
end

get '/' do
  slim :index
end
get '/articles/?' do
  @articles = get_articles
  slim :list
end
get '/articles/:slug/?' do
  if @article = get_article(params[:slug])
    slim :detail
  else
    error 404
  end
end
error 404 do
  slim :'404'
end
