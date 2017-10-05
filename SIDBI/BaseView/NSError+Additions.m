//
//  NSError+Additions.m
//  Clinicopedia
//
//  Created by Thukaram Vadde on 27/02/17.
//  Copyright © 2017 Click2Clinic. All rights reserved.
//

#import "NSError+Additions.h"

@implementation NSError (Additions)

+(NSError *)getTheErrorObjectFromResponse:(NSDictionary *)errorDic andNSErrorObj:(NSError *)errorObj{
    
    NSError *mutableError = nil;
    
    if(errorDic){
      
        NSString *errorString = [errorDic objectForKey:@"Message"];
        int errorStatus = [errorDic objectForKey:@"State"] ? [[errorDic objectForKey:@"State"] intValue]: [[errorDic objectForKey:@"Status"] intValue];
        
        NSDictionary *customErrorDictionary = nil;
        
        if([errorString isEqual:[NSNull null]]){
            customErrorDictionary = @{ERROR_MESSAGE:@"",ERROR_Status:[NSString stringWithFormat:@"%d",errorStatus]};
            
        }else if(errorString && errorString.length > 0){
            customErrorDictionary = @{ERROR_MESSAGE:errorString,ERROR_Status:[NSString stringWithFormat:@"%d",errorStatus]};
        }else{
            customErrorDictionary = @{ERROR_MESSAGE:@"",ERROR_Status:[NSString stringWithFormat:@"%d",errorStatus]};
        }
        
        mutableError = [NSError errorWithDomain:@"ServerError" code:500 userInfo:customErrorDictionary];

    }else if(errorObj){
        
        NSDictionary *customErrorDictionary = @{ERROR_MESSAGE:errorObj.localizedDescription,ERROR_Status:@""};
        
        mutableError = [NSError errorWithDomain:@"ServerError" code:errorObj.code userInfo:customErrorDictionary];
    }
    
    return mutableError;
}

@end
