## Jackett-Docker

Jackett works as a proxy server: it translates queries from apps ([Sonarr](https://github.com/Sonarr/Sonarr), [Radarr](https://github.com/Radarr/Radarr), [SickRage](https://sickrage.github.io/), [CouchPotato](https://couchpota.to/), [Mylar](https://github.com/evilhero/mylar), [Lidarr](https://github.com/lidarr/lidarr), [DuckieTV](https://github.com/SchizoDuckie/DuckieTV), [qBittorrent](https://www.qbittorrent.org/), [Nefarious](https://github.com/lardbit/nefarious) etc.) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.
## Getting Started

* [Wiki](https://github.com/Jackett/Jackett/wiki)
* [Definition format](https://github.com/Jackett/Jackett/wiki/Definition-format)
* [Troubleshooting](https://github.com/Jackett/Jackett/wiki/Troubleshooting)

## Bulding

```shell
git clone https://github.com/Dofamin/Jackett-Docker.git /srv/Jackett/

docker build /srv/Jackett/ --tag jackett 

docker rm --force Jackett

docker create \
  --name=Jackett \
  -p 9117:9117/tcp \
  -p 9117:9117/udp \
  -e AUTO_UPDATE=true \
  -v /srv/Jackett/container-image-root/:/home/Jackett/.config/Jackett/\
  --restart unless-stopped \
  jackett:latest

docker start Jackett
```

## Screenshots

![screenshot](https://raw.githubusercontent.com/Jackett/Jackett/master/.github/jackett-screenshot1.png)

![screenshot](https://raw.githubusercontent.com/Jackett/Jackett/master/.github/jackett-screenshot2.png)

![screenshot](https://raw.githubusercontent.com/Jackett/Jackett/master/.github/jackett-screenshot3.png)

[inviteneeded]: https://raw.githubusercontent.com/Jackett/Jackett/master/.github/label-inviteneeded.png

---

### [Official Jackett GitHub Repository](https://github.com/Jackett/Jackett)
