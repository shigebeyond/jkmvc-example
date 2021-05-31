# 基础镜像
FROM ubuntu

# 描述
MAINTAINER jkmvc-example

# 定义匿名数据卷
VOLUME /home/shi/test/java

# 解压与复制Java zip
ADD /home/shi/setup/java/jdk/jdk-8u172-linux-x64.tar.gz /usr/local

# 复制app目录
ADD build/libs/app /app

# 配置 JDK 的环境变量和字符集
ENV JAVA_HOME /usr/local/jdk1.8.0_172
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV LANG C.UTF-8

# 暴露端口, 跟jetty.yaml端口一样
EXPOSE 8082

# 启动命令
ENTRYPOINT ["/app/start-jetty.sh"]