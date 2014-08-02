class LedgersController < ApplicationController
  before_action :set_ledger, only: [:show, :edit, :update, :destroy]

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
#  @accounts = {
#                 Assets: current_group.accounts.where('fs_id = 1').pluck(:name),
#                 }
      
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
   #Balance Sheet accounts
    @accounts_bs = current_group.accounts.where('fs_id = 1 OR fs_id = 2 OR fs_id = 5')
    @accounts_bs_a = current_group.accounts.where('fs_id = 1')
    @accounts_bs_d = current_group.accounts.where('fs_id = 2')
    
   #Profit and loss accounts
    @accounts_pl = current_group.accounts.where('fs_id = 3 OR fs_id = 4')
    
    @ledgers = current_group.ledgers
   #Balance Sheet Transactions
    @ledgers_bs = @ledgers.joins(:account).where('fs_id = 1 OR fs_id = 2 OR fs_id = 5')    
   #Profit&Loss Transactions
    @ledgers_pl = @ledgers.joins(:account).where('fs_id = 3 OR fs_id = 4')
    
   #HAshes
    @ledgers_hash_bs = @ledgers_bs.group_by(&:wunit).sort_by {|k,v| k}.reverse.map do |k, v|
      [k, v.group_by(&:account_id)]
    end
     
    @ledgers_hash_pl = @ledgers_pl.group_by(&:wunit).sort_by {|k,v| k}.reverse.map do |k, v|
      [k, v.group_by(&:account_id)]
    end
    
    @ledgers_hash_pl_m = @ledgers_pl.group_by{ |m| m.post_date.beginning_of_month}.sort_by {|k,v| k}.map do |k, v|
      [k, v.group_by(&:account_id)]
    end  
   #Accounts
    @account_hash_bs = @ledgers_bs.group_by(&:account_id)
    @account_hash_pl = @ledgers_pl.group_by(&:account_id)

   #Charts
    #Draw Assets by WU
    @ledgers_bs_a = @ledgers.joins(:account).where('fs_id = 1')
    @ledgers_hash_bs_a = @ledgers_bs_a.group_by{ |item| item[:wunit] }    
    ledger_hash_a_summed = {}
    @ledgers_bs_a.each do |item|
    key = item[:wunit]
    ledger_hash_a_summed[key] = 0 unless ledger_hash_a_summed[key]  
    ledger_hash_a_summed[key] += item[:ammount]
    end
    
    #Draw Debt by WU
    @ledgers_bs_d = @ledgers.joins(:account).where('fs_id = 2')
    @ledgers_hash_bs_d = @ledgers_bs_d.group_by{ |item| item[:wunit] }    
    ledger_hash_d_summed = {}
    @ledgers_bs_d.each do |item|
    key = item[:wunit]
    ledger_hash_d_summed[key] = 0 unless ledger_hash_d_summed[key]  
    ledger_hash_d_summed[key] += item[:ammount]
    end                      
    
    graph_names = ledger_hash_a_summed.keys
    graph_assets =   ledger_hash_a_summed.values.as_json.map { |i| i.to_i } 
    graph_debt =   ledger_hash_d_summed.values.as_json.map { |i| i.to_i } 
    
   @chart_bs = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Assets',:data=> graph_assets )
      f.series(:name=>'Debt',:data=> graph_debt )     
      f.title({ :text=>"Balance Sheet by Wealth Units"})
      f.xAxis(:categories => graph_names)

      ## options for column
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"}})
    end

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
