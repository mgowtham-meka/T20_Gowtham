# frozen_string_literal: true

# def valid_email?(email)
#     (email =~ /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i)
#   end
#  valid_email?("gowthma@dispatch.com")

def validate_email(email)
  if email.match?('[a-z0-9]+[_a-z0-9\.-]*[a-z0-9]+@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})')
    true
  else
    false
  end
end
valid_email?('gowthma@dispatch.com')
