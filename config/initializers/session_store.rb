# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_boxer_session',
  :secret      => '624ce0996e02e51723b96baa69032e34a0f3b4dd675318519acaf1dc8cf0e2f634237c22320b10d1d488cbbe57b23aacb54538e9f68645048b11bcabaee1d08e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
