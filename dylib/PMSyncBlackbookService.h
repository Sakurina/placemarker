#import <Foundation/Foundation.h>

@interface PMSyncBlackbookService : NSObject {
}
// Yeah, I'm starting with a synchronous implementation of the
// Blackbook service to ensure it works, and then moving it
// to async. Sue me.

+(PMSyncBlackbookService*) sharedInstance;
-(NSArray*) tagsForVenueID:(NSString*)vid;
-(void) uploadTag:(NSString*)gml forVenueID:(NSString*)vid;
@end
