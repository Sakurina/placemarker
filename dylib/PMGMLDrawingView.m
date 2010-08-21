#import "PMGMLDrawingView.h"
#import "PMGMLStroke.h"

#define POINT(x) (CGPoint)([((NSValue*)(x)) CGPointValue])
@implementation PMGMLDrawingView
@synthesize strokeColor, strokes;

-(id) init {
  if (self = [super init]) {
    self.backgroundColor = kPMGMLStrokeColorYellow;
    self.strokeColor = kPMGMLStrokeColorPink;
    self.strokes = [NSMutableArray array];
    self.userInteractionEnabled = YES;
  }
  return self;
}
-(id) initWithFrame:(CGRect)r {
  if (self = [super initWithFrame:r]) {
    self.backgroundColor = kPMGMLStrokeColorYellow;
    self.strokeColor = kPMGMLStrokeColorPink;
    self.strokes = [NSMutableArray array];
    self.userInteractionEnabled = YES;
  }
  return self;
}

-(BOOL) isMultiTouchEnabled { return NO; }

-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  CGPoint pt = [[touches anyObject] locationInView:self];
  PMGMLStroke* stroke = [PMGMLStroke strokeWithColor:self.strokeColor];
  [stroke addPoint:pt];
  [self.strokes addObject:stroke];
  [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  CGPoint pt = [[touches anyObject] locationInView:self];
  PMGMLStroke* stroke = [self.strokes lastObject];
  [stroke addPoint:pt];
  [self setNeedsDisplay];
}

-(void) drawRect:(CGRect)r {
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(ctx, 4.0f);

  for (PMGMLStroke* stroke in self.strokes) {
    [stroke.strokeColor set];
    if (stroke.points.count < 2) continue;
    for (int i=0; i<(stroke.points.count - 1); i++) {
      CGPoint pt1 = POINT([stroke.points objectAtIndex:i]);
      CGPoint pt2 = POINT([stroke.points objectAtIndex:i+1]);
      CGContextMoveToPoint(ctx, pt1.x, pt1.y);
      CGContextAddLineToPoint(ctx, pt2.x, pt2.y);
      CGContextStrokePath(ctx);
    }
  }
}

-(NSString*) gmlRepresentation {
  NSMutableString* gml = [NSMutableString stringWithCapacity:5000];
  [gml appendString:@"<gml spec='0.1c'><tag>"];
  [gml appendFormat:@"<header><client><name>PlaceMarker</name><version>0.1</version></client><environment><screenBounds><x>%i</x><y>%i</y></screenBounds></environment></header>", self.bounds.size.width, self.bounds.size.height];
  [gml appendString:@"<drawing>"];
  for (PMGMLStroke* stroke in self.strokes) {
    [gml appendString:[stroke gmlRepresentationInView:self]];
  }
  [gml appendString:@"</drawing></tag></gml>"];
  return gml;
}

@end
