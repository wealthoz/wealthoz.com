class BudgetsController < ApplicationController
  #before_action :set_budget, only: [:show, :edit, :update, :destroy]

 
  def index
    current_group = current_user.group
    @budgets = current_group.budgets
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    current_group = current_user.group
   @accounts = current_group.accounts
#  @accounts = {
#                 Assets: current_group.accounts.where('fs_id = 1').pluck(:name),
#                 }
      
   @wunit = {
              Projects: current_group.projects.pluck(:name),
              People: current_group.users.pluck(:name)
            }
   @budget = Budget.new
  end

  
  def edit
    current_group = current_user.group
    @accounts = current_group.accounts

  end

  def create
    current_group = current_user.group

    params[:budget].each do |attr|
      current_group.budgets.create(attr)
    end

  respond_to do |format|
     
        format.html { redirect_to budgets_path, notice: 'Budget was successfully created.' }
        format.json { render action: 'index', status: :created, location: @budget }
        format.js
    end
   end

 
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:account_id, :group_id, :budget_date, :ammount, :text, :wunit)
    end
end
