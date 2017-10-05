//
//  APICall.m
//  Clinicopedia
//
//  Created by Click2Clinic on 27/02/17.
//  Copyright © 2017 Click2Clinic. All rights reserved.
//

#import "APICall.h"
#import "NSError+Additions.h"

@implementation APICall

+(void)postApiCAllWithURL:(NSString *)urlString withParams:(NSDictionary *)params andResponseBlock:(void(^)(id response, NSError *error))responseBlock{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        if([[responseObject objectForKey:@"Status"] boolValue] || [[responseObject objectForKey:@"State"] boolValue]){
            responseBlock(responseObject,nil);
        }else if([responseObject objectForKey:@"People"]){
            responseBlock(responseObject,nil);
        }else{
            NSError *mutableError = [NSError getTheErrorObjectFromResponse:responseObject andNSErrorObj:nil];
            responseBlock(nil,mutableError);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *mutableError = [NSError getTheErrorObjectFromResponse:nil andNSErrorObj:error];
        responseBlock(nil,mutableError);
    }];
}

+(void)getApiCAllWithURL:(NSString *)urlString withParams:(NSDictionary *)params andResponseBlock:(void(^)(id response, NSError *error))responseBlock{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [manager GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        if([[responseObject objectForKey:@"Status"] boolValue] || [[responseObject objectForKey:@"State"] boolValue]){
            responseBlock(responseObject,nil);
        }else{
            NSError *mutableError = [NSError getTheErrorObjectFromResponse:responseObject andNSErrorObj:nil];
            responseBlock(nil,mutableError);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *mutableError = [NSError getTheErrorObjectFromResponse:nil andNSErrorObj:error];
        responseBlock(nil,mutableError);
    }];
}

+(void)putApiCAllWithURL:(NSString *)urlString withParams:(NSDictionary *)params andResponseBlock:(void(^)(id response, NSError *error))responseBlock {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager PUT:urlString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        if([[responseObject objectForKey:@"Status"] boolValue] || [[responseObject objectForKey:@"State"] boolValue]){
            responseBlock(responseObject,nil);
        }else{
            NSError *mutableError = [NSError getTheErrorObjectFromResponse:responseObject andNSErrorObj:nil];
            responseBlock(nil,mutableError);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *mutableError = [NSError getTheErrorObjectFromResponse:nil andNSErrorObj:error];
        responseBlock(nil,mutableError);
    }];
}

@end
