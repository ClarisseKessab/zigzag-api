class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def destroy
    if current_user
      sign_out current_user
      redirect_to root_path, notice: "Déconnexion réussie !"
    else
      redirect_to new_user_session_path, alert: "Aucune session active."
    end
  end
end
