# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_notifyhub_session',
  :secret      => 'ea758c1249d5ff4d20bbe5b1d879dd56eed82abd506c84987b7f90d408e034f85eb0cca8c60e649f0320f2400036e054b0c78e4b061d25d51d29749440dff8b5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
