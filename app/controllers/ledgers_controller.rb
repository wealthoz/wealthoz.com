class LedgersController < ApplicationController
  before_action :set_ledger, only: [:show, :edit, :update, :destroy]

  # GET /ledgers
  # GET /ledgers.json
  def index
    current_group = current_user.group
    #All User transactions.Have to implement all Group transaction
    @ledgers = current_group.ledgers
  end

  # GET /ledgers/1
  # GET /ledgers/1.json
  def show
    @ledger = Ledger.find(params[:id])
  end

  # GET /ledgers/new
  def new
   current_group = current_user.group
   # @accounts = Account.joins(:group,:fs).where('group_id = ? OR "default" = ?', current_group.id, true,)
   @accounts = current_group.accounts
   @wunit = {
              projects: current_group.projects.pluck(:name),
              people: current_group.users.pluck(:name)
            }
   @ledger = Ledger.new


  end

  # GET /ledgers/1/edit
  def edit
  end


  def create
    current_group = current_user.group

    params[:ledger].each do |attr|
      current_group.ledgers.create(attr)
    end

  respond_to do |format|
      # if @ledger.save
        format.html { redirect_to ledgers_path, notice: 'Transaction Y was successfully created.' }
        format.json { render action: 'index', status: :created, location: @ledger }
        format.js
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @ledger.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /ledgers/1
  # PATCH/PUT /ledgers/1.json
  def update
    respond_to do |format|
      if @ledger.update(ledger_params)
        format.html { redirect_to @ledger, notice: 'Ledger was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ledgers/1
  # DELETE /ledgers/1.json
  def destroy
    @ledger.destroy
    respond_to do |format|
      format.html { redirect_to ledgers_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def ledger_params
      params.require(:ledger).permit(:account_id, :group_id,:w, :post_date, :ammount, :text, :quantity, :wunit)
    end

    def set_ledger
      @ledger = Ledger.find(params[:id])
    end
end
