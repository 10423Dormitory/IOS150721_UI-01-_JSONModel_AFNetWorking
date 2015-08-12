//
//  MyCellTableViewCell.m
//  IOS150721_UI(01)_JSONModel_AFNetWorking
//
//  Created by PengJunlong on 15/7/21.
//  Copyright (c) 2015年 Peng Junlong. All rights reserved.
//

#import "MyCellTableViewCell.h"
#import "CommentControl.h"

@implementation MyCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self configCell];
    }
    return self;
}

- (void)configCell
{
    _psImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    [self addSubview:_psImage];
    //屏幕宽度
    CGFloat widht = [[UIScreen mainScreen] bounds].size.width;
    _itemNameLabel = [CommentControl createLableWithFrame:CGRectMake(100, 10, widht-110, 30) andFont:[UIFont systemFontOfSize:15]];
    [self addSubview:_itemNameLabel];
    
    _desLabel = [CommentControl createLableWithFrame:CGRectMake(100, 40, widht-110, 30) andFont:[UIFont systemFontOfSize:13]];
    [self addSubview:_desLabel];
    
    _timeLabel = [CommentControl createLableWithFrame:CGRectMake(100, 70, widht-110, 30) andFont:[UIFont systemFontOfSize:13]];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_timeLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
