# Build and rebuild Temurin to test if its reproducible
curl -L -X 'GET' \
  "https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jdk/hotspot/normal/eclipse?project=jdk" > temurin21.tar.gz

echo "Uncompress the JDK binary"
mkdir jdk21
tar xvzf temurin21.tar.gz -C jdk21 --one-top-level
bindir=$(find jdk21 -name bin)
echo "bindir is  $bindir"
export TEST_JDK_HOME=$(realpath $bindir/..)
echo "$TEST_JDK_HOME"
export VENDOR_TEST_REPOS=https://github.com/adoptium/temurin-build.git
export VENDOR_TEST_BRANCHES=master
export VENDOR_TEST_DIRS=/test/system
export BUILD_LIST=system/reproducibleCompare

git clone https://github.com/adoptium/aqa-tests.git

cd aqa-tests
./get.sh -p x64_linux -r releases -j 21 --vendor_repos $VENDOR_TEST_REPOS --vendor_branches master --vendor_dirs $VENDOR_TEST_DIRS
cd TKG
make compile

make _Rebuild_Same_JDK_Reproducibility_Test
