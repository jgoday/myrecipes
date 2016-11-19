# Install Microsoft SQL Server on a docker linux container

Date: _20161122_

Current Microsoft docker image is based on Ubuntu 15.10

Based on the following articles
* [sql-server-vnext-including-Linux](https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux)
* [sql-server-linux-setup-docker](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-docker)
* [sql-server-linux-connect-and-query-sqlcmd](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-connect-and-query-sqlcmd)

--
# Pull image from Microsoft docker hub
```bash
docker pull microsoft/mssql-server-linux
docker run  --name mssql -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=mypassword' -p 1433:1433 -d microsoft/mssql-server-linux
docker start mssql
```
--
# Install msodbcsql (needed for sqlcmd command line tool)
```bash
# launch bash on the container
docker exec -t -i mssql /bin/bash
echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/mssql-ubuntu-wily-release/ wily main" > /etc/apt/sources.list.d/mssqlpreview.list
apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
apt-get update
apt-get install msodbcsql
#for silent install use ACCEPT_EULA=Y apt-get install msodbcsql
apt-get install unixodbc-dev-utf16 #this step is optional but recommended*
```
--
# Install mssql-tools
```bash
apt-get install curl
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
apt-get update 
apt-get install mssql-tools
```

--
# Test mssql-server

```bash
locale-gen en_US.UTF-8
export LC_ALL=en_US.UTF-8
sqlcmd -S localhost -U SA -p
```
