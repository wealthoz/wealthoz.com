class GroupsController < ApplicationController
  before_action :signed_in_user

  def create
    @group = group.users.build(group_params)
    if @group.save
      flash[:success] = "Wealth GROUP created!"
      redirect_to root_url
    else
       flash.now[:error] = "Could not save group"
    end
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end

  private

    def group_params
      params.require(:group).permit(:group_name)
    end


end
