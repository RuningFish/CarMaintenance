//
//  CMNMineViewController.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "CMNMineViewController.h"
#import "CMNFeedbackViewController.h"

@interface CMNMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *cmn_mine_tableView;
@property (nonatomic, strong) NSArray *cmn_mine_dataSource;
@end

@implementation CMNMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cmn_mine_tableView];
    self.cmn_mine_tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = MAIN_VIEW_COLOR;
    self.cmn_mine_dataSource = @[@"清除缓存",@"版本更新",@"意见反馈"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cmn_mine_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"CMNMineViewController-%ld",indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row < self.cmn_mine_dataSource.count) {
        NSString *title = self.cmn_mine_dataSource[indexPath.row];
        cell.textLabel.text = title;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"清理成功"
                                                                                 message:@""
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (indexPath.row == 1){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"当前已是最新版本"
                                                                                 message:@""
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (indexPath.row == 2){
        CMNFeedbackViewController *vc = [CMNFeedbackViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        vc.view.backgroundColor = self.view.backgroundColor;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Lazy
- (UITableView *)cmn_mine_tableView{
    if (!_cmn_mine_tableView) {
        _cmn_mine_tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _cmn_mine_tableView.delegate = self;
        _cmn_mine_tableView.dataSource = self;
        _cmn_mine_tableView.rowHeight = 44;
        _cmn_mine_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _cmn_mine_tableView;
}

@end
