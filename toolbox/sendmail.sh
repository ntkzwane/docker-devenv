#!/bin/bash
curl --url "smtp://..." --ssl-reqd \
  --mail-from "sender@mailman.com" --mail-rcpt "recipient@mailman.com" \
  --upload-file mail.txt --user "user:password" --insecure
