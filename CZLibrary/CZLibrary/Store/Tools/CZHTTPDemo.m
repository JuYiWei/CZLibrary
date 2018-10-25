//
//  CZHTTPDemo.m
//  CZLibrary
//
//  Created by juyiwei on 2018/10/25.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZHTTPDemo.h"

@implementation CZHTTPDemo

CZ_SINGLETON_IMPLEMENTATION(CZHTTPDemo)

- (void)testLogin:(NSString *)name success:(CZHTTPBlock)success failure:(CZHTTPBlock)failure {
    [[CZHTTP sharedInstance] cz_post_requestWithURLString:@"http://www.juyiwei.vip/myServer/project/test/list.php" paramas:@{@"name": name} progress:nil success:success failure:failure];
}




@end
