# create network on first run
# docker network create --driver=overlay web

cd $( dirname $0 )
[[ -f .env ]] && export $(grep -v '^#' .env | xargs)
docker service rm portainer_agent
docker stack deploy --compose-file=portainer-stack.yml portainer
