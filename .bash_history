wpd
pwd
mkdir mini project
cd mini project
ls
cd/ mini project
cd /mini project
mkdir mini-project
ls
cd /mini-project
cd mini-project
apt install -y wget git apache2 curl
sudo apt install -y wget git apache2 curl
sudo apt install lsb-release apt-trasport-https://pa
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "db https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
apt install php libapache2-mod-php php8.1
sudo apt install php libapache2-mod-php php8.1
php -v
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list~
sudo apt update
apt -y install lsb-release apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo apt -y install lsb-release apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo apt -y install lsb-release apt-transport-https ca-certificates
cd..
cd ~
pwd
sudo apt update
cd /etc/apt/sources.list.d/php.list
nano /etc/apt/sources.list.d/php.list
sudo apt update
nano /etc/apt/sources.list.d/php.list
sudo nano /etc/apt/sources.list.d/php.list
sudo apt update
apt install php libapache2-mod-php php8.1-mysql php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl -y
sudo apt install php libapache2-mod-php php8.1-mysql php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl -y
cd /var/www/html
cd ~
cd mini-project
cd /var/www/html
sudo git clone https://github.com/michaelagbiaowei/laravel-realword-example-app.git
git config --global user.name "your_github_username"
git config --global user.name "onadeko-41"
git config --global user.email "hornadekor@gmail.com"
git config -l
sudo git clone https://github.com/michaelagbiaowei/laravel-realword-example-app.git
sudo git clone https://github.com/onadeko-41/laravel-realword-example-app.git
git config -l
sudo git clone https://github.com/michaelagbiaowei/laravel-realword-example-app.git
git clone https://github.com/f1amy/laravel-realworld-example-app.git
sudo git clone https://github.com/f1amy/laravel-realworld-example-app.git
cd laravel-realworld-example-app
ls
$ echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main"      | sudo tee /etc/apt/sources.list.d/sury-php.list
$ echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main"\ | sudo tee /etc/apt/sources.list.d/sury-php.list
sudo apt install gnupg gnupg2
sudo apt update && sudo apt upgrade -y
sudo apt-get install php8.1 libapache2-mod-php php8.1-dev php8.1-zip php8.1-curl php8.1-mbstring php8.1-mysql php8.1-gd php8.1-xml
cd ~
sudo apt-get install php8.1 libapache2-mod-php php8.1-dev php8.1-zip php8.1-curl php8.1-mbstring php8.1-mysql php8.1-gd php8.1-xml
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
php -v
sudo apt install wget -y
wget https://dev.mysql.com/get/mysql-apt-config_0.8.20-1_all.deb
udo apt install ./mysql-apt-config_*_all.deb
sudo apt install ./mysql-apt-config_*_all.deb
sudo apt update && sudo apt upgrade
sudo apt update
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 467B942D3A79BD29
sudo apt install ./mysql-apt-config_*_all.deb
sudo apt update && sudo apt upgrade
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 467B942D3A79BD29
onadeko
sudo apt update && sudo apt upgrade -y
mysql --version
sudo apt install mysql-server
mysql --version
sudo systemctl enable --now mysql
sudo systemctl status mysql
sudo mysql_secure_installation
sudo nano /etc/apache2/sites-available/laravel.conf
sudo a2enmod rewrite
sudo a2ensite laravel.conf
sudo systemctl restart apache2
sudo nano /etc/php/8.1/apache2/php.in
sudo systemctl restart apache2
sudo nano /etc/php/8.1/apache2/php.in
systemctl reload apache2
sudo systemctl reload apache2
sudo nano /etc/php/8.1/apache2/php.in
sudo a2enmod rewrite
sudo a2ensite laravel.conf
sudo nano /etc/php/8.1/apache2/php.in
sudo systemctl restart apache2
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer
sudo curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
sudo curl -sS https://getcomposer.org/installer | php
cd mini-project
sudo composer install --no-dev
cd ~
cd /var/www/html
cd laravel-realworld-example-app
sudo composer install --no-dev
sudo chown -R :www-data /var/www/html/laravel-realworld-example-app
chmod -R 775 /var/www/html/laravel-realworld-example-app
sudo chmod -R 775 /var/www/html/laravel-realworld-example-app
sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/storage
sudo chmod -R 775 /var/www/html/laravel-realworld-example-app/bootstrap/cache
sudo cp .env.example .env
sudo php artisan key:generate
mysql -u root -p
sudo nano .env
sudo nano routes/web.php
sudo php artisan config:cache
sudo a2dissite 000-default.conf
sudo rm /etc/apache2/sites-available/000-default.conf
sudo a2ensite laravel.conf
sudo systemctl status apache2
sudo nano .env
sudo php artisan migrate
sudo nano .env
sudo php artisan migrate
sudo nano .env
sudo php artisan migrate
sudo php artisan config:cache
sudo a2dissite 000-default.conf
sudo a2ensite laravel.conf
sudo php artisan migrate
yes
sudo nano .env
sudo nano routes/web.php
cd /var/www/html
cd laravel-realworld-example-app
sudo systemctl status apache2
sudo php artisan migrate
sudo nano /etc/php/8.1/apache2/php.ini
sudo nano /etc/apache2/sites-available/laravel.conf
sudo nano /etc/php/8.1/apache2/php.ini
sudo php artisan migrate
composer
sudo nano .env
sudo php artisan migrate
sudo nano .env
sudo php artisan migrate
sudo php artisan config:cache
sudo php artisan migrate
mysql -u root -p
sudo nano .env
sudo php artisan config:cache
sudo php artisan migrate
sudo a2dissite 000-default.conf
sudo a2ensite laravel.conf
sudo systemctl status apache2
sudo php artisan migrate
sudo nano .env
sudo systemctl status apache2
sudo php artisan migrate
sudo nano routes/web.php
sudo nano .env
sudo nano /etc/host
sudo nano /etc/hosts
sudo nano connection.php
sudo nano .env
nano .conf
sudo .conf
sudo nano .env
systemctl status mysql
sudo php artisan migrate --seed
sudo nano .env
sudo php artisan migrate --seed
sudo php artisan key:generate
sudo php artisan migrate --seed
sudo nano /etc/apache2/sites-available/laravel.conf
sudoa2dissite 000-default.conf
sudo a2dissite 000-default.conf
sudo a2ensite laravel
sudo a2enmod rewrite
sudo systemctl restart apache2
git inni
git init
sudo git init
git .
git add .
sudo git add .
git status
cd /var/www/html/laravel-realworld-exaple-app
cd /var/www/html
cd /laravel-realworls-app
cd /laravel-realworls-example-app
cd /laravel-realworld-example-app
