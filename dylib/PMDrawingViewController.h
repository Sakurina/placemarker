#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMGMLDrawingView.h"

@protocol PMDrawingViewControllerDelegate
-(void) drawingViewController:(id)dvc didScribbleTag:(NSString*)gml;
@end

@interface PMDrawingViewController : UIViewController {
  PMGMLDrawingView* drawingView;
  id<PMDrawingViewControllerDelegate> delegate;
}
@property(nonatomic,retain) PMGMLDrawingView* drawingView;
@property(nonatomic,assign) id<PMDrawingViewControllerDelegate> delegate;
@end
