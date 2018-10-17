//
//  ViewController.m
//  CZLibrary
//
//  Created by juyiwei on 2018/9/19.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "ViewController.h"
#import "CZLibrary.h"
#import "CZHTTP.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [[CZHTTP sharedInstance] post_LoginWithUsername:@"A" success:^(NSURLSessionDataTask *operation, id response) {
        
    } failure:^(NSURLSessionDataTask *operation, id response) {
        
    }];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[CZHUD sharedInstance] cz_showLoadingImage];
}


@end
