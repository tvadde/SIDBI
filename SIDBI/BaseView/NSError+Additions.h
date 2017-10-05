//
//  NSError+Additions.h
//  Clinicopedia
//
//  Created by Thukaram Vadde on 27/02/17.
//  Copyright © 2017 Click2Clinic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Additions)

+(NSError *)getTheErrorObjectFromResponse:(NSDictionary *)errorDic andNSErrorObj:(NSError *)errorObj;

@end
