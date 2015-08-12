//
//  myModel.h
//  IOS150721_UI(01)_JSONModel_AFNetWorking
//
//  Created by PengJunlong on 15/7/21.
//  Copyright (c) 2015年 Peng Junlong. All rights reserved.
//

#import "JSONModel.h"


@protocol ObjModel

@end

@interface CreateDateModel : JSONModel

@property (copy,nonatomic)NSString<Optional> *date;
@property (copy,nonatomic)NSString<Optional> *day;
@property (copy,nonatomic)NSString<Optional> *hours;
@property (copy,nonatomic)NSString<Optional> *minutes;
@property (copy,nonatomic)NSString<Optional> *month;
@property (copy,nonatomic)NSString<Optional> *seconds;
@property (copy,nonatomic)NSString<Optional> *time;
@property (copy,nonatomic)NSString<Optional> *timezoneOffset;
@property (copy,nonatomic)NSString<Optional> *year;

@end

@interface ObjModel : JSONModel

@property (copy,nonatomic)NSString<Optional> *description1;
@property (copy,nonatomic)NSString<Optional> *isNew;
@property (copy,nonatomic)NSString<Optional> *isRecommend;
@property (copy,nonatomic)NSString<Optional> *isSubscribe;
@property (copy,nonatomic)NSString<Optional> *itemID;
@property (copy,nonatomic)NSString<Optional> *itemName;
@property (copy,nonatomic)NSString<Optional> *picUrl;
@property (copy,nonatomic)NSString<Optional> *readNum;
@property (copy,nonatomic)NSString<Optional> *numRows;
@property (retain,nonatomic)CreateDateModel<Optional> *createDateModel; //定义的属性和JSON中的key不相同,在keyMapper方法中重新设置
@end

@interface myModel : JSONModel
@property (copy,nonatomic)NSString<Optional> *numRows;
@property (retain,nonatomic)NSDictionary<Optional> *resultObj;
@property (copy,nonatomic)NSArray<Optional,ObjModel> *obj;
@end
