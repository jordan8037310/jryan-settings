#!/bin/bash

# Run a s3cmd backup of local FreeNAS server to the cloud

ssh -T root@192.168.1.210 << EOF
  jexec 6
  s3cmd sync /vault/movies/ s3://jmryan-freenas/movies/ --verbose'
EOF
