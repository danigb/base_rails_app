# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mywebsite_session',
  :secret      => '72c0c548498f3ef64c79856dba7230d35984edc4f0c9d4a7550d3a668e6d41aee88208894897e70fba24f6840785106d6eb30ea8a7c207ff7819e63df4000326'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

raise 'You NEED to run rake secret to generate a key for your sessions!!!!'