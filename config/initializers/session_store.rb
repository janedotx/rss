# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rss_session',
  :secret      => '1cad6bb4824aa0f578a727da82ecdba5c36026a5a4a048520668fd0ff2a9d24dc0b48e7ed45358b7632051284600d170df0b76aba8c8f7c691639c3714725a61'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
