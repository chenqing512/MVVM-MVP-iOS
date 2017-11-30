//
//  DoctorViewController.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/30.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "DoctorViewController.h"
#import "DoctorPresenter.h"
#import "DoctorModel.h"
#import "MainTableViewCell.h"

@interface DoctorViewController ()<UITableViewDelegate,UITableViewDataSource,DoctorPresenterProtocol>

@property (nonatomic,strong) UITableView *mTableView;

@property (nonatomic,strong) NSMutableArray *mDataArray;

@property (nonatomic,strong) DoctorPresenter *presenter;


@end

@implementation DoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mDataArray=[[NSMutableArray alloc]initWithCapacity:0];
    [self.view addSubview:self.mTableView];
    [self.presenter bindView:self];
    [_presenter fetchData];
}

-(DoctorPresenter *)presenter{
    if (!_presenter) {
        _presenter=[[DoctorPresenter alloc]init];
    }
    return _presenter;
}

-(UITableView *)mTableView{
    if (!_mTableView) {
        _mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT) style:UITableViewStylePlain];
        _mTableView.delegate=self;
        _mTableView.dataSource=self;
    }
    return _mTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _mDataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DoctorModel *model=_mDataArray[indexPath.row];
    return model.cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cellId";
    MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    [cell setDataWithModel:_mDataArray[indexPath.row]];
    return cell;
}

-(void)userDoctorData:(NSMutableArray *)array{
    _mDataArray=[array mutableCopy];
    [_mTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
