class User < ApplicationRecord
  # Modules Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Définition des rôles
  enum role: { user: 0, admin: 1 }

  # Attribution du rôle par défaut après l'initialisation
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end

