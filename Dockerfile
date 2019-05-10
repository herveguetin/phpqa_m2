FROM composer

RUN apk add --update \
    libxslt-dev

RUN docker-php-ext-install \
	xsl

COPY . /app

RUN composer install --no-dev

RUN vendor/squizlabs/php_codesniffer/bin/phpcs --config-set installed_paths ../../magento/marketplace-eqp

CMD ["php", "./phpqa", "--verbose", "--report", "--buildDir=/report", "--analyzedDirs=/source"]
