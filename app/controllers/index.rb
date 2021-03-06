get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new
end

post '/events/create' do
	title = params[:title]
  name  = params[:name]
  email = params[:email]
  date  = params[:date]
  p title
  p name
  p email
  p date
  @event = Event.create(title: title, organizer_name: name, organizer_email: email, date: date)
  if @event.errors.any?
    @errors = @event.errors.full_messages
    erb :new
  else
    redirect '/'
  end
end
