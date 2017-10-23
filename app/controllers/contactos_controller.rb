class ContactosController < ApplicationController
  def index
    @contactos = Contacto.all
  end

  def new
    @contacto = Contacto.new
  end

  def create
    @contacto = current_user.contactos.build(parametros_contacto)
    if @contacto.save
      flash[:success] = 'Chat room added!'
      redirect_to contactos_path
    else
      render 'new'
    end
  end

  def show
    @usuarios = User.all
    @contacto = Contacto.includes(:messages).find_by(id: params[:id])
    @message = Message.new
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
    params.require(:contacto).permit(:title)
  end
end