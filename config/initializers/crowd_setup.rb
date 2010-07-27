require 'crowd'

Crowd.crowd_url = 'http://127.0.0.1:8095/crowd/services/SecurityServer'
Crowd.crowd_app_name = 'soaptest'
Crowd.crowd_app_pword = 'soaptest'
Crowd.crowd_validation_factors_need_user_agent = false  # false for Crowd 2.0.5, true for Crowd 2.0.2
Crowd.crowd_session_validationinterval = 0  # Set > 0 for authentication caching.
