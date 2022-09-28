# dotdotpwn-docker
Dockerfile for [dotdotpwn - The Directory Traversal Fuzzer](https://github.com/wireghoul/dotdotpwn)

# Build
```
docker build .
```

# Run
```
docker run --rm -it <IMAGE-ID>
```

# Build and Run
```
docker run --rm -it $(docker build -q .)
```

# Usage

## Scan a URL

The following uses the `http-url` module of dotdotpwn to scan a specific URL that is accessible
to the container and specifically fuzzes only the URL fragment *after* the `/public` param:

```
docker run --rm -it --name dotdotpwn $(docker build -q .) -m http-url -k "localhost" -f /etc/hosts -t 50 -b -u http://10.100.102.9:3112/public/TRAVERSAL
```

## Scan another docker container

Assuming the other container has a --name of `container` and a --network of `network`:

```
docker run --rm -it --network network --name dotdotpwn $(docker build -q .) -m http -h container
```

# Save reports
* dotdotpwn saves reports to a directory called `Reports`
* You have to create a directory and mount it into the docker container to store the report on the host machine
```
mkdir Reports
```
```
docker run --rm -it --network network --name dotdotpwn -v $(pwd)/Reports:/dotdotpwn/Reports $(docker build -q .) -m http -h container
```

# Author

Liran Tal <liran.tal@gmail.com>

Adopted from Jan Hapke's original Dockerfile setup at https://github.com/janhapke/dotdotpwn-docker
