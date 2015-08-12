//
//  myModel.m
//  IOS150721_UI(01)_JSONModel_AFNetWorking
//
//  Created by PengJunlong on 15/7/21.
//  Copyright (c) 2015年 Peng Junlong. All rights reserved.
//

#import "myModel.h"

@implementation CreateDateModel

@end

@implementation ObjModel

+ (JSONKeyMapper *)keyMapper
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"description1" forKey:@"description"];
    [dic setObject:@"createDateModel" forKey:@"createDate"];//createDate是JSON中的key,createDateModel是Model中定义的属性
    return [[JSONKeyMapper alloc] initWithDictionary:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"UndefinedKey = %@",key);
}

@end

@implementation myModel

@end
