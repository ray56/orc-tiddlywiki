upstream {{wiki}} {
    server {{wiki}}:8080;
}
server {
    listen 80;
    server_name {{wiki}}.wiki.*;
    location / {
        proxy_set_header   Host              $http_host;
        proxy_set_header   Referer           $http_referer;
        proxy_set_header   Cookie            $http_cookie;
        proxy_set_header   X-Real-IP         $remote_addr;
        proxy_set_header   REMOTE-HOST       $remote_addr;
        proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;

        proxy_pass http://{{wiki}};
    }
}
