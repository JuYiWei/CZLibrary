//
//  ViewController.m
//  CZLibrary
//
//  Created by juyiwei on 2018/9/19.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "ViewController.h"
#import "CZLibrary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CZLog config];
    CZLogInfo(@"asdsd");
    NSLog(@"123");
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[CZHUD sharedInstance] showMessage:@"123"];
}


@end
