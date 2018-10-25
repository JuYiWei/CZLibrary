//
//  ViewController.m
//  CZLibrary
//
//  Created by juyiwei on 2018/9/19.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "ViewController.h"
#import "CZLibrary.h"
#import "Store/Tools/CZHTTPDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CZLog cz_config];
    
    CZLogInfo(@"asdsd+== %@",@"asdadad")

    [[CZHTTPDemo sharedInstance] testLogin:@"asda" success:^(NSURLSessionDataTask *operation, id response) {

    } failure:^(NSURLSessionDataTask *operation, id response) {

    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[CZHUD sharedInstance] cz_showLoadingImage];
}


@end
