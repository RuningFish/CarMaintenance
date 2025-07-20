//
//  CMNMyCarViewController.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "CMNMyCarViewController.h"
#import "CMNAddCarViewController.h"
#import "CMNMyCarTableViewCell.h"
@interface CMNMyCarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *cmn_car_tableView;
@property (nonatomic, strong) NSArray *cmn_car_dataSource;
@end

@implementation CMNMyCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"我的爱车"];
    [self.view addSubview:self.cmn_car_tableView];
    self.cmn_car_tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = MAIN_VIEW_COLOR;
    
    UIButton *cmn_my_car_nav_right_button = [UIButton buttonWithType:UIButtonTypeSystem];
    [cmn_my_car_nav_right_button setTitle:@"添加" forState:UIControlStateNormal];
    cmn_my_car_nav_right_button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [cmn_my_car_nav_right_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cmn_my_car_nav_right_button addTarget:self action:@selector(cmn_my_car_nav_right_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:cmn_my_car_nav_right_button];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDdata) name:KMyCarRecordAddSuccessNotificationName object:nil];
}

- (void)reloadDdata {
    [self.cmn_car_tableView reloadData];
}

- (NSArray *)cmn_car_dataSource {
    return [NSArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:KMyCarRecordPath]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cmn_car_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CMNMyCarTableViewCell *cell = [CMNMyCarTableViewCell cellWithTableView:tableView];
    if (indexPath.row < self.cmn_car_dataSource.count) {
        NSDictionary *item_dict = self.cmn_car_dataSource[indexPath.row];
        cell.item_dict = item_dict;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.cmn_car_dataSource.count) {
        CMNAddCarViewController *vc = [CMNAddCarViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        vc.item_dict = self.cmn_car_dataSource[indexPath.row];
        vc.index = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 40, 30)];
    [sectionHeaderView addSubview:titleLabel];
    titleLabel.textColor = [UIColor systemBlueColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.text = @"我的爱车";
    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *sectionFooterView = nil;
    if (section == 0 && self.cmn_car_dataSource.count == 0) {
        sectionFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,0, [UIScreen mainScreen].bounds.size.width - 40, sectionFooterView.frame.size.height)];
        [sectionFooterView addSubview:titleLabel];
        titleLabel.text = @"还没有爱车哦，赶快去添加吧～";
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return sectionFooterView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.cmn_car_dataSource.count == 0 ? 220.0f : 0.0f;
}

- (void)cmn_my_car_nav_right_buttonClick:(UIButton *)button {
    CMNAddCarViewController *vc = [CMNAddCarViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Lazy
- (UITableView *)cmn_car_tableView {
    if (!_cmn_car_tableView) {
        _cmn_car_tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _cmn_car_tableView.delegate = self;
        _cmn_car_tableView.dataSource = self;
        _cmn_car_tableView.rowHeight = UITableViewAutomaticDimension;
        _cmn_car_tableView.estimatedRowHeight = 144;
        _cmn_car_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _cmn_car_tableView;
}

@end
