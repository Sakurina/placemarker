#import "PMGMLDrawingView.h"
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
  NSMutableArray* stroke = [NSMutableArray array];
  [stroke addObject:[NSValue valueWithCGPoint:pt]];
  [self.strokes addObject:stroke];
  [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  CGPoint pt = [[touches anyObject] locationInView:self];
  NSMutableArray* stroke = [self.strokes lastObject];
  [stroke addObject:[NSValue valueWithCGPoint:pt]];
  [self setNeedsDisplay];
}

-(void) drawRect:(CGRect)r {
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  [self.strokeColor set];
  CGContextSetLineWidth(ctx, 4.0f);

  for (NSArray* stroke in self.strokes) {
    if (stroke.count < 2) continue;
    for (int i=0; i<(stroke.count - 1); i++) {
      CGPoint pt1 = POINT([stroke objectAtIndex:i]);
      CGPoint pt2 = POINT([stroke objectAtIndex:i+1]);
      CGContextMoveToPoint(ctx, pt1.x, pt1.y);
      CGContextAddLineToPoint(ctx, pt2.x, pt2.y);
      CGContextStrokePath(ctx);
    }
  }
}

@end
