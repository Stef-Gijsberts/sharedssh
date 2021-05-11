# sharedssh

## Create and start
```
docker build 'https://github.com/Stef-Gijsberts/sharedssh.git' -t sharedssh
docker run --publish 22:22 -d --name sharedssh sharedssh
```

## Stop
```
docker stop sharedssh
```

## Start again after creation
```
docker start sharedssh
```
