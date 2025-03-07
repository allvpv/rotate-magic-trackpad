Install XCode from AppStore. Then run the following commands in terminal:

```
clang rotate.m                          \
    -F/System/Library/PrivateFrameworks \
    -framework MultitouchSupport        \
    -isysroot `xcrun --show-sdk-path`   \
    -fmodules                           \
    -o rotate

./rotate
```

This API was once exposed in Mac OS settings, but now you have to trigger the
rotation by yourself.

I have not reversed engineer this, there are many online forums where this is
explained. But I couldn’t find a simple `.m` file ready to compile and run. So
here it is. Enjoy!
