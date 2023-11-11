# Postgresql-queries
Queries and associated scripts for creating structure of data in destination storage.

## Version control
We will be using `liquidbase` to version control our schema and automate this process with github actions.

## How it works?
Liquibase is a powerful database schema migration tool and it provides a wide range of features to manage and version control your database schema. Visit [liquidbase](https://docs.liquibase.com/home.html) for more info.

### Workflow
1. Change author's name in the header of `changelog.sql`
   
    ```
        --changeset your_name:$(now)
    ``` 

2. Make any update or changes to the schema in `changelog.sql`
 
3. Push the code up to github and it will trigger a `github action` run

4. The job will run liquidbase command and update to the newest schema

> Note: Update your postgres info in repo and the url should follow jdbc format like this secrets `postgresql://{dburl}.com:5432/{db_name}?sslmode=require`
