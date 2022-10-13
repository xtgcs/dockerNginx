build:
	docker build -t xtgcs/nginx  .

deploy:
	docker run --rm  --network host xtgcs/nginx

push:
	docker push xtgcs/nginx