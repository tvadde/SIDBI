//
//  APICall.h
//  Clinicopedia
//
//  Created by Click2Clinic on 27/02/17.
//  Copyright © 2017 Click2Clinic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APICall : NSObject

+(void)postApiCAllWithURL:(NSString *)urlString withParams:(NSDictionary *)params andResponseBlock:(void(^)(id response, NSError *error))responseBlock;

+(void)getApiCAllWithURL:(NSString *)urlString withParams:(NSDictionary *)params andResponseBlock:(void(^)(id response, NSError *error))responseBlock;

+(void)putApiCAllWithURL:(NSString *)urlString withParams:(NSDictionary *)params andResponseBlock:(void(^)(id response, NSError *error))responseBlock;


@end
