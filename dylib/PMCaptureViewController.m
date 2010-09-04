#import "PMCaptureViewController.h"

@implementation PMCaptureViewController
@synthesize drawingView,delegate;

-(id) init {
  if (self = [super init]) {
    self.title = @"Tag";
    self.drawingView = nil;
    self.delegate = nil;
  }
  return self;
}

-(void) loadView {
  self.view = [UIView new];
}

-(void) viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f];
  self.drawingView = [[[PMGMLDrawingView alloc] initWithFrame:CGRectMake(0,0,320,346)] autorelease];

  UIButton* doneButton = [[[UIButton alloc] initWithFrame:CGRectMake(106,422,214,38)] autorelease];
  [doneButton setTitle:@"upload to 000000book" forState:UIControlStateNormal];
  [doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [doneButton setTitleColor:[UIColor colorWithRed:1.0f green:0.941f blue:0.0f alpha:1.0f] forState:UIControlStateHighlighted];
  doneButton.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8f];
  doneButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  [doneButton addTarget:self action:@selector(uploadTag) forControlEvents:UIControlEventTouchUpInside];

  UIButton* cancelButton = [[[UIButton alloc] initWithFrame:CGRectMake(0,422,106,38)] autorelease];
  [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
  [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [cancelButton setTitleColor:[UIColor colorWithRed:1.0f green:0.941f blue:0.0f alpha:1.0f] forState:UIControlStateHighlighted];
  cancelButton.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8f];
  cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  [cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.drawingView];
  [self.view addSubview:doneButton];
  [self.view addSubview:cancelButton];
}

-(void) dismiss {
  [self.delegate captureViewControllerDidCancelCapture:self];
}

-(void) uploadTag {
  [self.delegate captureViewController:self didCaptureTag:[self.drawingView gmlRepresentation]];
}

@end
