#!/bin/sh

settings_file="./_settings"

. $settings_file

echo "Submitting Sleep to MiCADO at $MICADO_MASTER with appid \"$APP_ID\"..."
curl --insecure -s -F file=@"$ADT_FILENAME" -F id=$APP_ID -X POST -u "$SSL_USER":"$SSL_PASS" https://$MICADO_MASTER:$MICADO_PORT/toscasubmitter/v1.0/app/launch/ | jq