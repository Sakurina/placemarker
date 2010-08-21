#import "PMViewController.h"

@implementation PMViewController

-(id) init {
  if (self = [super init]) {
    self.title = @"PlaceMarker";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"About" style:UIBarButtonItemStylePlain target:self action:@selector(aboutButtonTapped)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tag" style:UIBarButtonItemStylePlain target:self action:@selector(tagButtonTapped)];
  }
  return self;
}

-(void) loadView {
  self.view = [UIView new];
}

-(void) viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithRed:1.0f green:0.941f blue:0.0f alpha:1.0f];
}

/* ----- */

-(void) aboutButtonTapped {
  UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"PlaceMarker"
                                               message:@"by Yanik Magnan (r-ch.net)\n\nHeavily inspired by the works of\nthe F.A.T Lab (fffff.at).\n\nDistributed under the ISC License\ngithub.com/Sakurina/placemarker"
                                              delegate:self
                                     cancelButtonTitle:@"Done"
                                     otherButtonTitles:nil];
  [av show];
}

-(void) alertView:(UIAlertView*)av clickedButtonAtIndex:(int)i {
  [av release];
}

-(void) tagButtonTapped {
  NSLog(@"Tag button tapped!");
}
@end
