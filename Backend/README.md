# InternshipClass

The infrastructure inspiration got [here](https://dev.to/alrobilliard/deploying-net-core-to-heroku-1lfe) 

##Prerequisites

To work with this application you need to install:
*[postgres](https://www.postgresql.org/download/) - database engine for the aplication

## Build and run locally

```
dotnet build
```

to run
```
dotnet run
```

## Build and run in docker

```
docker build -t mvc .
docker run -d -p 8080:80 --name internship_class mvc
```

to stop container
```
docker stop internship_class
```
to remove container
```
docker rm internship_class
```

## Deploy to heroku

1. Create heroku account
2. Create application
3. Choose container registry as deployment method
4. Build the docker locally


Login to heroku
```
heroku container:login
```

Push container
```
heroku container:push -a internship-class-alexandras web
```

Release the container
```
heroku container:release -a internship-class-alexandras web
```
