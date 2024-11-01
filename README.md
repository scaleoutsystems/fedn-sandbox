# Prerequisites
- Docker and docker compose
- FEDn, install with ```pip3 install fedn```.
# Setting up a sandbox environment

To launch the environment, run:
```
docker-compose up
```
and wait for all services to initialize.

Next, add the following entry to your hosts file:
```
127.0.0.1 api-server combiner
```
If you want to connect the client from a different computer, you would have to change IP to the IP of the computer running the API server and the combiner.

Open the API_Example.ipynb notebook and run the first cells, setting the compute package and the seed model. Then start a client with:
```
fedn start client --client.yaml
```
Once the client is running, you can proceed with the remaining steps in the notebook to start a session and plot the results.