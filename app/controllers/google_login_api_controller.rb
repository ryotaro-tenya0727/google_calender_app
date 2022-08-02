class GoogleLoginApiController < ApplicationController
  def callback
    key_source = Google::Auth::IDTokens::JwkHttpKeySource.new("https://www.googleapis.com/oauth2/v3/certs")
    Google::Auth::IDTokens::Verifier.new(key_source: key_source).verify(params[:credential], aud: ENV['GOOGLEAUTH_ID'])
    redirect_back_or_to root_path
  end
end
