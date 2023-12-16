# hotwax-task

## References

- [How to use MySQL with docker](https://medium.com/@tericcabrel/using-prisma-orm-to-build-a-node-js-application-with-mysql-ac9a7690bae8)

## Setup

### Clone the repository

```zsh
git clone https://github.com/puru-khedre/hotwax-task.git
```

### Install deps

```zsh
npm install
```

### Database setup

```zsh
# starting docker container in docker
docker run -d --rm -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=inventory --name prisma_db -p 3307:3306 mysql:8.0

# Apply all the migration to create tables
npx prisma migrate dev
```

## Postman collection

[Postman collection link](https://elements.getpostman.com/redirect?entityId=17242417-5b8297ce-cce2-458a-a397-538ab1618d1f&entityType=collection)

## Tasks completed

- Schemas for database table are completed `prisma/schema.prisma`
- Person Create, Update, Delete APIs are working
