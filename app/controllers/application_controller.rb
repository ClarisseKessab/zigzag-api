class ApplicationController < ActionController::API
    before_action :authenticate_user!

    private

    def authenticate_admin!
      redirect_to(root_path, alert: "Accès réservé aux administrateurs.") unless current_user&.admin?
    end
end
