docker service rm portainer_agent
docker stack deploy --compose-file=/opt/portainer/portainer-agent-stack.yml portainer
