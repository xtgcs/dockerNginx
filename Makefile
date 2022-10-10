build-base:
	docker build -t ayoungfish/nginx-base -f Dockerfile-base .

build-http: build-base
	docker build -t ayoungfish/nginx-http -f Dockerfile-http .
	docker push ayoungfish/nginx-http

deploy:
	docker run --restart=always -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /webapp:/webapp  -v /etc/letsencrypt/:/etc/letsencrypt/ -p 443:443 -p 80:80 ayoungfish/nginx-http