class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :get_category
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  def get_category
    @categories = Category.all
  end
end
