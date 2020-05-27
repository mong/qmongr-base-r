FROM rocker/r-base

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libxml2-dev \
    libssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# basic R functionality
RUN R -e "install.packages(c('remotes'), repos='https://cloud.r-project.org/')"

# install package dependencies
RUN R -e "install.packages(c('magrittr','shiny', 'shinyalert', 'dplyr', 'tidyr', 'rlang', 'yaml', 'lubridate', 'stringr', 'jsonlite'))"

RUN R -e "remotes::install_github('rstudio/shiny')"

CMD ["R"]
