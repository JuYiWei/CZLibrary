//
//  CZCoverViewController.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZCoverViewController.h"

@interface CZCoverViewController ()

@end

@implementation CZCoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.cz_rootVC showTabBarVC];
    });
}

@end
