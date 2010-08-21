#import <Foundation/Foundation.h>
#import "PMViewController.h"
#import "CaptainHook.h"

CHDeclareClass(FourSquareAppDelegate);

CHMethod2(BOOL, FourSquareAppDelegate, application, id, app, didFinishLaunchingWithOptions, NSDictionary*, opts) {
  BOOL orig = CHSuper2(FourSquareAppDelegate, application, app, didFinishLaunchingWithOptions, opts);
  NSArray* originalVCs = [[self tabBarController] viewControllers];
  PMViewController* pmvc = [[PMViewController new] autorelease];
  UINavigationController* pmnvc = [[[UINavigationController alloc] initWithRootViewController:pmvc] autorelease];
  [[self tabBarController] setViewControllers:[originalVCs arrayByAddingObject:pmnvc] animated:NO];
  return orig;
}

CHConstructor {
  CHAutoreleasePoolForScope();
  CHLoadLateClass(FourSquareAppDelegate);
  CHHook2(FourSquareAppDelegate, application, didFinishLaunchingWithOptions);
}
