# Usa a imagem oficial do Nginx como base
FROM nginx:alpine

# Remove a configuração padrão do Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia a configuração personalizada do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia os arquivos HTML e de imagem para o diretório de serviço do Nginx
COPY index.html /usr/share/nginx/html/index.html
COPY korp_favi.png /usr/share/nginx/html/korp_favi.png

# Expõe a porta 80, que é a porta padrão do Nginx para o Railway fazer o proxy
EXPOSE 80

# Comando para iniciar o Nginx quando o contêiner for executado
CMD ["nginx", "-g", "daemon off;"]
