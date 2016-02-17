#!/bin/bash -eux

AC2LIBS_PATH="/opt/Ubiquiti/AirControl2/lib:/opt/Ubiquiti/AirControl2/lib/amd64"

cd /opt/Ubiquiti/AirControl2/lib
exec java -Xmx1024m -Djava.library.path="$AC2LIBS_PATH" -cp "./*" com.ubnt.ac.backend.AirServerLauncher
