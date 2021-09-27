#!/bin/bash

# check if root
if(( $EUID!=0)); then
    echo "Script must be run as root. Exiting..."
    exit
fi

# install apache
apt update -y
apt install apache2 -y

# change default website
echo "<html>
<head>
<title>Andr&eacute Larsson</title>
</head>
<body>
<h1>Andr&eacute Larsson</h1>
</body>
</html>" > /var/www/html/index.html

# start server
systemctl start apache2
