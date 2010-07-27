# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crowd_rails_test_session',
  :secret      => 'f8feedd3f5a0a6cd8054b756225a9aa12f179bba2ae3ecb3731bc9d42c30e1acc3d1dbed6c6fce3451b4cb27a2952b9f0c786b316bcdebdb76b3bb3f2ec2152e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
