#!/bin/sh

settings_file="./_settings"

. $settings_file

echo "Deleting \"$APP_ID\" from MiCADO at $MICADO_MASTER..."
curl --insecure -s -X DELETE -u "$SSL_USER":"$SSL_PASS" https://$MICADO_MASTER:$MICADO_PORT/toscasubmitter/v1.0/app/undeploy/$APP_ID | jq
