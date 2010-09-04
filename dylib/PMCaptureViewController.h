#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMGMLDrawingView.h"

@protocol PMCaptureViewControllerDelegate
-(void) captureViewController:(id)dvc didCaptureTag:(NSString*)gml;
-(void) captureViewControllerDidCancelCapture:(id)dvc;
@end

@interface PMCaptureViewController : UIViewController {
  PMGMLDrawingView* drawingView;
  id<PMCaptureViewControllerDelegate> delegate;
}
@property(nonatomic,retain) PMGMLDrawingView* drawingView;
@property(nonatomic,assign) id<PMCaptureViewControllerDelegate> delegate;
@end
