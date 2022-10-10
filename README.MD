## 构建镜像
* 构建
docker run --rm --privileged  --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro ayoungfish/ubuntu-ssl-nginx
* 进入终端，安装certbot
sh snap.sh
* 保存镜像 
docker commit container-id ayoungfish/ubuntu-ssl-nginx
* 推送镜像
docker push ayoungfish/ubuntu-ssl-nginx

## Quick Start
* 运行docker 命令
docker run --rm --privileged  --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro \ 
    -v /etc/letsencrypt:/etc/letsencrypt -p 80:80 ayoungfish/ubuntu-ssl-nginx
* 进入到终端
docker exec -it container-id bash
* 运行nginx
nginx
* 获取证书
certbot --nginx

## 注意

证书申请次数不能过多，因此申请

