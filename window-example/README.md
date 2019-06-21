# How to compile?

    clang++ -fobjc-arc -fmodules AppDelegate.m main.m

* -fobjc-arc: enables ARC
* -fmodules: enables modules so you can import with `@import AppKit;`
* -mmacosx-version-min=10.6: support older OS X versions, this might increase the binary size
