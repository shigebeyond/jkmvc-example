# 引入缺失的jar
# gradle war插件在打包时会忽略掉javax.servlet-api-3.1.0.jar, 而我直接启动jetty又需要他

# 在build/app/中执行
# cd build/app/
mkdir tmp
mv jkmvc-example-1.9.0.war tmp/
cd tmp/
# 解压
jar -xvf jkmvc-example-1.9.0.war 
rm jkmvc-example-1.9.0.war 
# 复制javax.servlet-api-3.1.0.jar
cp /home/shi/.m2/repository/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar WEB-INF/lib/
cd ..
# 重新打包
jar -cvf jkmvc-example-1.9.0.war tmp/
