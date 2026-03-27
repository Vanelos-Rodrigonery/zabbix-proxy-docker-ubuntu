# 🐧 Zabbix Proxy + Agent 2 (Docker & Ubuntu 24.04 LTS)

Este repositório contém a estrutura profissional para deploy de um **Zabbix Proxy (SQLite3)** e **Zabbix Agent 2** integrados via Docker Compose, seguindo padrões de escalabilidade e segurança de mercado.

## 🚀 Diferenciais deste Projeto
- **Base Ubuntu 24.04 LTS:** Estabilidade e performance de última geração.
- **Monitoramento 360º:** O Agent 2 monitora a saúde do próprio host (Raspberry/VM) e dos containers.
- **Segurança Reforçada:** Preparado para comunicação via **PSK (Pre-Shared Key)**.
- **Persistência de Dados:** Banco SQLite3 mapeado em volume para evitar perda de dados em restarts.
- **Plug & Play:** Script de setup automatizado para permissões e pastas.

---

## 📋 Pré-requisitos (Requirements)

### 1. Hardware Sugerido (Hyper-V / Bare Metal)
* **Processador:** 2 vCPU (Núcleos).
* **Memória RAM:** 2 GB (Mínimo de 1 GB).
* **Disco:** 20 GB a 30 GB (No Hyper-V, use **Geração 2** e desative Memória Dinâmica).
* **Rede:** Switch Externo para IP próprio na rede.

### 2. Software (Preparação do Ubuntu)
Se a VM for nova, prepare o ambiente com estes comandos:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git openssh-server -y

# Instalação do Docker (Script oficial)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
Use o código com cuidado.

🛠️ Como Instalar (Passo a Passo)
1. Clonar o Repositório
bash
git clone https://github.com
cd zabbix-proxy-docker-ubuntu
Use o código com cuidado.

2. Rodar o Script de Setup
O setup.sh criará as pastas do banco, dará permissões 777 necessárias e gerará o seu arquivo .env inicial.
bash
chmod +x setup.sh
./setup.sh
Use o código com cuidado.

3. Configurar as Variáveis (.env)
Edite o arquivo .env gerado para inserir os dados do seu cenário:
bash
nano .env
Use o código com cuidado.

ZBX_HOSTNAME: Nome exato do Proxy criado no Zabbix Server.
ZBX_SERVER_HOST: IP ou DNS do seu Zabbix Server.
ZBX_HOSTNAME_AGENT: Nome do Host (esta VM) no Zabbix Server.

4. Iniciar os Containers
Após configurar o .env, execute o setup novamente para subir os serviços:
bash
./setup.sh
Use o código com cuidado.

🔐 Segurança e Acesso
1. Criptografia PSK (Proxy <-> Server)
A chave de criptografia foi gerada automaticamente pelo script. Para visualizá-la e inserir no campo TLS PSK do Zabbix Server:
bash
cat zabbix_proxy.psk
Use o código com cuidado.

2. Acesso ao Host (SSH)
Recomenda-se configurar o acesso ao servidor Ubuntu exclusivamente via Chave Pública/Privada.
⚠️ Dica: Desabilite o login por senha no arquivo /etc/ssh/sshd_config (PasswordAuthentication no).

📊 O que este projeto entrega?

Zabbix Proxy: Coleta dados locais e envia ao servidor central de forma ativa.
Zabbix Agent 2: Monitora CPU, RAM, Disco e Docker do host via network_mode: host.
Auto-healing: Reinicialização automática em caso de falhas ou reboot da VM. 


Mantido por Vanelos-Rodrigonery
