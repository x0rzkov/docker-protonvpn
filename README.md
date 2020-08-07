# ProtonVPN Docker Container

Docker Container for running the ProtonVPN service.

Edit the configuration file `config.sh` and then build the image with:

```sh
docker image build . -t protonvpn-docker
```

To `run` the image:

```sh
docker-compose run --service-ports protonvpn-docker
```

If there is an error about `iptables` you can try:

```sh
sudo modprobe ip6table_filter
```

on the host (see https://ilhicas.com/2018/04/08/Fixing-do-you-need-insmod.html)

To test, run

```sh
curl -x socks5h://127.0.0.1:1080 https://www.cloudflare.com
```

Docker Build!
