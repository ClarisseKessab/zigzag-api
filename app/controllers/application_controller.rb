class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Accès refusé. Vous n'avez pas les permissions nécessaires."
    end
  end
end
