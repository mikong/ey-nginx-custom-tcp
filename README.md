# Nginx Custom Configuration

This cookbook will add /etc/nginx/servers/app_name/custom.tcp_conf to redirect all http requests to https.

# Using it

1. Set your application name in recipes/default.rb.
2. Add any other custom Nginx configuration in files/default/custom.tcp_conf.
3. Add this directory to your cookbooks directory.
4. Upload and apply this to your staging environment for testing:
