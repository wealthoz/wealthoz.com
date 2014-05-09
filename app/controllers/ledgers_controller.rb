class LedgersController < ApplicationController
  before_action :set_ledger, only: [:show, :edit, :update, :destroy]

  # GET /ledgers
  # GET /ledgers.json
  def index
    @ledgers = Ledger.all
  end

  # GET /ledgers/1
  # GET /ledgers/1.json
  def show
    
  end

  # GET /ledgers/new
  def new
    
    @ledger = Ledger.new
  end

  # GET /ledgers/1/edit
  def edit
  end

  # POST /ledgers
  # POST /ledgers.json
 
  
  def create
    #@selected_account = Account.where('user_id = ? OR "default" = ?', current_user.id, true)
    #@selected_account = account
    
    @ledger = account.ledgers.create(ledger_params)
        if @ledger.save
      flash[:success] = "Transaction was created!"
      redirect_to ledgers_path
    else
      render 'static_pages/home'
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
    def set_ledger
      @ledger = Ledger.find(params[:id])
    end
    
    def correct_account
       @account = Account.find(params[:id ])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ledger_params
      params.require(:ledger).permit(:account_id, :wunit_id, :post_date, :ammount, :text, :quantity)
    end
end
