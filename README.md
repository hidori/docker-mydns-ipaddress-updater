# mydns-ipaddress-updater container image

Notify the IP address to MyDNS.jp

## USAGE

```bash
docker pull hidori/mydns-ipaddress-updater:latest
```

## EXAMPLE

```bash
docker run -it --rm -e ID=<YourID> -e PW=<YourPW> -e INTERVAL=5m hidori/mydns-ipaddress-updater
```
