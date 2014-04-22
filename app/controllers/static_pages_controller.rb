class StaticPagesController < ApplicationController
  
  def home
    @micropost = current_user.microposts.build if signed_in?
    
  end

  def why
  end
   

  def how
      data_table = GoogleVisualr::DataTable.new
      data_table.new_column('string'  , 'Label')
      data_table.new_column('number'  , 'Value')
      data_table.add_rows(3)
      data_table.set_cell(0, 0, 'Leverage' )
      data_table.set_cell(0, 1, 80)
      data_table.set_cell(1, 0, 'ROI')
      data_table.set_cell(1, 1, 55)
      data_table.set_cell(2, 0, 'Savings')
      data_table.set_cell(2, 1, 68)
     
      opts   = { :width => 800, :height => 240, :redFrom => 80, :redTo => 100, :yellowFrom => 50, :yellowTo => 80, :minorTicks => 5 }
      @chart = GoogleVisualr::Interactive::Gauge.new(data_table, opts)
        
        
  end
  
  def manage_groups
   
  end        
   
end
