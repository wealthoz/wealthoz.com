class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
  end

  def why
  end
   

  def how
  end
  
  def manage_groups
  end        
   
end
