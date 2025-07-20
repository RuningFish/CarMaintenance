//
//  CMNAddCarViewController.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "CMNAddCarViewController.h"

@interface CMNAddCarViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView *main_scrollView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, copy) NSArray *info_items;
@property (nonatomic, strong) NSMutableArray *info_item_textFields;
@end

@implementation CMNAddCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MAIN_VIEW_COLOR;
    [self.navigationItem setTitle:@"添加爱车"];
    self.main_scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.main_scrollView];
    self.main_scrollView.backgroundColor = [UIColor clearColor];
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.indicatorView.color = [UIColor lightGrayColor];
    self.indicatorView.frame = self.view.bounds;
    self.indicatorView.hidden = YES;
    [self.view addSubview:self.indicatorView];
    
    self.info_item_textFields = [NSMutableArray array];
    
    UIButton *cmn_add_car_nav_right_button = [UIButton buttonWithType:UIButtonTypeSystem];
    [cmn_add_car_nav_right_button setTitle:@"保存" forState:UIControlStateNormal];
    cmn_add_car_nav_right_button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [cmn_add_car_nav_right_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cmn_add_car_nav_right_button addTarget:self action:@selector(cmn_add_car_nav_right_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:cmn_add_car_nav_right_button];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.info_items = @[
        @{
            @"title":@"品牌",
            @"name":@"pinpai",
            @"type":@"text",
        },
        @{
            @"title":@"型号",
            @"name":@"xinghao",
            @"type":@"text",
        },
        @{
            @"title":@"年份",
            @"name":@"date",
            @"type":@"text",
        },
        @{
            @"title":@"颜色",
            @"name":@"color",
            @"type":@"text",
        },
        @{
            @"title":@"车牌号",
            @"name":@"chepai",
            @"type":@"text",
        },
        @{
            @"title":@"车架号",
            @"name":@"chejia",
            @"type":@"text",
        },
        @{
            @"title":@"当前里程",
            @"name":@"licheng",
            @"type":@"text",
        },
        @{
            @"title":@"购买日期",
            @"name":@"riqi",
            @"type":@"date-select",
        },
    ];
    
    CGFloat item_startY = 10.0f;
    CGFloat item_height = 50.0f;
    for (int i = 0; i < self.info_items.count; i ++) {
        NSDictionary *item_dict = self.info_items[i];
        NSString *type = item_dict[@"type"];
        UILabel *item_title_label = [[UILabel alloc] initWithFrame:CGRectMake(10, item_startY, self.main_scrollView.frame.size.width - 20, 40)];
        [self.main_scrollView addSubview:item_title_label];
        item_title_label.text = item_dict[@"title"];
        item_title_label.textColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
        item_title_label.textAlignment = NSTextAlignmentLeft;
        item_title_label.font = [UIFont systemFontOfSize:20];
        
        UITextField *input_textField = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(item_title_label.frame) + 10, self.main_scrollView.frame.size.width - 20, item_height)];
        [self.main_scrollView addSubview:input_textField];
        input_textField.placeholder = ![type isEqualToString:@"date-select"] ? @"请输入" : @"请选择";
        input_textField.font = [UIFont systemFontOfSize:15];
        UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
        input_textField.leftView = leftview;
        input_textField.leftViewMode = UITextFieldViewModeAlways;
        input_textField.layer.cornerRadius = 8;
        input_textField.layer.masksToBounds = YES;
        input_textField.layer.borderColor = [UIColor whiteColor].CGColor;
        input_textField.layer.borderWidth = 1;
        input_textField.tag = i;
        input_textField.delegate = self;
        
        [self.info_item_textFields addObject:input_textField];
        item_startY = CGRectGetMaxY(input_textField.frame) + 10;
        
        if (self.item_dict) {
            NSString *name = item_dict[@"name"];
            input_textField.text = self.item_dict[name];
        }
    }
    
    if (self.item_dict) {
        UIButton *delete_button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.main_scrollView addSubview:delete_button];
        delete_button.frame = CGRectMake((self.view.frame.size.width - 260) * 0.5, item_startY + 33, 260, 44);
        [delete_button setTitle:@"删除爱车" forState:UIControlStateNormal];
        [delete_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        delete_button.titleLabel.font = [UIFont systemFontOfSize:18];
        delete_button.layer.cornerRadius = 22;
        delete_button.layer.masksToBounds = YES;
        delete_button.backgroundColor = [UIColor redColor];
        [delete_button addTarget:self action:@selector(delete_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.main_scrollView.contentSize = CGSizeMake(0, item_startY + 400);
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == self.info_items.count - 1) {
        [self dateSelectWithTextField:textField];
        return NO;
    }
    return YES;
}

- (void)dateSelectWithTextField:(UITextField *)textField {
    [BRDatePickerView showDatePickerWithMode:BRDatePickerModeYMD title:@"购买日期" selectValue:textField.text minDate:nil maxDate:[NSDate date] isAutoSelect:YES resultBlock:^(NSDate * _Nullable selectDate, NSString * _Nullable selectValue) {
        textField.text = selectValue;
    }];
}

- (void)cmn_add_car_nav_right_buttonClick:(UIButton *)button {
    [self.view endEditing:YES];
    NSInteger index = -1;
    for (UITextField *obj in self.info_item_textFields) {
        if (obj.text.length == 0) {
            index = obj.tag;
            break;
        }
    }
    
    if (index >= 0) {
        NSDictionary *item = self.info_items[index];
        NSString *type = item[@"type"];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                                 message:[NSString stringWithFormat:@"请%@%@", [type isEqualToString:@"text"] ? @"输入" : @"选择", item[@"title"]]
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    NSString *filePath = KMyCarRecordPath;
    NSMutableArray *cmn_record_arrays = [NSMutableArray array];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        cmn_record_arrays = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *now = [NSDate date];
    NSString *dateString = [formatter stringFromDate:now];
    
    NSMutableDictionary *item_dict = [NSMutableDictionary dictionary];
    for (UITextField *obj in self.info_item_textFields) {
        NSDictionary *item = self.info_items[obj.tag];
        [item_dict setValue:obj.text ? : @"" forKey:item[@"name"]];
    }
    
    [item_dict setValue:dateString forKey:@"add_time"];
    
    if (self.item_dict) {
        [cmn_record_arrays replaceObjectAtIndex:self.index withObject:item_dict];
    } else {
        [cmn_record_arrays addObject:item_dict];
    }
    
    [NSKeyedArchiver archiveRootObject:cmn_record_arrays toFile:filePath];
    [[NSNotificationCenter defaultCenter] postNotificationName:KMyCarRecordAddSuccessNotificationName object:nil];
    
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_after(timer, dispatch_get_main_queue(), ^{
        self.indicatorView.hidden = YES;
        [self.indicatorView stopAnimating];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)delete_buttonClick:(UIButton *)button {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                             message:@"确定删除爱车吗？"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *filePath = KMyCarRecordPath;
        NSMutableArray *cmn_record_arrays = [NSMutableArray array];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            cmn_record_arrays = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        }
        [cmn_record_arrays removeObjectAtIndex:self.index];
        [NSKeyedArchiver archiveRootObject:cmn_record_arrays toFile:filePath];
        [[NSNotificationCenter defaultCenter] postNotificationName:KMyCarRecordAddSuccessNotificationName object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
