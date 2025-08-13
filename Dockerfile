# Usa Node LTS
FROM node:18-alpine

# Instala dependencias del sistema necesarias
RUN apk add --no-cache python3 make g++ && \
    npm install -g npm@latest

# Crea directorio para la app
WORKDIR /srv/app

# Instala Strapi CLI
RUN npm install -g create-strapi-app@4.20.0

# Crea el proyecto Strapi
RUN npx create-strapi-app my-app --quickstart --no-run

WORKDIR /srv/app/my-app

# Expone el puerto por defecto
EXPOSE 1337

# Comando por defecto
CMD ["npm", "run", "develop"]
