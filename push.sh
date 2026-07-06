#!/bin/bash
cloudflared access tcp --hostname ssh.obsidianos.xyz --listener 127.0.0.1:2222 &
PID=$!
sleep 1
rsync -av --exclude="src/*/src" --include-from=.sftpinclude --exclude="*" -e 'ssh -p 2222' ./ localhost:/var/www/html/pillar/
kill $PID
