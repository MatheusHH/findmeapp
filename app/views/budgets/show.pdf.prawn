prawn_document(filename: "budget.pdf") do |pdf|

  
  pdf.text "Orçamento", :size => 20, :style => :bold, :align => :center
  pdf.move_down 40
	

  pdf.text "Cliente: #{@budget.customer.name}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "CPF: #{@budget.customer.cpf}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "CEP: #{@budget.customer.address.cep}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Rua: #{@budget.customer.address.street}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Bairro: #{@budget.customer.address.neighborhood}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Cidade: #{@budget.customer.address.city}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Estado: #{@budget.customer.address.state}", :size => 12, :align => :left
  pdf.move_down 10

  pdf.text "Email: #{@budget.customer.address.email}", :size => 12, :align => :left
  pdf.move_down 40
  

  pdf.text "Serviços solilitados", :size => 20, :style => :bold, :align => :center
  pdf.move_down 20

  header = ["Serviço", "Descrição", "Valor"]
  table_data = []
  table_data << header
  @budget.budget_services.map do |budget|
    table_data << [budget.service.name, budget.service.description, budget.service.price.to_s]
  end
 
  pdf.table(table_data) do |t|
    t.row(0).background_color = 'ffffff'
    t.position = :center
    t.column_widths = [130, 300, 70]
    t.row_colors = ["F0F0F0", "FFFFCC"]
  end
  pdf.move_down 20

  total = 0
  @budget.budget_services.each do |budget|
  	total += budget.service.price.to_f
  end

  pdf.text "Total dos serviços: #{humanized_money_with_symbol(total)}", :align => :center, :size => 15
  pdf.move_down 50
  
  pdf.text "-----------------------------------------------------", :align => :center

  pdf.text "Assinatura", :align => :center, :size => 12

  pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page> of <total>", :at => [pdf.bounds.right - 150, 0],
 	:width => 150,
 	:align => :right,
 	:page_filter => :all,
 	:start_count_at => 0

end
