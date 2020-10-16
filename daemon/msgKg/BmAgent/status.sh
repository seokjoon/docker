#!/bin/sh

JAVA_HOME=/usr/jdk/jdk1.6.0_29/bin/java

export JAVA_HOME

$JAVA_HOME -classpath ./BmAgent.jar bm.Agent status

