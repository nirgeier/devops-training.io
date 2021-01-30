
# Removing old container if its still up
docker stop jenkins1
docker rm jenkins1

# Run Jenkins as Docker container
export CONTAINER_NAME=jenkins1
export HOST_PORT=8080

echo Starting Jenkinscontainer 

# Start the Jenkins container
docker-compose up -d

# Grab the inital password
JENKINS_ADMIN_PASSWORD=$(docker exec ${CONTAINER_NAME} cat /var/jenkins_home/secrets/initialAdminPassword)
echo Jenkins initial password: $ADMIN_PASSWORD

# Download JenkinsCLI
#wget localhost:8080/jnlpJars/jenkins-cli.jar  

echo Open your browser at http://127.0.0.1:${HOST_PORT}