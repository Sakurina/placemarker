#import "PMViewController.h"
#import "PMCaptureViewController.h"
#import "PMStubService.h"
#import "PMFoursquareProxy.h"

#define TagCountLabelTag 5730
#define VenueIDLabelTag 5731

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
  UILabel* upperLeft = [[[UILabel alloc] initWithFrame:CGRectMake(0,0,160,20)] autorelease];
  upperLeft.tag = TagCountLabelTag;
  upperLeft.backgroundColor = [UIColor clearColor];
  upperLeft.textColor = [UIColor blackColor];
  upperLeft.font = [UIFont boldSystemFontOfSize:10.0f];
  UILabel* upperRight = [[[UILabel alloc] initWithFrame:CGRectMake(160,0,160,20)] autorelease];
  upperRight.tag = VenueIDLabelTag;
  upperRight.backgroundColor = [UIColor clearColor];
  upperRight.textColor = [UIColor blackColor];
  upperRight.font = [UIFont boldSystemFontOfSize:10.0f];
  [self.view addSubview:upperLeft];
  [self.view addSubview:upperRight];

}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  // Is the user checked in?
  if (![[PMFoursquareProxy sharedInstance] isCheckedIn]) {
    // Tell the user he is not checked in and needs
    // to check in to use the service.
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Not Checked In"
                                                 message:@"Please check in to a venue to use PlaceMarker."
                                                delegate:self
                                       cancelButtonTitle:@"Okay"
                                       otherButtonTitles:nil];
    [av show];
    // TODO: For debug purposes, also add a fake checkin button.
    // For now, [PMFoursquareProxy sharedInstance].fakeCheckin = YES; works.
    return;
  }
  // User is checked in...
  // For debug purposes: display current venue ID in upper right corner.
  [[self.view viewWithTag:VenueIDLabelTag] setText:[@"Venue ID:" stringByAppendingString:[[PMFoursquareProxy sharedInstance] currentVenueID]]];
  // Fetch tags for venue
  NSArray* tags = [[PMStubService sharedInstance] tagsForVenueID:[[PMFoursquareProxy sharedInstance] currentVenueID]];
  // For debug purposes: display tag count in upper left corner
  [[self.view viewWithTag:TagCountLabelTag] setText:[NSString stringWithFormat:@"Tag Count: %i", tags.count]];
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
  PMCaptureViewController* dVC = [[PMCaptureViewController new] autorelease];
  dVC.delegate = self;
  [self presentModalViewController:dVC animated:YES];
}

-(void) captureViewController:(PMCaptureViewController*)dvc didCaptureTag:(NSString*)gml {
  [[PMStubService sharedInstance] uploadTag:gml forVenueID:[[PMFoursquareProxy sharedInstance] currentVenueID]];
  [self dismissModalViewControllerAnimated:YES];
}

-(void) captureViewControllerDidCancelCapture:(PMCaptureViewController*)dvc {
  [self dismissModalViewControllerAnimated:YES];
}

@end
