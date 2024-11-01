# Prerequisites
- Docker and docker compose
- FEDn, install with ```pip3 install fedn```.
# Setting up a sandbox environment
Run the command:
```docker-compose up```
and wait for all services to start.

Add the following entry your hosts file:
```
127.0.0.1 api-server combiner
```
If you want to connect the client from a different computer, you would just have to change IP to the IP of the computer running the API server and the combiner.

Now open the notebook ```API_Example.ipynb```. Set the compute package and the seed model. Now start the client:
```
fedn start client --client.yaml
```
After the client has started up, you can run the rest of the notebook (starting a session and plotting the results).


To launch the environment, run:


```
docker-compose up
```
and wait for all services to initialize.

Next, add the following entry to your hosts file:

```
127.0.0.1 api-server combiner
```

Open the API_Example.ipynb notebook and run the first cells, setting the compute package and the seed model. Then start a client with:
```
fedn start client --client.yaml
```
Once the client is running, you can proceed with the remaining steps in the notebook to start a session and plot the results.