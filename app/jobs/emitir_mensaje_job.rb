class EmitirMensajeJob < ApplicationJob
  queue_as :default

  def perform(mensaje)
    ActionCable.server.broadcast "contactos_#{mensaje.contacto.id}_channel",
                                 mensaje: render_mensaje(mensaje)
  end

  private

  def render_mensaje(mensaje)
    MensajesController.render partial: 'mensajes/mensaje', locals: {mensaje: mensaje}
  end
end