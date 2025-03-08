#include <CoreFoundation/CoreFoundation.h>
#include <Foundation/Foundation.h>

typedef void *MTDeviceRef;

MTDeviceRef MTDeviceCreateDefault();
NSMutableArray* MTDeviceCreateList();
void MTDeviceSetSurfaceOrientation(MTDeviceRef, int);
bool MTDeviceIsBuiltIn(MTDeviceRef device);
void MTDeviceGetFamilyID(MTDeviceRef, int*);

#define ORIENTATION_NORMAL 0
#define ORIENTATION_REVERSED 2


int main(int argc, char** argv) {
  NSMutableArray* deviceList = MTDeviceCreateList();

  printf("Called with %d arguments\n", argc);
  bool resetOrientation = argc == 2 && strcmp(argv[1], "reset") == 0;

  for (int i = 0; i < [deviceList count]; i++) {
    MTDeviceRef device = [deviceList objectAtIndex:i];
    int familyID;

    if (!MTDeviceIsBuiltIn(device)) {
      printf("External device [%p]\n", (int*) device);
      MTDeviceGetFamilyID(device, &familyID);

      if (familyID == 128) {
        printf("Magic Trackpad 1, the trick should work\n");
      } else if (familyID == 129 || familyID == 130) {
        printf("Magic Trackpad 2 or 3, this probably won't work\n");
      } else {
        printf("Magic Mouse, the trick probably won't work\n");
      }

      if (resetOrientation) {
        MTDeviceSetSurfaceOrientation(device, ORIENTATION_NORMAL);
        printf("Orientation set to ORIENTATION_NORMAL\n");
      } else {
        MTDeviceSetSurfaceOrientation(device, ORIENTATION_REVERSED);
        printf("Orientation set to ORIENTATION_REVERSED\n");
      }

    } else {
      printf("Internal device [%p], skipping\n", (int*) device);
    }
  }

  return 0;
}
