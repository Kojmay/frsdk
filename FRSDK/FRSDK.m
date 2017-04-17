//
//  FRSDK.m
//  FRSDK
//
//  Created by HaifengMay on 17/04/2017.
//  Copyright © 2017 HaifengMay. All rights reserved.
//

#import "FRSDK.h"
#import "FRKeychainOperation.h"

#define  KEY_USERNAME_PASSWORD @"com.fireradar.app.fireradarpassword"
#define  KEY_USERNAME @"com.fireradar.app.meihaifeng"
#define  KEY_PASSWORD @"com.fireradar.app.meihaifengpassword"


@implementation FRSDK

+ (NSString *)getUUID {
    
    NSString * strUUID = (NSString *)[FRKeychainOperation load:KEY_USERNAME_PASSWORD];
    if (! [self isUUIDExisted]) {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        //将该uuid保存到keychain
        [FRKeychainOperation save:KEY_USERNAME_PASSWORD data:strUUID];
    }
    return strUUID;
}

+ (Boolean) isUUIDExisted {
    NSString * strUUID = (NSString *)[FRKeychainOperation load:KEY_USERNAME_PASSWORD];
    return ![strUUID isEqualToString:@""] && strUUID ;
}

+ (void)resetUUID {
    [FRKeychainOperation deleteKeyData:KEY_USERNAME_PASSWORD];
}

@end
