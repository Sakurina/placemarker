#import "PMStubService.h"
#define SSPath(vid) [NSString stringWithFormat:@"%@/PMStubService-%@.plist", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0], vid]

@implementation PMStubService
static PMStubService* sharedInstance = nil;

+(PMStubService*) sharedInstance {
  if (sharedInstance == nil)
    sharedInstance = [[PMStubService alloc] init];
  return sharedInstance;
}

-(NSArray*) tagsForVenueID:(NSString*)vid {
  return [NSArray arrayWithContentsOfFile:SSPath(vid)];
}

-(void) uploadTag:(NSString*)gml forVenueID:(NSString*)vid {
  NSMutableArray* existingTags = [[[self tagsForVenueID:vid] mutableCopy] autorelease];
  if (!existingTags)
    existingTags = [NSMutableArray array];
  [existingTags addObject:gml];
  [existingTags writeToFile:SSPath(vid) atomically:YES];
}

@end
