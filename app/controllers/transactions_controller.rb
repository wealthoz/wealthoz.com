class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    
    3.times do
    ledger = @transaction.ledgers.build   
  end
    
    current_group = current_user.group
    @accounts = Account.joins(:group,:fs).where('group_id = ? OR "default" = ?', current_group.id, true,)
    
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    current_group = current_user.group
    @accounts = Account.joins(:group,:fs).where('group_id = ? OR "default" = ?', current_group.id, true,)
    @transaction = current_group.ledgers.build(transaction_params)

      if @transaction.save
      flash[:success] = "Transaction X created!"
      redirect_to root_url
    else
    flash[:success] = "Error"
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:group_id,:account_id, :group_id,:w, :post_date, :ammount, :text, :quantity, :wunit)
    end
end
