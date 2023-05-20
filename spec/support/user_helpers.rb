module UserHelpers
  def confirm_and_sigin(user)
    user_payload = {
      user: {
        login: user.email,
        password: user.password
      }
    }
    get user_confirmation_path(confirmation_token: user.confirmation_token)
    post user_session_path, params: user_payload
  end

  def confirm_user_by_token(confirmation_token)
    get user_confirmation_path(confirmation_token: confirmation_token)
  end

  def get_jwt
    response.headers['Authorization'].split(' ').last
  end
end
