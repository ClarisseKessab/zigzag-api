class Admin::BarsController < ApplicationController
  before_action :authenticate_user! # Vérifie que l'utilisateur est connecté
  before_action :authenticate_admin! # Vérifie que c'est un admin

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.created_by = current_user.id # L'admin qui crée le bar
    if @bar.save
      redirect_to admin_bars_path, notice: "Bar ajouté avec succès"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    if @bar.update(bar_params)
      redirect_to admin_bars_path, notice: "Bar mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to admin_bars_path, alert: "Bar supprimé"
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :description, :address, :latitude, :longitude, :image_url, :phone, :website)
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user&.admin?
  end
end
