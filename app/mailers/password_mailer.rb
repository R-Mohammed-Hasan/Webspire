# frozen_string_literal: true

class PasswordMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # params[:user] comes from with() method in users controller
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 2.minutes)

    mail(to: params[:user].email, subject: "Webspire - Password Reset")
  end
end
