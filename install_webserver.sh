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
echo '<html>
<head>
<title>Andr&eacute Larsson</title>
</head>
<body>
<h1>Andr&eacute Larsson</h1>

<p>Congratulations, if you see this page, Apache2 is up and running!<p>

<p style="color:lightsalmon;background-color:darkslategray;padding: .5em;">Life is trying things to see if they work. -Ray Bradbury</p>
</body>
</html>' > /var/www/html/index.html

# start server
systemctl start apache2
