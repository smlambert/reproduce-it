# Build and rebuild Temurin to test if its reproducible

export TEST_JDK_HOME=/usr
export VENDOR_TEST_REPOS=https://github.com/sophia-guo/openjdk-build.git
export VENDOR_TEST_BRANCHES=mac
export VENDOR_TEST_DIRS=test
export BUILD_LIST=system/reproducibleCompare

git clone https://github.com/adoptium/aqa-tests.git

cd aqa-tests
./get.sh
cd TKG
make compile

make _Rebuild_Same_JDK_Reproducibility_Test_Mac

