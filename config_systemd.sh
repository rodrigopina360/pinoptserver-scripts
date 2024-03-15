#!/bin/bash

printf "Adding service to systemd system services\n"

sudo ln -r -s pinoptserver.service /etc/systemd/system/pinoptserver.service
sudo systemctl enable pinoptserver.service

printf "Service added successfully!\n"
