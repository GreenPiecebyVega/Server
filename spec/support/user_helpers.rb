module UserHelpers
  def confirm_and_sign_user(user, user_payload)
    get user_confirmation_path(confirmation_token: user.confirmation_token)
    post user_session_path, params: user_payload
  end

  def confirm_user_email(user_confirmation)
    get user_confirmation_path(confirmation_token: user_confirmation)
  end

  def user_request(url, _jti, method)
    case method
    when :post
      post url, headers: { 'Authorization': jwt }
    when :get
      get url, headers: { 'Authorization': jwt }
    end
  end

  def get_jwt
    response.headers['Authorization'].split(' ').last
  end
end
