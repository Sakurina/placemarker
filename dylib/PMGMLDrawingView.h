#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kPMGMLStrokeColorBlack [UIColor blackColor]
#define kPMGMLStrokeColorWhite [UIColor whiteColor]
#define kPMGMLStrokeColorYellow [UIColor colorWithRed:1.0f green:0.941f blue:0.0f alpha:1.0f]
#define kPMGMLStrokeColorPink [UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f]

@interface PMGMLDrawingView : UIView {
  UIColor* strokeColor;
  NSMutableArray* strokes;
}
@property(nonatomic, retain) UIColor* strokeColor;
@property(nonatomic, retain) NSMutableArray* strokes;
@end
