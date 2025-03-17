class BarsController < ApplicationController
  before_action :authenticate_user!, only: [:show] # Optionnel : pour restreindre l’accès aux utilisateurs connectés

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
  end
end
