class GroupsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :destroy]

  def create
    @group = group.users.create(group_params)
    if @group.save
      flash[:success] = "A new Wealth Group was Created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
  end

  def destroy
  end
  
  def show
    @groups = @groups.users(page: params[:page])
  end
  
  private

    def group_params
      params.require(:group).permit(:group_name)
    end
  
end

