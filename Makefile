build:
	docker build -t xtgcs/nginx  .

deploy:
	docker run --restart=always -d  --network host xtgcs/nginx

push:
	docker push xtgcs/nginx