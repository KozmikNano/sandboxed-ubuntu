# Sandboxed Ubutnu CLI (Docker)
A compilation of docker images for running an alternative architecture of ubuntu shell
___


## aarch64 Ubtunu (latest)
1. Run the script
```bash
chmod +x aarch64.sh
./aarch64.sh
```
___
### Alternativly you can do the following
1. Start by installing packages
```bash 
sudo apt-get install qemu binfmt-support qemu-user-static
```
2. Setup the registering scripts
```bash
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```
3. Build the ubuntu image
```bash
docker build -t ubuntu-arm64-dev .
```
4. Start the image
```bash
# Run it with the password: `password` and port: `2200`
docker run -d --name ubuntu-arm64-dev -p 2200:22 -e PSWD=password -v ubuntu-data:/data ubuntu-arm64-dev
```
5. Open the shell via ssh
```bash
ssh -p 2200 root@localhost
```