module BooksHelper
  def formatted_datetime(value)
  	date = value.strftime("%d/%m/%Y %H:%M")
  	date
  end
end
