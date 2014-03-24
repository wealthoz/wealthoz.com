class GroupsController < ApplicationController
  before_action :signed_in_user

  def edit
    @group = Group.find(params[:id])
  end
  
  def show
     @groups = Groups.all.by_name
  end

  def new
    def new
      @group = Group.new
    end
    
    def create
      @group = Group.new(group_params)
      if @group.save
        flash[:success] = "Wealth GROUP created!"
        redirect_to root_url
      else
         flash.now[:error] = "Could not save group"
      end
     end 
  end
  

  

  
  def update
  end

  def destroy
  end

  private

    def group_params
      params.require(:group).permit(:name,:id)
    end


end
