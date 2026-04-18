#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x

apt-get update -y
apt-get install -y nginx curl

systemctl enable nginx
systemctl start nginx

# ------------------------------------------------
# 1. Fetch HTML from GitHub (cache-busting version)
# ------------------------------------------------

curl -s -o /var/www/html/index.html \
"https://raw.githubusercontent.com/harmlesspanda/PandaLearnsTerraform/main/aws-ec2/index.html?cachebust=$(date +%s)"

# ------------------------------------------------
# 2. Add cron job to update every 5 minutes
# ------------------------------------------------

cat << 'EOF' > /etc/cron.d/update-html
*/5 * * * * root curl -s -o /var/www/html/index.html https://raw.githubusercontent.com/harmlesspanda/PandaLearnsTerraform/main/aws-ec2/index.html
EOF

chmod 644 /etc/cron.d/update-html
systemctl restart cron || systemctl restart crond

# ------------------------------------------------
# Restart nginx
# ------------------------------------------------

systemctl restart nginx
