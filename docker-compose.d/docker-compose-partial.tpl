  {{wiki}}:
    build: ./  # 以当前的Dockerfile构建
    restart: always
    networks:
      bone:
    volumes:
      - dataVol:/var/lib/tiddlywiki
    environment:
      - TW_WIKIPATH={{wiki}}
      - TW_USERNAME=sandboxuser
      - TW_PASSWORD=sandboxpass

