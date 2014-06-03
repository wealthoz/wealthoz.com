class LedgersController < ApplicationController
  before_action :set_ledger, only: [:show, :edit, :update, :destroy]

  # GET /ledgers
  # GET /ledgers.json
  def index
    #All User transactions.Have to implement all Group transaction
    @ledgers = current_user.ledgers.all
  end

  # GET /ledgers/1
  # GET /ledgers/1.json
  def show
    @ledger = Ledger.find(params[:id])
  end

  # GET /ledgers/new
  def new
    
    @ledger = Ledger.new
  end

  # GET /ledgers/1/edit
  def edit
  end

 
  def create
    
    @ledger = current_user.ledgers.build(ledger_params)

    if @ledger.save
      flash[:success] = "Transaction was created!"
      redirect_to ledgers_path
    else
      render :new
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
      params.require(:ledger).permit(:account_id, :wunit,:user_id, :post_date, :ammount, :text, :quantity)
    end
    def correct_user
      @ledger = current_user.ledgers.find_by(id: params[:id])
      redirect_to root_url if @ledger.nil?
    end

end
