class ArgonApp < Sinatra::Base
  def self.config
    configure do
      set :root, ENV['project_root']
      set :views, ENV['views_path']
    end
  end

  get '/' do
    puts (slim :index)
    slim :index
  end

  get '*', provides: 'html' do
    if params[:splat].first == "/favicon.ico"
      ""
    else
      slim params[:splat].first.to_sym
    end
  end
end
