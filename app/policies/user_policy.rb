class UserPolicy
  def initialize(user)
    @user = user
  end

  
  def admin?
    user_role_is_admin?
  end

  def name_blank?
    user_name_blank?
  end

  private

  attr_reader :user


  def user_role_is_admin?
    user&.role == 'admin'
  end

  def user_name_blank?
    user&.safe_name.blank?
  end
end
