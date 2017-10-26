class ContactosController < ApplicationController
  def index
    @contactos = Contacto.all
  end

  def new
    @contacto = Contacto.new
  end

  def create
    @contacto = current_user.contactos.build(parametros_contacto)
    @contacto.operadora = params[:operadora]
    @contacto.user_id = current_user.id
    if @contacto.save
      flash[:success] = 'Contacto creado!'
      redirect_to contactos_path
    else
      render 'new'
    end
  end

  def show
#    @usuarios = User.all
    @contacto = Contacto.includes(:mensajes).find_by(id: params[:id])
    @mensaje = Mensaje.new
  end

  def ver
    @usuario = User.find(params[:id])
    
    puts '-----------------ver--------------------------'
    puts @usuario.inspect

    puts '-----------------ver--------------------------'
   # redirect_to contactos_path
  end

  private

  def parametros_contacto
    params.require(:contacto).permit(:operadora, :numero, :nombre)
  end
end