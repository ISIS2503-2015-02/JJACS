#encoding: utf-8
class MobibusesController < ApplicationController
  before_action :set_mobibus, only: [:actualizar, :mostrar, :destruir]
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios

  def crear
    @mobibus = Mobibus.create(estado:-1, placa: params[:placa], longitud: 0.0, latitud: 0.0,kilometer_desde_revision:0)
    respond_to do |format|
      if @mobibus.save
        format.html { redirect_to :mobibuses}
        format.json { render json: @mobibus }
      else
        format.html { render :crear }
        format.json { render json: @mobibus.errors, status: :unprocessable_entity }
      end
    end

  end

  def actualizar

    respond_to do |format|
      atributos = Hash.new

      if params[:placa] != nil
        atributos['placa'] = params[:placa]
      end

      if params[:latitud] != nil
        atributos['latitud'] = params[:latitud]
      end

      if params[:longitud] != nil
        atributos['longitud'] = params[:longitud]
      end

      if params[:estado] != nil
        atributos['estado'] = params[:estado]
      end

      if params[:id_conductor] != nil
        atributos['id_conductor'] = params[:idConductor]
      end

      if params[:kilometer_desde_revision] != nil
        atributos['kilometer_desde_revision'] = params[:kilometer_desde_revision]
      end

      #if @conductor.update(nombre: params[:nombre],cedula: params[:cedula],  puntaje: params[:puntaje])
      if @mobibus.update(atributos)

        format.html { redirect_to action: 'index', status: 303}
        format.json { render json: @mobibus}
      else
        format.html { render :actualizar }
        format.json { render json: @mobibus.errors, status: :unprocessable_entity }
      end
    end
  end

  def destruir
    @mobibus.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', status: 303}
      format.json { render json: @mobibus}
    end
  end

  def index
    @mobibuses= Mobibus.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mobibuses }
    end
  end

  def mostrar
    # take(int) devuelve un número determinado de resultados. Sin parámetros devuelve un solo resultado.
    @conductor= User.where("mobibus_id = ?",@mobibus.id).take

    respond_to do |format|
      format.html # mostrar.html.erb
      format.json { render json: @mobibus }
    end
  end



  def set_mobibus
    @mobibus= Mobibus.find(params[:id])
  end
  
  #Si el usuario no es un admin, le cierra la sesión y lo devuelve al home
  def autenticar_con_privilegios
    unless current_user.admin?
      sign_out current_user
      redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
    end
  end
end
