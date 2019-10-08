jQuery(document).on 'turbolinks:load', ->
  phones = $('#phones')

  phones.on 'cocoon:before-insert', (e, added_el) ->
  	added_el.fadeIn(1000)
  	# COMENTÁRIO: Cria pequena animação ao add um phone
 
  phones.on 'cocoon:after-insert', (e, added_el) ->
    added_el.find("input").first().focus();
    # COMENTÁRIO: Coloca o foco do cursor no primeiro input do novo objeto
 
  phones.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)
    # COMENTÁRIO: Cria pequena animação ao apagar um phone

    