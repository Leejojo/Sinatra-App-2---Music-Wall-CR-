# Homepage (Root path)
get '/' do
  erb :index
end

get '/sign_up' do
  erb :'/sign_up/sign_up'
end

post '/sign_up' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :'/sign_up'
  end
end

get '/users/sign_in' do
  erb :'/users/sign_in'
end

post '/users/sign_in' do
  user = User.find_by(username: params[:username], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect '/songs'
  else
    redirect '/sign_up'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

# index (all songs)
get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end 

# new (form for new song)
get '/songs/new' do
  if session[:user_id]
    erb :'songs/new'
  else
    redirect '/sign_up'
  end
end

# show (individual song)
get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

# create (consumption of form submit)
post '/songs' do
  if session[:user_id]
    @song = Song.new(
      title: params[:title],
      author: params[:author],
      url: params[:url],
      user_id: session[:user_id]
    )
    if @song.save
      redirect '/songs'
    else 
      erb :'songs/new'
    end
  else
    redirect '/sign_up'
  end
end


