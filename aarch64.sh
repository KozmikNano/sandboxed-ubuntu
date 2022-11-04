sudo apt-get install qemu binfmt-support qemu-user-static -y
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker build -t ubuntu-arm64-dev .
docker run -d --name ubuntu-arm64-dev -p 2200:22 -e PSWD=password -v ubuntu-data:/data ubuntu-arm64-dev
ssh -p 2200 root@localhost
