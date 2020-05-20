strace curl -k -u "token-w2gqm:jctz6nmx7bcrsvln5bxpfsjpb2njvthp47tdsplrv6ht5rkx6hv2s6" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{"deleteLocalData":false, "force":false, "gracePeriod":-1, "ignoreDaemonSets":true, "timeout":60}' \
'https://brad.do.support.rancher.space/v3/nodes/local:machine-pq42q?action=drain'
