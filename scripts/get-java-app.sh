mkdir -p target
git clone https://github.com/francescodonnini/query.git tmp-query
cd tmp-query
mvn clean package && cp ./target/uber-jar-with-dependencies.jar ../target/
cd ..
rm -rf tmp-query