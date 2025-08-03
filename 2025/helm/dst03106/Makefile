CLUSTER_NAME=my-cluster
APP_NAME=my-app
NAMESPACE=my-namespace
CHART_PATH=./charts

.PHONY: docker-build docker-test create-cluster delete-cluster install helm-debug pod-debug test

docker-build:
	docker build -t $(APP_NAME):latest .

docker-test:
	make docker-build
	docker images $(APP_NAME):latest
	docker run -d -p "8000:8080" --rm --name $(APP_NAME) $(APP_NAME):latest
	sleep 2
	curl http://localhost:8000/healthcheck 
	docker stop $(APP_NAME) 

create-cluster:
	k3d cluster create ${CLUSTER_NAME} --port "30080:30080@loadbalancer"
	k3d image import ${APP_NAME}:latest -c ${CLUSTER_NAME}
	docker exec k3d-${CLUSTER_NAME}-server-0 sh -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'

delete-cluster:
	k3d cluster delete ${CLUSTER_NAME}

install:
	helm install ${APP_NAME} ${CHART_PATH}/ 

helm-debug:
	helm template ${CHART_PATH}/ --debug

pod-debug:
	kubectl describe pod

test:
	curl http://localhost:30080/api/v1/dst03106
	curl http://localhost:30080/healthcheck
