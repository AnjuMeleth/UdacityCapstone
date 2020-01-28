
#!/usr/bin/env bash
dockerpath=anjurose/webapp
# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
export DOCKER_ID_USER="anjurose"
docker login
docker tag webapp $DOCKER_ID_USER/webapp

# Step 3:
# Push image to a docker repository
docker push $DOCKER_ID_USER/app
