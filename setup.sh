#!/bin/bash
# 1. Pastas e Permissões
mkdir -p zabbix_proxy_db
chmod 777 zabbix_proxy_db

# 2. Arquivo PSK (Se não existir, cria um vazio para não dar erro no Docker)
if [ ! -f zabbix_proxy.psk ]; then
    touch zabbix_proxy.psk
    chmod 644 zabbix_proxy.psk
fi

# 3. Criar .env se não existir
if [ ! -f .env ]; then
    cp .env.example .env
    echo "EDITE O ARQUIVO .env AGORA!"
fi

# 4. Rodar
docker compose up -d
