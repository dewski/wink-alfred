# Wink Alfred Extension

Control your Wink Hub with Alfred.

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
