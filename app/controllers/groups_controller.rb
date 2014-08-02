class GroupsController < ApplicationController
  before_action :signed_in_user

  def edit
    @group = Group.find(params[:id])
  end
  
  def show
     @groups = Groups.all.by_name
  end

  
    
  def new
      @group = Group.new
      
  end
    
  
    def create
      @group = Group.new(group_params)
      if @group.save
        flash[:success] = "A New Wealth GROUP was created!"
        redirect_to current_user
      else
          render 'groups/new'
      end
     end 
  

  
  def update
  end

  def destroy
  end
  
  def correct_group
      @group = Group.find(params[:id])
      redirect_to(root_url) unless current_group?(@group)
  end


  private

    def group_params
      params.require(:group).permit(:name,:id, :fx_id)
    end




end
