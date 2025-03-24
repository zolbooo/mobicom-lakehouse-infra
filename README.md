# Mobicom lakehouse infrastructure

This project uses Ansible for a managed and automated deployment of a lakehouse configuration.

## Setup

### AWS

Please note that you MUST allow access to following ports on your AWS security group in order for the Docker Swarm to work:

```
2377/tcp - Docker Swarm: Communication with and between manager nodes
7946/tcp - Docker Swarm: TCP/UDP for overlay network node discovery
7946/udp - Docker Swarm: TCP/UDP for overlay network node discovery
4789/udp - Docker Swarm: overlay network traffic
```
