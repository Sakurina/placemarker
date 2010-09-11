#import "PMSyncBlackbookService.h"

@implementation PMSyncBlackbookService
static PMSyncBlackbookService* sharedInstance = nil;

+(PMSyncBlackbookService*) sharedInstance {
  if (sharedInstance == nil)
    sharedInstance = [[PMSyncBlackbookService alloc] init];
  return sharedInstance;
}

-(NSArray*) tagsForVenueID:(NSString*)vid {
  NSMutableURLRequest* req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://000000book.com/data.json?keywords=pmvid-%@&application=placemarker", vid]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0f];
  NSData* blackbookData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
  return [objc_getClass("JSON") objectWithData:blackbookData options:0 error:nil];
}

-(void) uploadTag:(NSString*)gml forVenueID:(NSString*)vid {
  // nothing yet
  return;
}

@end
