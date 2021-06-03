#!/bin/sh

settings_file="./_settings"

. $settings_file

echo "Fetching status info for $APP_ID from MiCADO at $MICADO_MASTER..."
curl --insecure -s -X GET -u "$SSL_USER":"$SSL_PASS" https://$MICADO_MASTER:$MICADO_PORT/toscasubmitter/v1.0/app/$APP_ID/status | jq
