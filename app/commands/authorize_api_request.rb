class AuthorizeApiRequest
  prepend SimpleCommand
  attr_reader :token

  def initialize(headers)
    @token = headers['HTTP_AUTH_TOKEN']
  end

  def call
    user
  end

  private

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebTokenService.decode(http_auth_token)
  end

  def http_auth_token
    if token.present?
      return token
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end
