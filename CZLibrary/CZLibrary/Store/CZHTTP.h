//
//  CZHTTP.h
//  CZLibrary
//
//  Created by juyiwei on 2018/9/28.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableDictionary+cz.h"
#import "CZLibraryMacro.h"

typedef void(^ CZHTTPBlock)(NSURLSessionDataTask *operation,id response);
typedef void(^ CZHTTPProgress)(NSProgress *progress);

@interface CZHTTP : NSObject

CZ_SINGLETON_HEADER(CZHTTP)

@property (nonatomic, copy, readonly) NSDictionary *commonParams;

/*! 通用请求处理 */
- (void)post_requestWithURLString:(NSString *)URLString
                          paramas:(NSDictionary *)paramas
                         progress:(void (^)(NSProgress *))progress
                          success:(CZHTTPBlock)success
                          failure:(CZHTTPBlock)failure;

/*! 通用组合 http 请求 url */
- (NSString *)httpRequestUrlWithPath:(NSString *)path;


#pragma mark - API

- (void)post_LoginWithUsername:(NSString *)username
                       success:(CZHTTPBlock)success
                       failure:(CZHTTPBlock)failure;

@end

FOUNDATION_EXTERN NSString *const CZHTTPMsg;
FOUNDATION_EXTERN NSString *const CZHTTPCode;
FOUNDATION_EXTERN NSString *const CZHTTPData;
