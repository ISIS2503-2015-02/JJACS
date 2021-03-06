class UsuariosController < ApplicationController
  before_action :set_usuario,  only: [:actualizar, :mostrar]
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios

  def index
    @users = User.all
    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: @users}
    end
  end

  def mostrar
    respond_to do |format|
      format.html #mostrar.html.erb
      format.json {render json: @user}
    end
  end

  def actualizar
    atributos = Hash.new

    atributos['admin'] = params[:admin]
    atributos['empleado_vcub'] = params[:empleado_vcub]
    atributos['conductor'] = params[:conductor]
    atributos['cliente'] = params[:cliente]

    if @user.update(atributos)
    end
  end


  def set_usuario
    @user=User.find(params[:id])
  end

  #Si el usuario no es un admin, le cierra la sesi�n y lo devuelve al home
  def autenticar_con_privilegios
    unless current_user.admin?
      sign_out current_user
      redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
    end
  end
end
