#!/bin/bash
install_node_exporter() {
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-arm64.tar.gz
tar xvfz node_exporter-1.6.1.linux-arm64.tar.gz
rm -r node_exporter-1.6.1.linux-arm64.tar.gz
mv node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/
#create a system user for node expo
sudo useradd -rs /bin/false node_exporter
#create a systemd service
cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
Type=simple
User=node_exporter
Group=node_exporter
ExecStart=/usr/local/bin/node_exporter

SyslogIdentifier=node_exporter
Restart=always

PrivateTmp=yes
ProtectHome=yes
NoNewPrivileges=yes

ProtectSystem=strict
ProtectControlGroups=true
ProtectKernelModules=true
ProtectKernelTunables=yes

[Install]
WantedBy=multi-user.target
EOF

# reload system and start node service
sudo systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
}

#show the status 
show_node_exporter_status()
{
sudo systemctl status node_exporter
}
install_node_exporter

show_node_exporter_status


