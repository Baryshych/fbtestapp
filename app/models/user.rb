class User < ActiveRecord::Base
    
  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture,id")
  end
  
  def purge
    usersToPurge = Users.where("updated_at.day >= Date.today.day")
    usersToPurge.each do |u|
      u.delete
    end
  end
  
end
