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
  self.drawingView = [[[PMGMLDrawingView alloc] initWithFrame:CGRectMake(0,0,320,344)] autorelease];

  UIButton* doneButton = [[[UIButton alloc] initWithFrame:CGRectMake(106,422,214,38)] autorelease];
  [doneButton setTitle:@"upload to 000000book" forState:UIControlStateNormal];
  [doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [doneButton setTitleColor:[UIColor colorWithRed:1.0f green:0.941f blue:0.0f alpha:1.0f] forState:UIControlStateHighlighted];
  doneButton.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8f];
  doneButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  [doneButton addTarget:self action:@selector(uploadTag) forControlEvents:UIControlEventTouchUpInside];

  UIButton* cancelButton = [[[UIButton alloc] initWithFrame:CGRectMake(0,422,105,38)] autorelease];
  [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
  [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [cancelButton setTitleColor:[UIColor colorWithRed:1.0f green:0.941f blue:0.0f alpha:1.0f] forState:UIControlStateHighlighted];
  cancelButton.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8f];
  cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  [cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];

  /* Colors */
  UIView* colorContainer = [[[UIView alloc] initWithFrame:CGRectMake(0,344,320,38)] autorelease];
  colorContainer.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8f];

  UILabel* colorLabel = [[[UILabel alloc] initWithFrame:CGRectMake(7,2,100,34)] autorelease];
  colorLabel.text = @"color";
  colorLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  colorLabel.backgroundColor = [UIColor clearColor];
  colorLabel.textColor = [UIColor whiteColor];
  [colorContainer addSubview:colorLabel];

  UIButton* blackButton = [[[UIButton alloc] initWithFrame:CGRectMake(279,2,34,34)] autorelease];
  blackButton.backgroundColor = [UIColor blackColor];
  [blackButton addTarget:self action:@selector(makeStrokesBlack) forControlEvents:UIControlEventTouchUpInside];
  [colorContainer addSubview:blackButton];
  UIButton* whiteButton = [[[UIButton alloc] initWithFrame:CGRectMake(240,2,34,34)] autorelease];
  whiteButton.backgroundColor = [UIColor whiteColor];
  [whiteButton addTarget:self action:@selector(makeStrokesWhite) forControlEvents:UIControlEventTouchUpInside];
  [colorContainer addSubview:whiteButton];
  UIButton* yellowButton = [[[UIButton alloc] initWithFrame:CGRectMake(201,2,34,34)] autorelease];
  yellowButton.backgroundColor = [UIColor colorWithRed:1.0f green:0.941f blue:0.0f alpha:1.0f];
  [yellowButton addTarget:self action:@selector(makeStrokesYellow) forControlEvents:UIControlEventTouchUpInside];
  [colorContainer addSubview:yellowButton];
  UIButton* pinkButton = [[[UIButton alloc] initWithFrame:CGRectMake(162,2,34,34)] autorelease];
  pinkButton.backgroundColor = [UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f];
  [pinkButton addTarget:self action:@selector(makeStrokesPink) forControlEvents:UIControlEventTouchUpInside];
  [colorContainer addSubview:pinkButton];

  UIView* keywordsContainer = [[[UIView alloc] initWithFrame:CGRectMake(0,383,320,38)] autorelease];
  keywordsContainer.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.8f];
  UILabel* keywordsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(7,2,100,34)] autorelease];
  keywordsLabel.text = @"keywords";
  keywordsLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  keywordsLabel.backgroundColor = [UIColor clearColor];
  keywordsLabel.textColor = [UIColor whiteColor];
  [keywordsContainer addSubview:keywordsLabel];

  [self.view addSubview:self.drawingView];
  [self.view addSubview:doneButton];
  [self.view addSubview:cancelButton];
  [self.view addSubview:keywordsContainer];
  [self.view addSubview:colorContainer];
}

-(void) dismiss {
  [self.delegate captureViewControllerDidCancelCapture:self];
}

-(void) uploadTag {
  [self.delegate captureViewController:self didCaptureTag:[self.drawingView gmlRepresentation]];
}

-(void) makeStrokesPink {
  self.drawingView.strokeColor = kPMGMLStrokeColorPink;
}
-(void) makeStrokesYellow {
  self.drawingView.strokeColor = kPMGMLStrokeColorYellow;
}
-(void) makeStrokesWhite {
  self.drawingView.strokeColor = kPMGMLStrokeColorWhite;
}
-(void) makeStrokesBlack {
  self.drawingView.strokeColor = kPMGMLStrokeColorBlack;
}


@end
