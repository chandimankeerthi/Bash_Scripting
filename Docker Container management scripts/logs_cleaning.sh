#!/bin/bash
# created by  Chandiman Keerthi
# dmo_env_logs_clearing : Owned By Implementation Team
#Do not make any chages without Informing to the Responsible Persons

logs_path=/apps/test/ibl/logs/
echo ""
echo "Initialized logs clearing..."
echo ""
echo "previous storage allocation..."
echo ""
du -sh $logs_path*
echo ""
echo "clearing the logs.."
echo ""
find $logs_path -type f -name '*.*' -delete
echo ""
echo "current storage allocation..."
du -sh $logs_path*
echo ""
echo "completed the logs clearing..."
