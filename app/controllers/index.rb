get '/' do
  erb :index
end

get '/upload/photo' do 
	erb :_upload_form
end
post '/upload/photo' do
	p = ImageUploader.new
	p.store!(params['photo'])

	@photo = Photo.create( title: params[:title], description: params[:description], photo_string: params[:photo][:filename])

	@photo_url = p.retrieve_from_store!(@photo.photo_string)

	redirect '/'
end