#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Welcome to My Server</title>

  <style>
    body {
      margin: 0;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      color: #ffffff;
      background: radial-gradient(circle at top, #1b2735, #090a0f);
      overflow: hidden;
    }

    .container {
      text-align: center;
      padding: 40px;
      border-radius: 16px;
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(12px);
      box-shadow: 0 0 40px rgba(0, 200, 255, 0.15);
      animation: float 6s ease-in-out infinite;
    }

    h1 {
      font-size: 3rem;
      margin-bottom: 10px;
      background: linear-gradient(90deg, #00c6ff, #0072ff);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    p {
      font-size: 1.2rem;
      opacity: 0.85;
    }

    .badge {
      margin-top: 20px;
      display: inline-block;
      padding: 8px 14px;
      border-radius: 999px;
      background: rgba(0, 198, 255, 0.15);
      border: 1px solid rgba(0, 198, 255, 0.4);
      font-size: 0.9rem;
      letter-spacing: 1px;
    }

    .glow {
      position: absolute;
      width: 400px;
      height: 400px;
      background: radial-gradient(circle, rgba(0,198,255,0.25), transparent 70%);
      filter: blur(40px);
      animation: drift 10s infinite alternate;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px); }
      50% { transform: translateY(-10px); }
    }

    @keyframes drift {
      0% { transform: translate(-20%, -20%); }
      100% { transform: translate(20%, 20%); }
    }

    footer {
      position: absolute;
      bottom: 20px;
      font-size: 0.8rem;
      opacity: 0.5;
    }
  </style>
</head>

<body>
  <div class="glow"></div>

  <div class="container">
    <h1>🚀 Server Online</h1>
    <p>Your Nginx instance is running smoothly and serving content like a digital lighthouse in the cloud.</p>
    <div class="badge">STATUS: OK • DEPLOYED • READY</div>
  </div>

  <footer>
    Powered by Nginx • Crafted for EC2 • ✨ Welcome to your infrastructure ✨
  </footer>
</body>
</html>
EOF

systemctl restart nginx