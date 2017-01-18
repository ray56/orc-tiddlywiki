dc.up:
	docker-compose up -d

dc.down:
	docker-compose down

dc.down-v:
	# 删除卷
	read -p "REALLY WANT TO REMOVE VOLUME? type REALLY to confirm:" input ;
	test "$$input" = "REALLY" && docker-compose down -v
d.run:
	#TODO 单独跑以测试
	docker run -d \
	  --name "tw-${NAME}" -h="tw-${NAME}" \
	  -e TW_PASSWORD="$pass" -e TW_USERNAME="$user" -e TW_WIKIPATH=${NAME} \
	  -v /tmp:/tmp \
	  -p ${PORT}:8080 \
	  --volumes-from tw-data \
	  kpbd/tiddlywiki


d.backup:
	#TODO  暂时不用这个操作镜像, 而是直接在tw-home中操作
	docker run -d \
	  --name "operation-tw" -h="operation-tw" \
	  -v /tmp:/tmp \
	  --volumes-from tw-data \
	  kpbd/ubuntu-desktop
	  bash
