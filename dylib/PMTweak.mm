#import <Foundation/Foundation.h>
#import "PMViewController.h"
#import "PMFoursquareProxy.h"
#import "CaptainHook.h"

CHDeclareClass(FourSquareAppDelegate);

static PMFoursquareProxy* fsq_proxy = nil;

@implementation PMFoursquareProxy
@synthesize fakeCheckin;

+(PMFoursquareProxy*) sharedInstance {
  if (fsq_proxy == nil)
    fsq_proxy = [[PMFoursquareProxy alloc] init];
  return fsq_proxy;
}

-(BOOL) isCheckedIn {
  if (fakeCheckin)
    return YES;
  return [[[[[UIApplication sharedApplication] delegate] friendsController] currentPlace] venueid] != nil;
}

-(NSString*) currentVenueID {
  if (fakeCheckin)
    return @"1588849";  // college's science building venue ID
  return [[[[[UIApplication sharedApplication] delegate] friendsController] currentPlace] venueid];
}
@end

/* HOOKS */

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
