# Things to check to be sure everything is alrigth

## Command line to execute

`composer install`
Run `php .\bin\console about` and make sure your Symfony version is 5+ and your PHP version is 7.4+
`composer require logger`
`symfony check:security`

## Database requirements

Make sure to start your server environement like Wamp, Xamp, Mamp etc...
Go to .env file and make sure the line `DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/location?serverVersion=5.7` is filed with your database connection requirements

## Now setup your symfony server and database

Now run this command to start the symfony server `symfony server:start`
Open a new terminal and run `php .\bin\console doctrine:database:create`
Run `php .\bin\console make:migration`
Run `php .\bin\console doctrine:migrations:migrate`

Now go to your PhpMyAdmin select *location* database, click import and choose the *location.sql* file in the project directory.

## Your good to go '!'
