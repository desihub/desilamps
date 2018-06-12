#!/bin/sh

HOST=$1

snmpwalk -v2c -On -c public $HOST .1.3.6.1.4.1.13742.6.3 > /tmp/out
snmpwalk -v2c -On -c public $HOST .1.3.6.1.4.1.13742.6.4 >> /tmp/out
snmpwalk -v2c -On -c public $HOST .1.3.6.1.4.1.13742.6.5 >> /tmp/out

mv /tmp/out $2

