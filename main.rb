  
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry' if development?

require_relative 'models/gear_items'
require_relative 'models/users'
require_relative 'models/comments'

enable :sessions


def logged_in?
  
  if session[:user_id]
    return true
  else
    return false
  end
  
end

def current_user()
  user = get_user_by_id(session[:user_id])
  return user
end

get '/signup' do

  erb(:signup)

end

post '/signup' do

  create_user(params[:email], params[:username], params[:password], params[:avatar_url])

  redirect '/'

end 

get '/login' do

  erb(:login)

end

post '/login' do

  user = get_user_by_username(params[:username])

  puts user

  if user && 
        
    BCrypt::Password.new(user["digested_password"]) == params[:password]

    session[:user_id] = user['user_id']

    redirect '/'
  elsif !user

    erb (:signup)

  else
      #not logged in
    erb (:login)

  end

end


get '/' do

  gear_items = get_all_gear_items()
  owners = get_all_users()


  erb(:index, locals: 
    {gear_items: gear_items,
    owners: owners
      })

end

get '/gear_items/my_board_room' do

  if logged_in?
    user_gear_items = get_all_user_gear_items(session[:user_id])
    owner = get_user_by_id(session[:user_id])

    erb(:user_items_index, locals: 
      {user_gear_items: user_gear_items,
      owner: owner
        })
  else
    redirect '/login'
  end
end

get '/gear_items/new' do

  erb(:new)

end

post '/gear_items' do

  if logged_in?

    create_gear_item(params[:name], params[:item_description], params[:image_url], params[:purchase_location], params[:last_used_location], session[:user_id])

  else

    redirect "/login"
        
  end

  redirect "/gear_items/my_board_room"
end


get '/gear_items/:item_id' do

  owners = get_all_users()
  gear_item = get_gear_by_id(params[:item_id])
  gear_item_comments = get_all_gear_item_comments(params[:item_id])


  erb(:show, locals: 
    {owners: owners,
    gear_item: gear_item,
    gear_item_comments: gear_item_comments
    })

end

get '/gear_item/:item_id/edit' do

  gear_item = get_gear_by_id(params[:item_id])

  erb(:edit, locals: {
    gear_item: gear_item
  })

end 


patch '/gear_items' do

  update_gear_item(params[:name], params[:item_description], params[:image_url], params[:purchase_location], params[:last_used_location], params[:item_id])

  redirect "/gear_items/#{params[:item_id]}"
end 


post '/comments/new' do
  
  create_comment(params[:gear_item_id], params[:comment_content], session[:user_id])

  redirect "/gear_items/#{params[:gear_item_id]}"

end


delete '/gear_items' do

  delete_gear_item(params[:item_id])

  redirect '/gear_items/my_board_room'

end

delete '/comments' do

  delete_comment(params[:comment_id])

  redirect "/gear_items/#{params[:gear_item_id]}"

end


delete '/logout' do
  session[:user_id] = nil;

  redirect '/login'
end















