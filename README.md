# Screen_orientation
Custom screen rotation ads for mobile targets.

# Installation

``haxelib install screen_orientation``

### Set up haxelib in .XML

``<haxelib name="screen_orientation" />``

### Example Use Extension (No Custom, no-custom FlxSubState):

```haxe

...
import Screen_orientation;

class Main extends Sprite
{
    public function new()
    {
        super();
        addChild(new FlxGame(0, 0, PlayState));

        /*Order parameters:
            1.- Title.
            2.- Message.
            3.- Graphic asset.
            4.- Back color (OPTIONAL).
            5.- Time to evaluate screen condition (OPTIONAL).
            6.- Inclination of the device (OPTIONAL). Range (0 to 1).
            7.- Custom FlxSubstate (OPTIONAL).
        */

        Screen_orientation.DetectOrientationDevice("Rotate to Landscape", "touch to close", "assets/images/icon.png", FlxColor.GREEN, 0.5, 0.5, null);
    }
}

```

### Example Use Extension (Custom FlxSubState):

```haxe

...
...
import Screen_orientation;

class Main extends Sprite
{
    public function new()
    {
        super();
        addChild(new FlxGame(0, 0, PlayState));

        /*Order parameters:
            Respect the type of data in each parameter. It is mandatory to pass the instance of a FlxSubState class already programmed by the developer.
        */

        Screen_orientation.DetectOrientationDevice("", "", "", null, 0.5, 0.5, new YourCustomClassFlxSubState());
    }
}

```

### Note: On Apple devices vary the graduation of the range of inclination of the device.


### License

The MIT License (MIT) - LICENSE.md

Copyright © 2019 MilköGames (http://www.milkogames.xyz)

Author: Nicolás Capel
