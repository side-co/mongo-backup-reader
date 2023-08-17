Extract your wiredTiger backup

go to the folder where all the *.wt files are

`docker run --name mongodb -d -p 27017:27017 -v $(pwd):/data/db side/mongo:<version>`

After that you' ll be able to exec into the container to query the data `docker exec -ti mongodb sh`

e.g: `mongo`

`use <your db>`

`db.<yourcollection>.find()`
