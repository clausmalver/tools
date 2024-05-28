#!/bin/bash

# Update package list and install auditd
sudo apt update
sudo apt install -y auditd audispd-plugins

# Configure auditd to log SSH events
echo "-w /var/log/auth.log -p wa -k authlog" | sudo tee /etc/audit/rules.d/audit.rules

# Restart auditd to apply changes
sudo systemctl restart auditd

# Create the show_ssh_logins.sh script
cat << 'EOF' | sudo tee /usr/local/bin/show_ssh_logins.sh
#!/bin/bash
echo "Last 10 SSH login attempts (Accepted and Denied):"
grep "sshd" /var/log/auth.log | grep -E "Accepted|Failed" | tail -n 10 | awk '
/Accepted/ {
    split($1, date, "T")
    split(date[2], time, "+")
    print "Date: " date[1] " at " time[1] "\nStatus: Accepted\nUser: " $9 "\nIP Address: " $11 "\nPort: " $13 "\n"
}
/Failed/ {
    split($1, date, "T")
    split(date[2], time, "+")
    print "Date: " date[1] " at " time[1] "\nStatus: Denied\nUser: " $9 "\nIP Address: " $11 "\nPort: " $13 "\n"
}'
EOF

# Make the script executable
sudo chmod +x /usr/local/bin/show_ssh_logins.sh

# Add the script to the user's profile to run at login
echo "/usr/local/bin/show_ssh_logins.sh" >> ~/.bashrc

echo "Setup complete. The last 10 SSH login attempts will be displayed upon login."
