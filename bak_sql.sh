#!/bin/bash
mysqldump -uroot -p123456 -h 10.1.1.3 -P 3310 --databases market_emotion > marketemo.sql
