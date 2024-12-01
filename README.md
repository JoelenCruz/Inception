# 🏗️ Inception - 42 Project

This project, part of the 42 School curriculum, focuses on deepening your knowledge of **system administration** through the use of **Docker**. The goal is to virtualize multiple services, such as a database, a web server, and a content management system, within isolated **Docker containers**.

---

## **📜 Overview**

### **Project Requirements**
- Use `docker-compose` to orchestrate the infrastructure.
- Each Docker service must run in its **dedicated container**.
- Containers must be built from the penultimate stable version of **Debian** or **Alpine**.
- Write custom `Dockerfiles` for each service.
- Connect the containers through a `docker network`.
- Store data persistently using `docker volumes`.

### **Infrastructure**
- **NGINX**:
  - Acts as an HTTP/HTTPS server.
  - Implements SSL/TLS encryption (auto-signed certificates are generated during the build).
- **MariaDB**:
  - Relational database used to store WordPress data.
- **WordPress**:
  - A CMS (Content Management System) to serve as your project’s website.
- **Custom Domain**:
  - Configured in `/etc/hosts` to access the website locally via a domain like `jcruz-da.42.fr`.

---

## **⚙️ How It Works**

### **Workflow**

1. **Volumes for Data Persistence**:
   - MariaDB and WordPress data are stored in `docker volumes` mapped to local folders for persistence.
   - These folders ensure that your data is not lost when containers are rebuilt.

2. **Custom Domain Setup**:
   - The `Makefile` includes a rule (`set_host`) to configure a local domain like `jcruz-da.42.fr` in your `/etc/hosts` file.

3. **Automated Certificate Generation**:
   - SSL certificates are auto-generated during the build process and stored inside the NGINX container.

4. **Dynamic NGINX Configuration**:
   - NGINX uses a template (`default.template`) to dynamically configure the server based on environment variables.

---

## **🚀 Getting Started**

### **Prerequisites**
- Docker
- Docker Compose
- Access to `/etc/hosts` with `sudo` (for domain configuration)

### **Setup Steps**

1. **Clone the Repository**:
   ```bash
   git clone <repository_url>
   cd inception

```bash
WORDPRESS_DB_NAME=wordpress_db
WORDPRESS_DB_USER=admin
WORDPRESS_DB_PASSWORD=password
WORDPRESS_URL=jcruz-da.42.fr
WORDPRESS_ADMIN_USER=admin
WORDPRESS_ADMIN_PASSWORD=admin123
WORDPRESS_ADMIN_EMAIL=admin@example.com
CERTS_=/etc/ssl/certs/server.crt
CERTS_KEY=/etc/ssl/private/server.key
