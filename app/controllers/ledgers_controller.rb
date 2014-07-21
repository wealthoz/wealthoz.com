class LedgersController < ApplicationController
  # before_action :set_ledger, only: [:show, :edit, :update, :destroy]

  # GET /ledgers
  # GET /ledgers.json
  def index
    current_group = current_user.group
    #All Group transaction
    @ledgers = current_group.ledgers
  end

  def show
    @ledger = Ledger.find(params[:id])
  end

  def new
   current_group = current_user.group
   @accounts = current_group.accounts

   @wunit = {
              Projects: current_group.projects.pluck(:name),
              People: current_group.users.pluck(:name)
            }
   @ledger = Ledger.new


  end

  # GET /ledgers/1/edit
  def edit
    current_group = current_user.group
    @accounts = current_group.accounts
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
        format.html { redirect_to ledgers_url , notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ledger.destroy
    respond_to do |format|
      format.html { redirect_to ledgers_url }
      format.json { head :no_content }
    end
  end


  def report
    current_group = current_user.group
    @accounts = current_group.accounts
    @ledgers = current_group.ledgers

    @ledgers_hash = @ledgers.group_by(&:wunit).sort_by {|k,v| k}.reverse.map do |k, v|
      [k, v.group_by(&:account_id)]
    end.to_h

    @account_hash = @ledgers.group_by(&:account_id)

  end


  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def ledger_params
      params.require(:ledger).permit(:account_id, :group_id, :post_date, :ammount, :text, :quantity, :wunit)
    end

    def set_ledger
      @ledger = Ledger.find(params[:id])
    end
end
