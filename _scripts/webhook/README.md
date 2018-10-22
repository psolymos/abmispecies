

## basic setup

Make build script executable

```
cd /home/solymos/repos/abmispecies/_scripts
sudo cp build.sh /usr/local/bin/redeploy.sh
cd /usr/local/bin
sudo chmod u+x redeploy.sh
```

now we can run webhook

```
/home/solymos/go/bin/webhook -hooks /home/solymos/repos/abmispecies/_scripts/hooks.json -verbose
```

## webhook setup in the background

taken from https://github.com/adnanh/webhook/issues/117

For Ubuntu 16.04 LTS, in `/lib/systemd/system/webhook.service` put

```
[Unit]
Description=Webhook service
Wants=network.target

[Service]
WorkingDirectory=/your/go/path/bin
User=root
ExecStart=/home/solymos/bin/startwebhook.sh
ExecStop=/home/solymos/bin/stopwebhook.sh
ExecReload=/home/solymos/bin/restartwebhook.sh
Restart=always
RestartSec=15

[Install]
WantedBy=multi-user.target
```

in `/home/your/username` create files
`touch startwebhook.sh`,
`touch stopwebhook.sh`,
`touch restartwebhook.sh`.

Now edit files; `startwebhook.sh`:

```
#!/bin/bash
/path/to/webhook -hooks path/to/webhook/jsonfile -nopanic
```

`stopwebhook.sh`:

```
#!/bin/bash
pkill webhook
```

`restartwebhook.sh`:

```
#!/bin/bash
pkill webhook && /path/to/webhook -hooks path/to/webhook/jsonfile -nopanic
```

Now permissions:

```
chmod 755 startwebhook.sh && chmod 755 stopwebhook.sh && chmod 755 restartwebhook.sh
```






