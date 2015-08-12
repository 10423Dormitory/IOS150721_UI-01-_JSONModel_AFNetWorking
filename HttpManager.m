//
//  HttpManager.m
//  IOS150721_UI(01)_JSONModel_AFNetWorking
//
//  Created by PengJunlong on 15/7/21.
//  Copyright (c) 2015年 Peng Junlong. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

+(HttpManager *)sharedManager
{
    static HttpManager *manager;
    static dispatch_once_t onecToken;
    dispatch_once(&onecToken,^{
        if (manager == nil)
        {
            manager = [[HttpManager alloc] init];
        }
    });
    return manager;
}

- (void)requestWithUrl:(NSString *)urlString
        withDictionary:(NSDictionary *)dic
           withSuccess:(SuccessBlock)successBlock
              withFail:(FailBlock)failBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/text", nil];
    [manager POST:urlString parameters:dic success:^(AFHTTPRequestOperation * operation, id responseObject) {
        successBlock(operation, responseObject);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"(错误)error = %@",error);
        failBlock(operation, error);
    }];
}
@end
