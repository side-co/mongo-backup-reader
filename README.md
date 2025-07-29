Extract your wiredTiger backup

go to the folder where all the *.wt files are

`docker run --rm --name mongodb -d -p 27017:27017 -v $(pwd):/data/db side/mongo:7.0`

After starting the container, you can connect with the MongoDB shell directly:

```
docker exec -ti mongodb mongosh
or 
docker exec -ti mongodb sh

mongo
use <your db>
db.<yourcollection>.find()
```

Starting for mongo 7.0 you should use mongosh

```
docker exec -ti mongodb mongosh
use <your db>
db.<yourcollection>.find()
```
