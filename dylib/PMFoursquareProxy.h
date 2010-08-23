#import <Foundation/Foundation.h>

@interface PMFoursquareProxy : NSObject {
  BOOL fakeCheckin;
}
+(id) sharedInstance;
-(BOOL) isCheckedIn;
-(NSString*) currentVenueID;
@property(nonatomic) BOOL fakeCheckin;
@end
