#!/bin/bash

export PORTAINER_FQDN=${PORTAINER_FQDN:-localhost.localdomain}
export PROXY_NET=${PROXY_NET:-proxy}

cd $( dirname $0 )
[[ -f .env ]] && export $(grep -v '^#' .env | xargs)

required_version="2.30.0"
git_version=$(git --version | awk '{print $3}')

if [ "$(printf '%s\n' "$required_version" "$git_version" | sort -V | head -n1)" != "$required_version" ]; then
    echo "Recomenda-se a versão do Git igual ou superior a $required_version. Versão atual: $git_version."
    git pull --no-edit
else
    git pull --strategy-option=theirs --allow-unrelated-histories --no-edit
fi

docker service rm portainer_agent
docker stack deploy --compose-file=portainer-stack.yml portainer
