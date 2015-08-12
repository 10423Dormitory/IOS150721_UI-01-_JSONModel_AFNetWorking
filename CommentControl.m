//
//  CommentControl.m
//  IOS150721_UI(01)_JSONModel_AFNetWorking
//
//  Created by PengJunlong on 15/7/21.
//  Copyright (c) 2015年 Peng Junlong. All rights reserved.
//

#import "CommentControl.h"

@implementation CommentControl

+ (UILabel *)createLableWithFrame:(CGRect)frame andFont:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor blackColor];
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}
@end
