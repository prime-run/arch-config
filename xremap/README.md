cp ./xremap.service /etc/systemd/system/

sudo cp ~/.config/xremap/config.yml /etc/xremap/config.yml

sudo systemctl daemon-reload

and then enable and start the service
