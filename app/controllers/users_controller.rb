class UsersController < ApplicationController

  def index

  end

  def login
    $graph = Koala::Facebook::API.new(request.env['omniauth.auth']['credentials']['token'])
    @user = $graph.get_object("me?fields=picture.type(large),id,name,bio,birthday,hometown,education,email")
    if User.find_by_facebook_id(@user['id']) && (User.find_by_facebook_id(@user['id']).updated_at.day - Date.today.day < 1)
      @data = User.find_by_facebook_id(@user['id'])
    else
      @data = User.new  
      @data.facebook_id = @user['id']
      @data.name = @user['name']
      @data.bio = @user['bio']
      @data.picture = @user['picture']['data']['url'].to_s
      @data.save
    end
    
  end

end
