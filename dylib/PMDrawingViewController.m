#import "PMDrawingViewController.h"

@implementation PMDrawingViewController
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
  self.drawingView = [[[PMGMLDrawingView alloc] initWithFrame:CGRectMake(0,0,320,320)] autorelease];
  UIButton* doneButton = [[[UIButton alloc] initWithFrame:CGRectMake(0,325,320,155)] autorelease];
  [doneButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.drawingView];
  [self.view addSubview:doneButton];
}

-(void) dismiss {
  [self.delegate drawingViewController:self didScribbleTag:[self.drawingView gmlRepresentation]];
}

@end
