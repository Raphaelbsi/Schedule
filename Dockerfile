FROM ruby:3.0.1

# add nodejs e yarn
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    nodejs yarn build-essential libpq-dev imagemagick git-all nano

# Set path
ENV INSTALL_PATH /schedule

# Criar diretório
RUN mkdir -p $INSTALL_PATH

# Set path como o diretório principal
WORKDIR $INSTALL_PATH

# Set path para as Gems
ENV BUNDLE_PATH /gems

# Copia o código para dentro do container
COPY . .