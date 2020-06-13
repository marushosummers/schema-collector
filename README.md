# schema-collector
`schema-collector` automatically collects MySQL schema-dump and diff, schema by SchemaSpy,

and push to your github repository for management database schema


## Usage Overview

1. Input Mysql connection config to `.env`
```
DB_TYPE=mysql
DB_HOST=<Host or ENDPOINT>
DB_PORT=3306
DB_NAME=<Database name>
DB_USER=<Database user>
DB_PASSWORD=<Database password>
GITHUB_URL=<e.g. git@github.com:marushosummers/schema-collector.git>
GITHUB_EMAIL=<your registered e-mail to Github>
GITHUB_NAME=<your registered name to Github>
BRANCH=<commit branch name>
SAVE_PATH=<save directory path>
```

2. `make` and input your ssh key for push your repository.

3. `make run`

4. you can find output files.

- mysql dump file

    `./SAVE_PATH/dump/DB_NAME.dump.sql`

- mysql dump DIFF file

    `./SAVE_PATH/diff/diff_DB_NAME_TIMESTAMP.dump.sql`

- Schema file by Schemaspy

    `./SAVE_PATH/schemaspy/index.html`