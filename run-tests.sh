set -e

echo "===========Automation Tests========="
cd automation
ENVIRONMENT=${bamboo_ENVIRONMENT}
export TEST_AUTH_TYPE=${bamboo_TEST_AUTH_TYPE}
source /etc/profile.d/maven.sh
echo "Run tests...."
mvn test -Dkarate.env=$ENVIRONMENT -Dmaven.repo.local=repo -o
echo "====================================="
echo "===========Tests completed==========="
echo "====================================="
cd ..