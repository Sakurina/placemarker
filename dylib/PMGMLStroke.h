#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PMGMLStroke : NSObject {
  UIColor* strokeColor;
  NSMutableArray* points;
}

@property(nonatomic,retain) UIColor* strokeColor;
@property(nonatomic,retain) NSMutableArray* points;
+(id) strokeWithColor:(UIColor*)sc;
-(id) initWithColor:(UIColor*)sc;
-(void) addPoint:(CGPoint)pt;
-(NSString*) gmlRepresentation;

@end
