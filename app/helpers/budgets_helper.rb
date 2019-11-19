module BudgetsHelper
  def formatted_date(value)
  	date = value.strftime("%d/%m/%Y")
  	date
  end
end
