#!/bin/bash
set -e

# Check if the database exists, and if not, create it
echo "Preparing database..."
bundle exec rake db:prepare

# Run seed data
echo "Seeding database..."
bundle exec rake db:seed

# Then exec the Docker's CMD
exec "$@"


#!/bin/bash
# set -e

# # Wait for MySQL
# until mysql -h "$DATABASE_HOST" -u "$DATABASE_USER" -p"$DATABASE_PASSWORD" &> /dev/null
# do
#   printf "."
#   sleep 1
# done

# echo "MySQL is up - executing command"
# exec "$@"
