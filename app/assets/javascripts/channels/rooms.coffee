jQuery(document).on 'turbolinks:load', ->
  mensajes = $('#mensajes')
  if $('#mensajes').length > 0
    mensajes_to_bottom = -> mensajes.scrollTop(mensajes.prop("scrollHeight"))

    mensajes_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "ContactosChannel"
        contacto_id: mensajes.data('contacto-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        mensajes.append data['mensaje']
        mensajes_to_bottom()

      send_mensaje: (mensaje, contacto_id) ->
        @perform 'send_mensaje', mensaje: mensaje, contacto_id: contacto_id


    $('#new_mensaje').submit (e) ->
      $this = $(this)
      textarea = $this.find('#mensaje_texto')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_mensaje textarea.val(), mensajes.data('contacto-id')
        textarea.val('')
      e.preventDefault()
      return false