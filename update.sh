# create network on first run
# docker network create --driver=overlay web

export PORTAINER_FQDN=${PORTAINER_FQDN:-localhost.localdomain}
export PROXY_NET=${PROXY_NET:-proxy}

cd $( dirname $0 )
[[ -f .env ]] && source .env
docker service rm portainer_agent
docker stack deploy --compose-file=portainer-stack.yml portainer
