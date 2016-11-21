FROM microsoft/mssql-server-linux
ENV LC_ALL en_US.UTF-8
# RUN -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=mypassword'
RUN locale-gen en_US.UTF-8
RUN apt-get update
RUN apt-get install -y curl apt-transport-https
RUN echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/mssql-ubuntu-wily-release/ wily main" > /etc/apt/sources.list.d/mssqlpreview.list
RUN apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql
RUN apt-get install -y unixodbc-dev-utf16
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN apt-get update 
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools

EXPOSE 1433
