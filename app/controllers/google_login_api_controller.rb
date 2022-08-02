class GoogleLoginApiController < ApplicationController
  protect_from_forgery except: :callback

  def callback
    key_source = Google::Auth::IDTokens::JwkHttpKeySource.new("https://www.googleapis.com/oauth2/v3/certs")
    user_data = Google::Auth::IDTokens::Verifier.new(key_source: key_source).verify(params[:credential], aud: ENV['GOOGLEAUTH_ID'])
    p user_data["sub"]
    redirect_to root_path
  end
end
