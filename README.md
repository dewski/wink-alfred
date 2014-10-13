# Wink Alfred Extension

Control your Wink Hub with Alfred.

## Installation

Since Alfred's Workflows uses sytem ruby you'll need to do some manual work to
get the environment working.

```
sudo gem install wink-0.0.1.gem
```

You'll need to obtain your Wink access token and refresh token by [signing in to their API](http://docs.wink.apiary.io/#oauth):

```
curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --data-binary '{
    "client_id": "goes here",
    "client_secret": "goes here",
    "username": "your@email.com",
    "password": "yourpassword",
    "grant_type": "password"
}' https://winkapi.quirky.com/oauth2/token
```

Then add your credentials to `~/.profile`:

```
# Wink
export WINK_CLIENT_ID=
export WINK_CLIENT_SECRET=
export WINK_ACCESS_TOKEN=
export WINK_REFRESH_TOKEN=
```

To finish just reload your profile with `. ~/.profile`

## Supported Commands

### Binary Switches

```
$ bin/wink binary-switches on 4443
Porch Light turned on
$ bin/wink binary-switches off 4443
Porch Light turned off
```

### Light Bulbs

```
$ bin/wink light-bulbs on 4443
Kitchen Light turned on
$ bin/wink light-bulbs on 4443 --dim=0.5
Kitchen Light turned on
$ bin/wink light-bulbs off 4443
Kitchen Light turned off
```

### Garage Doors

```
$ bin/wink garage-doors open 4443
Garage Door is opening
$ bin/wink garage-doors close 4443
Garage Door is closing
```
