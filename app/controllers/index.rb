get '/' do
	@photos = Photo.all
  erb :index
end


########## ALBUM CONTROLLER #################

get '/upload/photo' do 
	# @user_albums = User.find(session[:user_id]).albums
	puts current_user.albums
	puts "*"*100
	@user = current_user
	unless @user = current_user
		redirect '/login'
	end

	erb :_upload_form
end

post '/upload/photo' do
	if current_user
	uploader = ImageUploader.new
	uploader.store!(params['photo'])

	if params[:album_id] == 'new'
		@album = Album.create(params[:album].merge(:user_id => current_user.id))
		puts @album
		puts "*"*100
	else
		@album_id = params[:album_id]
	end
	Photo.create( title: params[:title], 
											 description: params[:description], 
											 photo_string: params[:photo][:filename],
											 album_id: @album_id)
	redirect '/'
	end
end

get '/album/:album_id' do
	@album = Album.find(params[:album_id])
	erb :album
end

#### USER CONTROLLER ########

get '/user/:id' do
  @user = User.find(params[:id])
  @albums = @user.albums
  erb :userpage  
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    erb :launch
  end
end

get '/login' do
	erb :launch
end


post '/login' do
  if @user = User.authenticate(params[:user])
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    erb :launch
  end
end

get '/logout' do
  session.clear
  redirect '/'
end