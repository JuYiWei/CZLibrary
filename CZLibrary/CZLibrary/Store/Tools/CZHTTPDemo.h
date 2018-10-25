//
//  CZHTTPDemo.h
//  CZLibrary
//
//  Created by juyiwei on 2018/10/25.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "../../Lbirary/CZHTTP.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZHTTPDemo : CZHTTP

CZ_SINGLETON_HEADER(CZHTTPDemo)

- (void)testLogin:(NSString *)name success:(CZHTTPBlock)success failure:(CZHTTPBlock)failure;

@end

NS_ASSUME_NONNULL_END
