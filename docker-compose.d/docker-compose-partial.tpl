  {{wiki}}:
    build: ./  # 以当前的Dockerfile构建
    restart: always
    networks:
      bone:
    volumes:
      #- dataVol:/var/lib/tiddlywiki
      - ~/repo/noodle/bd-op/tiddlywikidata:/var/lib/tiddlywiki
    environment:
      - TW_WIKIPATH={{wiki}}
      - TW_USERNAME=
      - TW_PASSWORD=
      ## double $ to escpae
      - TW_ROOTTIDDLER=$$:/core/save/all

