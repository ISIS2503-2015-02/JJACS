#encoding: utf-8
class EstacionesController < ApplicationController

  before_action :set_estacion, only: [:actualizar, :mostrar, :destruir, :registrar, :prestar]
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios


  def inicio
  end

  def index
    @estaciones = Estacion.all
  end

  def crear
    @estacion = Estacion.create(nombre: params[:nombre], capacidad: params[:capacidad])
  end

  def actualizar
  end

  def mostrar
    @numero_vcubs = @estacion.vcubs.size
  end

  def destruir
  end

  #Registra un vcub en la estación
  def registrar
    @mensaje = "Error, no se encontró un Vcub con id: #{params[:vcub_id]}"

    if EstacionesHelper.existe_vcub?(params[:vcub_id])
      @vcub = Vcub.find(params[:vcub_id])
      @mensaje = " Vcub #{params[:vcub_id]} registrado exitósamente"
      @vcub.estacion = @estacion
      @vcub.prestada = false
      @vcub.user = nil
      @vcub.save

    end

  end

  #Presta un vcub a un cliente. La bicicleta se desvincula de la estación
  def prestar
    @mensaje = "Error, no se encontró un Vcub con id: #{params[:vcub_id]}"

    if EstacionesHelper.existe_vcub_en_estacion?(params[:vcub_id], @estacion)
      @vcub = Vcub.find(params[:vcub_id])

      if EstacionesHelper.existe_usuario?(params[:cliente_id])
        @vcub.estacion = nil
        @vcub.prestada = true
        @vcub.user = User.find(params[:cliente_id])
        @mensaje = "Vcub #{params[:vcub_id]} prestada al cliente con id: #{params[:cliente_id]}"
        @vcub.save

        #Crea el registro del préstamo
        EstacionesHelper.registrar_prestamo(params[:vcub_id],params[:cliente_id])

      else
        @mensaje = "Error, no se encontró un cliente con id: #{params[:cliente_id]}"
      end
    end

  end

  private
    def set_estacion
      @estacion = Estacion.find(params[:id])
    end

    #Si el usuario no es un admin, le cierra la sesión y lo devuelve al home
    def autenticar_con_privilegios
      unless current_user.admin? || current_user.empleado_vcub?
        sign_out current_user
        redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
      end
    end
end
