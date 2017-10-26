class RecibirController < ApplicationController

# before_action :authenticate_user!

  def sms
    if request.get? && params[:telefono]
      if params[:telefono]
        area  = params[:telefono][0,4].to_i
        tlf   = params[:telefono][4,10].to_i
        sms   = params[:mensaje]
        u_id  = current_user.id
        contacto = Contacto.find_by(operadora: area, numero: tlf, user_id: u_id)
        contacto = Contacto.create ({"user_id" => u_id, "operadora" => area, "numero" => tlf, "nombre" => "UsuarioNuevo#{Time.now.strftime("%j%L")}"}) if !contacto
        Mensaje.create ({"texto" => sms, "user_id" => u_id, "contacto_id" => contacto.id})
      end
    end
  end
end
