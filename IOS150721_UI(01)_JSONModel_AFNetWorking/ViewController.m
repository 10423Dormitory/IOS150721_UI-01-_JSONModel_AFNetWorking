//
//  ViewController.m
//  IOS150721_UI(01)_JSONModel_AFNetWorking
//
//  Created by PengJunlong on 15/7/21.
//  Copyright (c) 2015年 Peng Junlong. All rights reserved.
//

#import "ViewController.h"
#import "HttpManager.h"
#import "myModel.h"
#import "MyCellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import <MediaPlayer/MediaPlayer.h>

#define  kURLString @"http://services.xingshulin.com/ApricotForestWirelessServiceForLiterature/LiteratureDataServlet"
#define data @"7B63373363386530373034366164393262633633373039326138356238366366307D2C7B336464363563386338626263653130663531623832616632343963363832323065363964656161627D2C7B66616C73657D2C7B307D2C7B307D2C7B66373539333863642D326162352D346232342D616336622D3132386538626434663366397D2C7B37363033396665333533326461623034656561353162363734643131636532617D2C7B323031352D30332D30372031313A31383A33337D2C7B312E382E367D2C7B696F736C6974657261747572657D2C7B494F536C6974657261747572655F312E382E365F696F73382E312E335F6950686F6E65352D327D"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    myModel *_myModel;
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self createUI];
    [self requestData];
}

- (void)createUI
{
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[MyCellTableViewCell class] forCellReuseIdentifier:@"myCell"];
}

- (void)requestData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //需要传递的参数
    [dic setObject:data forKey:@"sessionKey"];
    [dic setObject:@"10" forKey:@"pageSize"];
    [dic setObject:@"2" forKey:@"rtype"];
    [dic setObject:@"0" forKey:@"pageIndex"];
    [dic setObject:@"getLiteraturegroupBySpecialty" forKey:@"m"];
    
    SuccessBlock sucBlock = ^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"responseObject = %@",responseObject);
        _myModel = [[myModel alloc] initWithDictionary:responseObject error:nil];//实例化MyModel对象,同时使用responseObject结果给属性赋值
        [_tableView reloadData];                //如果网速很快,则[self createUI];和[self requestData];顺序不能颠倒,否则_tableView没有初始化
                                                        //
        NSLog(@"numRows = %@",_myModel.numRows);
    };
    
    FailBlock faiBlock = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"(错误)error = %@",error);
    };
        
    [[HttpManager sharedManager] requestWithUrl:kURLString withDictionary:dic withSuccess:sucBlock withFail:faiBlock];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myModel.obj.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    ObjModel *obj = _myModel.obj[indexPath.row];
    [cell.psImage setImageWithURL:[NSURL URLWithString:obj.picUrl]];
    cell.itemNameLabel.text = obj.itemName;
    cell.desLabel.text = obj.description1;
    NSLog(@"hours = %@",obj.createDateModel.hours);
    cell.timeLabel.text = [NSString stringWithFormat:@"%@时%@分%@秒",obj.createDateModel.hours,obj.createDateModel.minutes,obj.createDateModel.seconds];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
