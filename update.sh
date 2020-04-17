docker service rm portainer_agent
docker stack deploy --compose-file=portainer-agent-stack.yml portainer
