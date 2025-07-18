# Usa a imagem oficial do Nginx como base
FROM nginx:alpine

# Remove a configuração padrão do Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia os arquivos HTML e de imagem para o diretório de serviço do Nginx
COPY index.html /usr/share/nginx/html/index.html
COPY korp_favi.png /usr/share/nginx/html/korp_favi.png

# Copia uma configuração personalizada do Nginx (se necessário, para servir arquivos estáticos)
# Para este caso simples, a configuração padrão do Nginx para servir arquivos estáticos do /usr/share/nginx/html/ já é suficiente.
# Se houver necessidade de configurações mais complexas, um arquivo nginx.conf personalizado seria adicionado aqui.

# Expõe a porta 80, que é a porta padrão do Nginx
EXPOSE 80

# Comando para iniciar o Nginx quando o contêiner for executado
CMD ["nginx", "-g", "daemon off;"]
