#!/bin/sh

settings_file="./_settings"

. $settings_file

echo "Updating $APP_ID in MiCADO at $MICADO_MASTER..."
curl --insecure -s -F file=@"$ADT_FILENAME" -X PUT -u "$SSL_USER":"$SSL_PASS" https://$MICADO_MASTER:$MICADO_PORT/toscasubmitter/v1.0/app/update/$APP_ID | jq
