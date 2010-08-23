#import <Foundation/Foundation.h>

@interface PMStubService : NSObject {
}
/* I haven't figured out the infrastructure side of
 * PlaceMarker yet. Will this use 000000book in some
 * way? Probably. Until I experiment with that, this
 * stubbed out "GML upload" service will have to do.
 */
+(PMStubService*) sharedInstance;
-(NSArray*) tagsForVenueID:(NSString*)vid;
-(void) uploadTag:(NSString*)gml forVenueID:(NSString*)vid;
@end
