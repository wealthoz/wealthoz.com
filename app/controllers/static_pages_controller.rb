class StaticPagesController < ApplicationController
  
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
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
  
  def demo1
    
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Month')
    data_table.new_column('number', 'Food')
    data_table.new_column('number', 'Transport')
    data_table.new_column('number', 'Other')
    
    data_table.add_rows(12)
    data_table.set_cell(0, 0, 'Jan')
    data_table.set_cell(0, 1, 1000)
    data_table.set_cell(0, 2, 400)
    data_table.set_cell(0, 3, 300)
    data_table.set_cell(1, 0, 'Feb')
    data_table.set_cell(1, 1, 1170)
    data_table.set_cell(1, 2, 460)
    data_table.set_cell(1, 3, 300)
    data_table.set_cell(2, 0, 'Mar')
    data_table.set_cell(2, 1, 660)
    data_table.set_cell(2, 2, 1120)
    data_table.set_cell(2, 3, 300)
    data_table.set_cell(3, 0, 'Apr')
    data_table.set_cell(3, 1, 1030)
    data_table.set_cell(3, 2, 540)
    data_table.set_cell(3, 3, 300)
    data_table.set_cell(4, 0, 'May')
    data_table.set_cell(4, 1, 700)
    data_table.set_cell(4, 2, 840)
    data_table.set_cell(4, 3, 300)
    data_table.set_cell(5, 0, 'Jun')
    data_table.set_cell(5, 1, 1030)
    data_table.set_cell(5, 2, 240)
    data_table.set_cell(5, 3, 300)
    data_table.set_cell(6, 0, 'Jul')
    data_table.set_cell(6, 1, 330)
    data_table.set_cell(6, 2, 1140)
    data_table.set_cell(6, 3, 300)
    data_table.set_cell(7, 0, 'Aug')
    data_table.set_cell(7, 1, 1030)
    data_table.set_cell(7, 2, 540)
    data_table.set_cell(7, 3, 300)
    data_table.set_cell(8, 0, 'Sep')
    data_table.set_cell(8, 1, 830)
    data_table.set_cell(8, 2, 140)
    data_table.set_cell(8, 3, 300)
    data_table.set_cell(9, 0, 'Oct')
    data_table.set_cell(9, 1, 730)
    data_table.set_cell(9, 2, 940)
    data_table.set_cell(9, 3, 300)
    data_table.set_cell(10, 0, 'Nov')
    data_table.set_cell(10, 1, 1030)
    data_table.set_cell(10, 2, 540)
    data_table.set_cell(10, 3, 300)
    data_table.set_cell(11, 0, 'Dec')
    data_table.set_cell(11, 1, 230)
    data_table.set_cell(11, 2, 840)
    data_table.set_cell(11, 3, 300)
    
    opts   = { :width => 800, :height => 500, :title => 'Total Expenses by Month', vAxis: {title: 'Month', titleTextStyle: {color: 'green'}} }
    @chart1 = GoogleVisualr::Interactive::BarChart.new(data_table, opts)

    
 end
  
  def demo2
  end
  
  def demo3
    
  end

  def demo4
    
  end

  def demo5
    
  end 
end
