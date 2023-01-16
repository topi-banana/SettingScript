echo "*/1 * * * * root cd /var/www && git pull origin main" | sudo tee /etc/cron.d/main
sudo service cron restart
