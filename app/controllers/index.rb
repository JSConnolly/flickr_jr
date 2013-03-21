get '/' do
  # Look in app/views/index.erb
  erb :_upload_form
end

post '/upload/photo' do
	p = ImageUploader.new
	p.store!(params['photo'])
	"OK"
	# File.open('/photos/' + params['photo'][:filename], "w") do |f|
	# 	f.write(params['photo'][:tempfile].read)
	# end
	# Photo.create( title: params[:title], description: params[:description], photo_string: params['photo'][:filename])
	# return "yeah it worked"
end