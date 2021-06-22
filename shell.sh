#!/bin/sh
#kill tomcat
export BUILD_ID=apache-tomcat-8.5.53_build_id

# shellcheck disable=SC2006
pidlist=`ps -ef|grep apache-tomcat-8.5.53|grep -v "grep"|awk '{print$2}'`
stop() {
  if [ "$pidlist" == "" ]; then
    echo "tomcat已经关闭"
  else
    echo "tomcat进程号：$pidlist"
    kill -9 $pidlist
    echo "KILL $pidlist"
  fi
}
stop
pidlist2='ps -ef|grep apache-tomcat-8.5.53|grep -v "grep"|awk '{print$2}''
if [ "$pidlist2" == "" ] ; then
    echo "tomcat关闭成功"
  else
    echo "tomcat关闭失败"
fi
rm -rf /usr/tomcat/apache-tomcat-8.5.53/webapps/ROOT*
cp -r /var/lib/jenkins/workspace/enjoy-git/target/demo-0.0.1-SNAPSHOT.war /usr/tomcat/apache-tomcat-8.5.53/webapps
sleep 3s
mv /usr/tomcat/apache-tomcat-8.5.53/webapps/demo-0.0.1-SNAPSHOT.war /usr/tomcat/apache-tomcat-8.5.53/webapps/ROOT.war
cd /usr/tomcat/apache-tomcat-8.5.53/bin
./startup.sh