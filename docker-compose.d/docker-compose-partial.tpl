  {{wiki}}:
    build: ./  # 以当前的Dockerfile构建
    restart: always
    networks:
      bone:
    volumes:
      #- dataVol:/var/lib/tiddlywiki
      - ~/repo/noodle/bd-op/tiddlywikidata/tiddlywiki:/var/lib/tiddlywiki
      # 打补丁，使得 GET /status 的时候，返回的用户名是basic auth中登录的名字，而不是server命令指定的名字
      - ./docker-compose.d/server.js:/usr/local/lib/node_modules/tiddlywiki/core/modules/commands/server.js
    environment:
      - TW_WIKIPATH={{wiki}}
      - TW_USERNAME=anonymous
      - TW_PASSWORD=
      ## double $ to escpae
      - TW_ROOTTIDDLER=$$:/core/save/all

