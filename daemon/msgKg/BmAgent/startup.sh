#!/bin/sh

JAVA_HOME=/usr/jdk/jdk1.6.0_29/bin/java

export JAVA_HOME

nohup $JAVA_HOME -classpath ./BmAgent_lib/*:./BmAgent.jar bm.Agent start 1>/dev/null 2>&1 &

