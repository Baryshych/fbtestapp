class UsersController < ApplicationController

  def index

  end

  def login
    $graph = Koala::Facebook::API.new(request.env['omniauth.auth']['credentials']['token'])
    @user = $graph.get_object("me?fields=picture.type(large),id,name,bio,birthday,hometown,education,email")
  end

  def showFriends
     @friends = $graph.get_connections("me", "friends?fields=id,name,picture")
  end
    
end
