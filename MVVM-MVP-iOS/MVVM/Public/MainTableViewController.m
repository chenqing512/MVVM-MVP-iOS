//
//  MainTableViewController.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"
#import "MainTableViewModel.h"
#import "MainModel.h"

@interface MainTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) MainTableViewModel *viewModel;

@property (nonatomic,strong) NSMutableArray *mDataArray;

@property (nonatomic,strong) UITableView *mTableView;

@end

@implementation MainTableViewController

-(MainTableViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel=[[MainTableViewModel alloc]init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mTableView];
    _mDataArray=[[NSMutableArray alloc]initWithCapacity:0];
    [self createViewModel];
}

-(UITableView *)mTableView{
    if (!_mTableView) {
        _mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT) style:UITableViewStylePlain];
        _mTableView.delegate=self;
        _mTableView.dataSource=self;
    }
    return _mTableView;
}

-(void)createViewModel{
    __weak typeof(self) weakSelf = self;
    [self.viewModel setReturnBlock:^(id returnBlock) {
        _mDataArray=[returnBlock mutableCopy];
        [weakSelf.mTableView reloadData];
    } FailBlock:^(id failBlock) {
        
    }];
    [self.viewModel fetchValue:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mDataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainModel *model=_mDataArray[indexPath.row];
    return model.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cellId";
    MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell setDataWithModel:_mDataArray[indexPath.row]];
    return cell;
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
