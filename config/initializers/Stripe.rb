# Rails.configuration.stripe = { 
#   :publishable_key => ENV['pk_test_51NY6dASD4Fra99nqHAKIV6Ekta38GEohBrnWkGRso18xM6i7YuiP83YVNLlcqPQNw2RzEHaEgu49qmaTxhFaWW0u00dSb5EjzG'],
#   :secret_key => ENV['sk_test_51NY6dASD4Fra99nqy4Dkzj8sdjRe04MjCP7xxuPEVdhubpnoSYL7JkEy3EY0EIGZyuJ9wmj5EepSrUFM8QPJD8HJ00JSHpDuF7']
# } 
# Stripe.api_key = Rails.configuration.stripe[:secret_key]


Rails.configuration.stripe = {
  publishable_key: Rails.application.secrets.stripe_publishable_key,
  secret_key: Rails.application.secrets.stripe_secret_key
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]