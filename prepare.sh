#!/bin/bash

# add custom shell to config
if ! $(grep --quiet "/usr/local/bin/dockersh" /etc/shells); then
  echo "/usr/local/bin/dockersh" >> /etc/shells
fi

# create users
for ((userid=1;userid<11;userid++)); do
  useradd -m -G docker -s /usr/local/bin/dockersh suzen${userid}
  #echo "suzen${userid}:suzen${userid}" | chpasswd
  touch /home/suzen${userid}/.hushlogin && chown suzen${userid}:suzen${userid} /home/suzen${userid}/.hushlogin
done

# make shell
echo -e "#!/bin/bash\n/usr/bin/docker run -ti --rm --cpus=".2" --memory=50m --kernel-memory=50m --pids-limit=50 --stop-timeout=3600 --storage-opt size=11G ctf.school:5000/suzenescape/$(whoami) 2>/dev/null" > /usr/local/bin/dockersh
chmod +x /usr/local/bin/dockersh

# crontask to kill old docker
echo -e "#!/bin/bash\ndocker ps --format='{{.ID}}' | xargs -n 1 -r docker inspect -f '{{.ID}} {{.State.Running}} {{.State.StartedAt}}' | awk '\$2 == \"true\" && \$3 <= \"'\$(date -d '1 hour ago' -Ins --utc | sed 's/+00:00/Z/')'\" {print \$1}' | xargs -r docker kill" > /etc/cron.hourly/kill-docker.sh
chmod +x /etc/cron.hourly/kill-docker.sh

# level passwords
echo "suzen2:ZGFpejZhaFJhZVNhZXhhaWJ1YWYK" | chpasswd
echo "suzen3:dGhlaWxpM2FoWm9odGFpM2VldzMK" | chpasswd
echo "suzen4:Y284ZWlxdXVlMmllTDNpZXBoNWUK" | chpasswd
echo "suzen5:ZGFPTMD1OGXVBZVMZWI2BXUXZGEK" | chpasswd
echo "suzen6:dmVlNFdvaE42ZWVoMFpvN3dhcGgK" | chpasswd
echo "suzen7:YmllMWVraUQ0YWlxdWU5a2VpcGgK" | chpasswd
echo "suzen8:b2hmZWFiZW9HYWl2YWVidThnYWUK" | chpasswd
echo "suzen9:dmFlSmFpcGhvaGI4Y29oZ2gxeWEK" | chpasswd
echo "suzen10:aWVyNWVvOGluM21haDBRdWFobTkK" | chpasswd


###
old#
###

#echo "suzen2:b29iYWh0YUJpcGFlTW9vNWVpYmUK" | chpasswd
#echo "suzen3:RW9XYWh5ZWlmYWhwMWVxdWFoZ2kK" | chpasswd
#echo "suzen4:YU0xY2hpNmppbzd6ZXVzaDhlZW4K" | chpasswd
#echo "suzen5:ZGFpTmd1OGxvbzVmZWI2bXUxZGEK" | chpasswd
#echo "suzen6:aWVqOU9vbmFldDhyYXBoN2hlOUcK" | chpasswd
#echo "suzen7:YWljZWVRdWVSb2dhc2gxYWVyZWMK" | chpasswd
#echo "suzen8:b2hzaGFlSjFMb2hjaG9vNVNob28K" | chpasswd
#echo "suzen9:bm9oMHVjMktlc2gxZ2llOG5haTYK" | chpasswd

## sshd_config:
#Match User *
#        X11Forwarding no
#        AllowTcpForwarding no
#        AllowAgentForwarding no
#        GatewayPorts no
#        PermitTunnel no
#        Protocol 2
#        #PermitTTY no
#        ForceCommand /sbin/nologin
#
## ssh_config:
#    SendEnv LANG LC_*
#    HashKnownHosts yes
#    GSSAPIAuthentication yes
#    ForwardX11 no
#    ForwardX11Trusted no
#    ForwardAgent no
#    AllowTcpForwardingForUsers no
#    AllowTcpForwardingForGroups no
#    AllowTcpForwarding no
#    ClearAllForwardings yes
#    GatewayPorts no
#    LogLevel QUIET
#    NoHostAuthenticationForLocalhost yes
#    PermitLocalCommand no
#    RequestTTY no
#    Tunnel no
#    PermitTunnel no
#    BatchMode no
#    Protocol 2
#    ExitOnForwardFailure yes


#/etc/docker/daemon.json
#{
#  "storage-driver": "devicemapper"
#}
