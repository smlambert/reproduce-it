# Build and rebuild Temurin to test if its reproducible

# Create a workspace
mkdir workspace
cd workspace

# Download the latest Temurin JDK21 binary and its associated SBOM
echo "Fetch latest Temurin JDK 21"
curl -s -X 'GET' \ 
  'https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jdk/hotspot/normal/eclipse?project=jdk' \ 
  -H 'accept: */*' > temurin21.tar.gz

echo "Fetch latest Temurin SBOM for JDK 21"
curl -s -X 'GET' \ 
  'https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/sbom/hotspot/normal/eclipse?project=jdk' \ 
  -H 'accept: */*' > temurin21.json

tar -xvzf temurin21.tar.gz

docker run -v "$(PWD):/home/jenkins/test" -w "/home/jenkins/" -v "$(PWD):/home/jenkins/jdkbinary/" --name reproducibleCompare centos:7 /bin/bash /home/jenkins/test/linux_repro_build_compare.sh temurin21.json /home/jenkins/jdkbinary
docker cp reproducibleCompare:/home/jenkins/reprotest.diff ./
docker cp reproducibleCompare:/home/jenkins/reproJDK.tar.gz ./
docker container rm reproducibleCompare

