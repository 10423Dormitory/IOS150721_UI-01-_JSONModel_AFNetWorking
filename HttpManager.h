//
//  HttpManager.h
//  IOS150721_UI(01)_JSONModel_AFNetWorking
//
//  Created by PengJunlong on 15/7/21.
//  Copyright (c) 2015年 Peng Junlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^SuccessBlock)(AFHTTPRequestOperation * operation, id responseObject);
typedef void(^FailBlock)(AFHTTPRequestOperation * operation, NSError * error);

@interface HttpManager : NSObject
+(HttpManager *)sharedManager;
- (void)requestWithUrl:(NSString *)urlString
        withDictionary:(NSDictionary *)dic
           withSuccess:(SuccessBlock)successBlock
              withFail:(FailBlock)failBlock;
@end
