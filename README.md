#  Zabbix Proxy + Agent2 (Docker & Ubuntu 24.04)

Este repositório contém a estrutura profissional para deploy de um **Zabbix Proxy (SQLite3)** e **Zabbix Agent2** integrados via Docker Compose, seguindo padrões de segurança de mercado.

##  Diferenciais deste Projeto
- **Base Ubuntu 24.04 LTS:** Estabilidade e performance.
- **Monitoramento 360º:** O Agent2 monitora a saúde do próprio host/container do Proxy.
- **Segurança Reforçada:** Preparado para comunicação via **PSK (Pre-Shared Key)** e acesso ao host apenas por **Chave Privada SSH**.
- **Persistência de Dados:** Banco SQLite3 mapeado em volume para evitar perda de dados em restarts.

---

## 🔐 Requisitos de Segurança

### 1. Acesso ao Host (Ubuntu)
O acesso ao servidor Ubuntu deve ser configurado exclusivamente via **Chave Pública/Privada**. 
> ⚠️ **Dica:** Desabilite o login por senha no arquivo `/etc/ssh/sshd_config` (`PasswordAuthentication no`).

### 2. Criptografia PSK (Proxy <-> Server)
Para gerar a chave de criptografia que o Proxy usará para falar com o Server, rode o comando no terminal do Ubuntu:
```bash
openssl rand -hex 32 > zabbix_proxy.psk
