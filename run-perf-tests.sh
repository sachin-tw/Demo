set -e

ENVIRONMENT=${bamboo_ENVIRONMENT}
export TEST_NO_OF_USERS=${bamboo_TEST_NO_OF_USERS}
export TEST_AUTH_TYPE=${bamboo_TEST_AUTH_TYPE}

echo "===========Performance Tests========="
source /etc/profile.d/maven.sh
echo "Run tests...."
echo $ENVIRONMENT
mvn test-compile gatling:test -Dkarate.env=$ENVIRONMENT -Dmaven.repo.local=repo -o
echo "====================================="
echo "===========Tests completed==========="
echo "====================================="
cd ..