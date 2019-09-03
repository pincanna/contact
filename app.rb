require 'sinatra'
enable :sessions

def map_email(category)
  case category
  when 'General Inquiry'
    return 'info@pincanna.com'
  when 'Marketing'
    return 'marketing@pincanna.com'
  when 'Employment'
    return 'emp.inq@o365.pincanna.com'
  else
    return "administrator@pincanna.com"
  end
end

get '/', provides: 'html' do
  slim :index, layout: true
end

post '/' do
  @recipient = map_email(params["category"])
  puts params["category"]
  puts @recipient
  slim :result, layout: true
end