# Dockerfile
FROM ruby:3.2

# Instala dependencias
RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev nodejs

# Crea directorio de trabajo
WORKDIR /app

# Copia Gemfile y Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instala gems
RUN bundle install

# Copia el resto del proyecto
COPY . .

# Expone el puerto
EXPOSE 3000

# Comando por defecto
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

