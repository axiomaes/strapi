# Usa una imagen oficial con Node.js 18
FROM node:18

# Define directorio de trabajo
WORKDIR /app

# Copia los archivos de dependencias primero para aprovechar el cache
COPY package.json yarn.lock ./

# Instala dependencias
RUN yarn install --frozen-lockfile

# Copia el resto del proyecto
COPY . .

# Construye el panel de administración
RUN yarn build

# Expone el puerto usado por Strapi
EXPOSE 1337

# Lanza el servidor en producción
CMD ["yarn", "start"]
