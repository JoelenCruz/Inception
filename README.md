<h1 align="center">
	✏️ Inception
</h1>

<p align="center"><br>
Esse projeto visa ampliar seu conhecimento em administração de sistemas usando Docker.
Você vai virtualizar diversas imagens Docker, criando Docker Containers em sua nova máquina virtual.<br>
</p>

<p align="center">
	<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/rafaelabdm/Inception?color=lightblue" />
	<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/rafaelabdm/Inception?color=blue" />
	<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/rafaelabdm/Inception?color=green" />
</p>

---

<h2>📦 Sobre o projeto</h2>

> _One container is not enogh. We need to go deeper_
<p>
Nesse projeto temos que criar uma pequena infraestrutura composta de diferentes serviços, seguindo regras específicas:<br><br>
REGRAS GERAIS<br>
  • Usar docker-compose;<br>
  • Cada imagem Docker tem que ter o nome igual ao de seu serviço;<br>
  • Cada serviço tem que rodar em seu próprio container;<br>
  • Os containers tem que ser construídos a partir da penúltima versão estável de Debian ou Alpine;<br>
  • Escrever nossos próprios Dockerfiles;<br>
  • Chamar os Dockerfiles através do docker-compose.yml que, por sua vez, é chamado pelo Makefile;<br>
  • Nenhuma credencial deve estar exposta fora do arquivo .env!!!!!!!!!!!!<br>
  <br>
REGRAS INFRAESTRUTURA<br>
  • Um container com NGINX usando apenas o protocolo TLSv1.2 ou TLSv1.3;<br>
  • Um container com WordPress + php-fpm, sem NGINX;<br>
  • Um container com MariaDB, sem NGINX;<br>
  • Um volume com a base de dados do WordPress;<br>
  • Um segundo volume com os arquivos do site do WordPress;<br>
  • Uma docker-network que estabelece a conexão entre os containers.<br>

</p>

<h2>🔨 Um pouco sobre os serviços</h2>

<p>
💾<b> MARIADB:</b> Banco de dados, necessário para a instalação do Wordpress (os requisitos são PHP e um banco MySQL já instalados e configurados). Precisamos intalar, 
fazer uma pequena configuração e criar a tabela que o Wordpress vai usar.<br>
🌐<b> WORDPRESS:</b> Nosso site! Ele precisa de um banco de dados e php instalados para conseguir ser usado. Também precisa já estar instalado quando subirmos o container, 
para isso, usaremos wp-cli.<br>
🔒<b> NGINX:</b> Nosso servidor de HTTP e proxy. Vai ser nossa porta de entrada para a infraestrutura que estamos criando. Ele vai lidar com o protocolo de acesso ao nosso site. <br>
</p>

<h2>💻 Como usar</h2>
<p>
Em um computador com Docker instalado, crie um arquivo .env dentro da pasta srcs e dê make! <br>
Pronto, você deve ter um site Wordpress rodando no seu <a href="https://localhost:443">localhost:443</a>. Acesse seu navegador e teste o projeto 😉. <br>
<br>
No arquivo <TT>.env</TT> criado, modifique o nome dessas variáveis que deve tudo rodar normalmente:
</p>

```
# MariaDB Access
WORDPRESS_DB_HOST=XXXXXXX #Aqui precisa ser necessariamente "mariadb"
WORDPRESS_DB_NAME=XXXXXXX
WORDPRESS_DB_USER=XXXXXXX
WORDPRESS_DB_PASSWORD=XXXXXXX

# Wordpress Access
WORDPRESS_URL=XXXXXXX
WORDPRESS_ADMIN_USER=XXXXXXX
WORDPRESS_ADMIN_PASSWORD=XXXXXXX
WORDPRESS_ADMIN_EMAIL=XXXXXXX@XXXXXXX

WORDPRESS_GUEST_USER=XXXXXXX
WORDPRESS_GUEST_PASSWORD=XXXXXXX
WORDPRESS_GUEST_EMAIL=XXXXXXX@XXXXXXX

# Certs
CERTS_=/etc/ssl/certs/XXXXXXX.crt
CERTS_KEY=/etc/ssl/private/XXXXXXX.key
```


