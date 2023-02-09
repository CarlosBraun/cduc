class ApplicationMailer < ActionMailer::Base.default_url_options
  default from: "contacto@voleyuc.com"
  layout "mailer"
end
