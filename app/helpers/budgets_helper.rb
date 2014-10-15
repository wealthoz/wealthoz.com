module BudgetsHelper
  def wealth_assets_text(wealth_asset)
    if wealth_asset > 30
      alert_info 'Text A'
    elsif wealth_asset < 30 && wealth_asset > 10
      alert_info 'text B'
    elsif wealth_asset < 10 && wealth_asset > 0
      alert_info 'text C'
    elsif wealth_asset < 0
      alert_info 'text D'
    end
  end

  def margin_text(margin)
    if margin > 30
      alert_info 'Text A'
    elsif margin < 30 && margin > 10
      alert_info 'text B'
    elsif margin < 10 && margin > 0
      alert_info 'text C'
    elsif margin < 0
      alert_info 'text D'
    end
  end

  def alert_info(text)
    content_tag(:div, class: 'alert alert-info') do
      text
    end
  end
end
