#!/bin/bash

# Wait for MongoDB to boot.
RET=1
while [[ RET -ne 0 ]]; do
  echo "=> Waiting for confirmation of MongoDB service startup..."
  sleep 5
  mongo admin --eval "help" > /dev/null 2>&1
  RET=$?
done

# Create admin user
echo "=> Creating admin user.."
mongo admin --eval "db.createUser({ user: '$MONGODB_ADMIN_USER', pwd: '$MONGODB_ADMIN_PASS', roles: [{ role: 'root', db: 'admin' }] });"

sleep 3

# Create user for MONGODB_APPLICATION_DATABASE if necessary.
if [ "$MONGODB_APPLICATION_DATABASE" != "admin" ]; then
  echo "=> Creating a ${MONGODB_APPLICATION_DATABASE} database user.."
  mongo admin -u $MONGODB_ADMIN_USER -p $MONGODB_ADMIN_PASS << EOF
echo "Using $MONGODB_APPLICATION_DATABASE.."
use $MONGODB_APPLICATION_DATABASE
db.createUser({ user: '$MONGODB_APPLICATION_USER', pwd: '$MONGODB_APPLICATION_PASS', roles: [{ role: 'dbOwner', db: '$MONGODB_APPLICATION_DATABASE' }] })
EOF
fi

sleep 1

touch $MONGODB_DATA_VOLUME/.mongodb_password_set

echo "=> MongoDB configured successfully."
