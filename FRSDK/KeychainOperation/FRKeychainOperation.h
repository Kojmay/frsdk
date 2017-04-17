//
//  FRKeychainOperation.h
//  FRSDK
//
//  Created by HaifengMay on 17/04/2017.
//  Copyright © 2017 HaifengMay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRKeychainOperation : NSObject

+(void)save:(NSString *)service data:(id)data;
+(id)load:(NSString *)service;
+(void)deleteKeyData:(NSString *)service;

@end
