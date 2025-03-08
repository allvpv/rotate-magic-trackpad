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

To reset the rotation, run the following command:

```
./rotate reset
```

This API was once exposed in Mac OS settings, but now you have to trigger the
rotation by yourself.

I have not reversed engineered this, there are several online threads where
this is briefly explained and several project, like
[Jitouch](https://github.com/JitouchApp/Jitouch-project),
which uses API of this private framework heavily. But I couldn’t find a simple
`.m` file ready to compile and run. So here it is. Enjoy!
