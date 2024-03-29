# frozen_string_literal: true

Rails.application.configure do
  config.google_sign_in.client_id = ENV['google_sign_in_client_id']
  config.google_sign_in.client_secret = ENV['google_sign_in_client_secret']
  config.google_sign_in.root = 'my_own/google_sign_in_route'
end
