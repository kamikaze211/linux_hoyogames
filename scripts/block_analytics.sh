#!/usr/bin/env bash

analytics_servers=$(cat <<EOF

# Honkai Impact 3rd analytics servers (glb/sea/tw/kr/jp):
0.0.0.0 log-upload-os.hoyoverse.com
0.0.0.0 sg-public-data-api.hoyoverse.com
0.0.0.0 dump.gamesafe.qq.com

# Honkai Impact 3rd analytics servers (cn):
0.0.0.0 log-upload.mihoyo.com
0.0.0.0 public-data-api.mihoyo.com
0.0.0.0 dump.gamesafe.qq.com


# Honkai Star Rail analytics servers (os)
0.0.0.0 log-upload-os.hoyoverse.com
0.0.0.0 sg-public-data-api.hoyoverse.com

# Honkai Star Rail analytics servers (cn)
0.0.0.0 log-upload.mihoyo.com
0.0.0.0 public-data-api.mihoyo.com

# ZZZ anti-cheat bypass (cn)
0.0.0.0 globaldp-prod-cn01.juequling.com

# HSR anti-cheat bypass (cn)
0.0.0.0 globaldp-prod-cn01.bhsr.com


EOF
)

 if [[ ! `cat /etc/hosts` == *"$analytics_servers"* ]]; then
    echo "Blocking analytics servers. This will require superuser privileges"
    echo "$analytics_servers" | pkexec tee -a /etc/hosts 2>&1 >> /dev/null
    if test $? -ne 0; then
        echo "Could not block analytics servers. Please add the following lines to your /etc/hosts manually:"
        echo "$analytics_servers"
    fi
else
    echo "Analytics servers are already blocked"
fi
