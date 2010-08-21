#import "PMGMLStroke.h"
#define POINT(x) (CGPoint)([((NSValue*)(x)) CGPointValue])

@implementation PMGMLStroke
@synthesize strokeColor, points;

+(id) strokeWithColor:(UIColor*)sc {
  return [[[self alloc] initWithColor:sc] autorelease];
}

-(id) initWithColor:(UIColor*)sc {
  if (self = [super init]) {
    self.strokeColor = sc;
    self.points = [NSMutableArray array];
  }
  return self;
}

-(void) addPoint:(CGPoint)pt {
  [self.points addObject:[NSValue valueWithCGPoint:pt]];
}

-(NSString*) gmlRepresentationInView:(UIView*)v {
  NSMutableString* gml = [NSMutableString stringWithCapacity:500];
  [gml appendString:@"<stroke>"];
  [gml appendFormat:@"<brush><color><r>%i</r><g>%i</g><b>%i</b></color></brush>", 255, 0, 255];
  for (NSValue* val in self.points) {
    CGPoint pt = POINT(val);
    [gml appendFormat:@"<pt><x>%f</x><y>%f</y></pt>",pt.x/v.bounds.size.width, pt.y/v.bounds.size.height];
  }
  [gml appendString:@"</stroke>"];
  return gml;
}
@end
