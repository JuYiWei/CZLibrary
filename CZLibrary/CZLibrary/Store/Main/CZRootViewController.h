//
//  CZRootViewController.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZRootViewController : UIViewController

- (void)showTabBarVC;

@end



@interface UIViewController (czRoot)

- (CZRootViewController *)cz_rootVC;

@end
