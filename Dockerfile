FROM php:7.3-alpine

ENV ZEPHIR_VERSION=0.12.2 \
    ZEPHIR_PARSER_VERSION=1.3.1

RUN set -xe && \
        # Compile Zephir parser
        curl -LO https://github.com/phalcon/php-zephir-parser/archive/v${ZEPHIR_PARSER_VERSION}.tar.gz && \
        tar xzf v${ZEPHIR_PARSER_VERSION}.tar.gz && rm -f v${ZEPHIR_PARSER_VERSION}.tar.gz && \
        docker-php-ext-install -j $(getconf _NPROCESSORS_ONLN) /php-zephir-parser-${ZEPHIR_PARSER_VERSION} && \
        rm -rf php-zephir-parser-${ZEPHIR_PARSER_VERSION} && \
        curl -LO https://github.com/phalcon/zephir/releases/download/${ZEPHIR_VERSION}/zephir.phar && \
        chmod +x zephir.phar && mv zephir.phar /usr/local/bin/zephir && \
        zephir help
