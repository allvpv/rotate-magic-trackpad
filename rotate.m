#include <CoreFoundation/CoreFoundation.h>
#include <Foundation/Foundation.h>

typedef void *MTDeviceRef;

MTDeviceRef MTDeviceCreateDefault();
NSMutableArray* MTDeviceCreateList();
void MTDeviceSetSurfaceOrientation(MTDeviceRef, int);
bool MTDeviceIsBuiltIn(MTDeviceRef device);

int main() {
  NSMutableArray* deviceList = MTDeviceCreateList();

  for (int i = 0; i < [deviceList count]; i++) {
    MTDeviceRef device = [deviceList objectAtIndex:i];

    if (!MTDeviceIsBuiltIn(device)) {
      MTDeviceSetSurfaceOrientation(device, 2);
    }
  }

  return 0;
}
