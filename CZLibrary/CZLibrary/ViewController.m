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
    
    CZLogInfo(@"%@", @[@"1",@"2",@"3",@"4", @{@"key":@"value", @"list":@[@"q", @"w", @"e"]}]);
    
    
    
//    CZLogInfo(@"asdsd+== %@",@"asdadad")

//    [[CZHTTPDemo sharedInstance] testLogin:@"asda" success:^(NSURLSessionDataTask *operation, id response) {
//
//    } failure:^(NSURLSessionDataTask *operation, id response) {
//
//    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [[CZHUD sharedInstance] cz_showLoadingImage];
    
    
    [self cz_shareImage:@"http://pic171.nipic.com/file/20180630/26855181_165658221000_2.jpg" thumbImage:[UIImage imageNamed:@"hud_loading_00"] ToPlatformType:UMSocialPlatformType_WechatSession success:^(UMSocialShareResponse * _Nonnull response) {
        
    } failure:^(id  _Nonnull response, NSError * _Nonnull error) {
        
    }];
    
    
  
    
//    [CZUMTool cz_getUserInfoForPlatform:UMSocialPlatformType_WechatSession success:^(UMSocialUserInfoResponse * _Nonnull response) {
//        NSLog(@"ok = %@", response);
//
//    } failure:^(id  _Nonnull response, NSError * _Nonnull error) {
//        NSLog(@"err = %@", response);
//    }];
    
    
}



@end
