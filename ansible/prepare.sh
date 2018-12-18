#!/bin/bash

# add custom shell to config
if ! $(grep --quiet "/usr/local/bin/dockersh" /etc/shells); then
  echo "/usr/local/bin/dockersh" >> /etc/shells
fi

# create users
for ((userid=1;userid<11;userid++)); do
  useradd -m -G docker -s /usr/local/bin/dockersh suzen${userid}
  touch /home/suzen${userid}/.hushlogin && chown suzen${userid}:suzen${userid} /home/suzen${userid}/.hushlogin
done

# make shell
cat <<\EOF > /usr/local/bin/dockersh
#!/bin/bash
if [ ! -f /var/tmp/addr ]; then
  echo 1 > /var/tmp/addr
fi
addr=$(cat /var/tmp/addr)
if [ "$addr" -gt 254 ] || [[ "$addr" == "" ]]; then
  addr="1"
  /etc/cron.hourly/kill-docker.sh 2>&1 1>/dev/null
fi

NETWORK=$(( RANDOM % 1000000000))
docker network create --internal --subnet 10.10.${addr}.0/24 ${NETWORK} 2>&1 1>/dev/null
((addr++))
echo ${addr} > /var/tmp/addr

if [ "$(whoami)" == "suzen5" ]; then
  /usr/bin/docker run -ti -d --rm --network $NETWORK --cpus=".2" --memory=50m --kernel-memory=50m --pids-limit=50 --stop-timeout=3600 --storage-opt size=11G ctf.school:5000/suzenescape/suzen5server 2>/dev/null
fi
/usr/bin/docker run -ti --rm --network $NETWORK --cpus=".2" --memory=50m --kernel-memory=50m --pids-limit=50 --stop-timeout=3600 --storage-opt size=11G ctf.school:5000/suzenescape/$(whoami) 2>/dev/null
EOF

chmod +x /usr/local/bin/dockersh

# crontask to kill old docker
cat <<\EOF >>/etc/cron.hourly/kill-docker.sh
#!/bin/bash
docker ps --format='{{.ID}}' | \
  xargs -n 1 -r docker inspect -f '{{.ID}} {{.State.Running}} {{.State.StartedAt}}' | \
  awk '$2 == "true" && $3 <= "'$(date -d '30 minutes ago' -Ins --utc | sed 's/+00:00/Z/')'" {print $1}' | \
  xargs -r docker kill && \
  docker system prune -f
EOF

chmod +x /etc/cron.hourly/kill-docker.sh

cat <<\EOF >> /etc/crontab
* * * * * root docker system prune -f
* * * * * root /etc/cron.hourly/kill-docker.sh
EOF

# KOSTYIL BLYAT
# file to store ip addr..
touch /var/tmp/addr
chmod 777 /var/tmp/addr

# level passwords
echo "suzen1:suzen1" | chpasswd
echo "suzen2:ZGFpejZhaFJhZVNhZXhhaWJ1YWYK" | chpasswd
echo "suzen3:dGhlaWxpM2FoWm9odGFpM2VldzMK" | chpasswd
echo "suzen4:Y284ZWlxdXVlMmllTDNpZXBoNWUK" | chpasswd
echo "suzen5:C2HLBODHAER1ZMLLBNV1AGFPOW4K" | chpasswd
echo "suzen6:dmVlNFdvaE42ZWVoMFpvN3dhcGgK" | chpasswd
echo "suzen7:YmllMWVraUQ0YWlxdWU5a2VpcGgK" | chpasswd
echo "suzen8:b2hmZWFiZW9HYWl2YWVidThnYWUK" | chpasswd
echo "suzen9:dmFlSmFpcGhvaGI4Y29oZ2gxeWEK" | chpasswd
echo "suzen10:aWVyNWVvOGluM21haDBRdWFobTkK" | chpasswd

cat <<\EOF >> /etc/ssh/sshd_config
Match User suzen*
        X11Forwarding no
        AllowTcpForwarding no
        AllowAgentForwarding no
        GatewayPorts no
        PermitTunnel no
        ForceCommand /sbin/nologin
EOF

cat <<\EOF >> /etc/ssh/ssh_config
    ForwardX11 no
    ForwardX11Trusted no
    ForwardAgent no
    AllowTcpForwardingForUsers no
    AllowTcpForwardingForGroups no
    AllowTcpForwarding no
    ClearAllForwardings yes
    GatewayPorts no
    LogLevel QUIET
    NoHostAuthenticationForLocalhost yes
    PermitLocalCommand no
    RequestTTY no
    Tunnel no
    PermitTunnel no
    BatchMode no
    Protocol 2
    ExitOnForwardFailure yes
EOF

cat <<\EOF >> /etc/docker/daemon.json
{
  "storage-driver": "devicemapper"
}
EOF
