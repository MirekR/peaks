1) Copy your data to the data folder. Assuming naming convetion is S*_tabular.txt
2) Open command line and execute: chmod 777 prepareData.sh && ./prepareData.sh
3) Start docker using following command:
   docker run -v $(pwd)/data:/data -v $(pwd)/docker-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=start123 -d mysql:latest

4) find out id of you container: docker ps
5) connect to the container:
   docker exec -it {YOUR_CONTAINER_ID} /bin/bash
6) create table running:
    mysql -u root -p < ./data/createKeySpaceAndTable.sql   
7) In the docker (you'll see root@strangenumber) execute following command to populate database:
   cat ./data/S*.sql > all.sql && mysql -u root -p < all.sql

8) selecting data run following:
   mysql -u root -p < ./data/select/sql > ./data/peaks.txt

