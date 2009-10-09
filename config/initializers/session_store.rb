# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_powerhack_session',
  :secret      => '98aa4e46fd1610905caceca5666a7914fa2f69a663a06eded3937ca39a013f45de31382cb8a3f3e246e338f842e93306d26fc995c456c37a059f066730ac16d4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
