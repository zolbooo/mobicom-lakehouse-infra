# Mobicom lakehouse infrastructure

This project uses Ansible for a managed and automated deployment of a lakehouse configuration.

## Setup

### Ansible

Run following script to install Ansible modules on your local machine:

```bash
ansible-galaxy collection install community.docker
```

### AWS

Please note that you MUST allow access to following ports on your AWS security group in order for the Docker Swarm to work:

```
2377/tcp - Docker Swarm: Communication with and between manager nodes
7946/tcp - Docker Swarm: TCP/UDP for overlay network node discovery
7946/udp - Docker Swarm: TCP/UDP for overlay network node discovery
4789/udp - Docker Swarm: overlay network traffic
```

### Atlas node

Atlas node uses some huge download and setup scripts, so it's better to use tmux to run them.

```bash
sudo dnf install -y tmux
tmux
```

In tmux, run the following command:

```bash
./download-archives.sh
```

Create a new tab in tmux by pressing `Ctrl+B` and then `C`. In the new tab, run the following command:

```bash
docker compose -f docker-compose.atlas-base.yml -f docker-compose.atlas-build.yml up
```

Use `Ctrl+B` and then `D` to detach from the tmux session. You can reattach to the session by running `tmux attach -d`.
You can use `Ctrl+B` and then `N` to switch between tabs.
