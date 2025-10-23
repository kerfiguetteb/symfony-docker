# Étape 1 : PHP avec FPM (pas Apache)
FROM php:8.2-fpm

# Étape 2 : Extensions nécessaires pour Symfony
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    git \
    zip \
    && docker-php-ext-install pdo pdo_mysql zip

# Étape 3 : Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Étape 4 : Dossier de travail pour Symfony
WORKDIR /var/www/html/app

# Étape 5 : Permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Étape 6 : Exposer le port 9000 pour PHP-FPM
EXPOSE 9000

# Commande de démarrage pour PHP-FPM
CMD ["php-fpm"]

