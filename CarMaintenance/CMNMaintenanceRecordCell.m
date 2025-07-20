//
//  CMNMaintenanceRecordCell.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "CMNMaintenanceRecordCell.h"

@interface CMNMaintenanceRecordCell ()
@property (nonatomic, strong) UIImageView *cmn_maintenance_list_imageView;
@property (nonatomic, strong) UILabel *cmn_maintenance_list_nameLabel;
@property (nonatomic, strong) UILabel *cmn_maintenance_list_moneyLabel;
@property (nonatomic, strong) UILabel *cmn_maintenance_list_dateLabel;
@property (nonatomic, strong) UILabel *cmn_maintenance_list_typeLabel;
@end

@implementation CMNMaintenanceRecordCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    NSString *identifier = @"CMNMaintenanceRecordCell";
    CMNMaintenanceRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CMNMaintenanceRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.backgroundColor = [UIColor clearColor];
        UIView *bottomView = [[UIView alloc] init];
        [self.contentView addSubview:bottomView];
        bottomView.backgroundColor = [UIColor clearColor];
        bottomView.layer.cornerRadius = 8;
        bottomView.layer.masksToBounds = YES;
        bottomView.layer.borderColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1].CGColor;
        bottomView.layer.borderWidth = 1;
        
        self.cmn_maintenance_list_imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [bottomView addSubview:self.cmn_maintenance_list_imageView];
        self.cmn_maintenance_list_imageView.image = [UIImage imageNamed:@"weixiu"];
        self.cmn_maintenance_list_imageView.layer.cornerRadius = 5;
        self.cmn_maintenance_list_imageView.layer.masksToBounds = YES;
        self.cmn_maintenance_list_imageView.backgroundColor = [UIColor clearColor];
        
        self.cmn_maintenance_list_typeLabel = [[UILabel alloc] init];
        self.cmn_maintenance_list_typeLabel.font = [UIFont systemFontOfSize:15];
        self.cmn_maintenance_list_typeLabel.textColor = [UIColor blackColor];
        self.cmn_maintenance_list_typeLabel.textAlignment = NSTextAlignmentLeft;
        [bottomView addSubview:self.cmn_maintenance_list_typeLabel];
        
        self.cmn_maintenance_list_nameLabel = [[UILabel alloc] init];
        [bottomView addSubview:self.cmn_maintenance_list_nameLabel];
        self.cmn_maintenance_list_nameLabel.font = [UIFont systemFontOfSize:18];
        self.cmn_maintenance_list_nameLabel.textColor = [UIColor blackColor];
        self.cmn_maintenance_list_nameLabel.textAlignment = NSTextAlignmentLeft;
        
        self.cmn_maintenance_list_moneyLabel = [[UILabel alloc] init];
        [bottomView addSubview:self.cmn_maintenance_list_moneyLabel];
        self.cmn_maintenance_list_moneyLabel.font = [UIFont systemFontOfSize:15];
        self.cmn_maintenance_list_moneyLabel.textColor = [UIColor blackColor];
        self.cmn_maintenance_list_moneyLabel.textAlignment = NSTextAlignmentLeft;
        
        self.cmn_maintenance_list_dateLabel = [[UILabel alloc] init];
        [bottomView addSubview:self.cmn_maintenance_list_dateLabel];
        self.cmn_maintenance_list_dateLabel.font = [UIFont systemFontOfSize:15];
        self.cmn_maintenance_list_dateLabel.textColor = [UIColor blackColor];
        self.cmn_maintenance_list_dateLabel.textAlignment = NSTextAlignmentLeft;
        
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(10);
            make.right.offset(-10);
            make.bottom.offset(0);
        }];
         
        [self.cmn_maintenance_list_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(20);
            make.left.offset(10);
            make.width.height.mas_equalTo(50);
        }];
        
        [self.cmn_maintenance_list_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.left.equalTo(self.cmn_maintenance_list_imageView.mas_right).offset(15);
            make.right.offset(-10);
            make.height.mas_equalTo(30);
        }];
        
        [self.cmn_maintenance_list_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cmn_maintenance_list_typeLabel.mas_bottom).offset(0);
            make.left.equalTo(self.cmn_maintenance_list_imageView.mas_right).offset(15);
            make.right.offset(-10);
            make.height.mas_equalTo(30);
        }];
                
        [self.cmn_maintenance_list_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cmn_maintenance_list_nameLabel.mas_left).offset(0);
            make.top.equalTo(self.cmn_maintenance_list_nameLabel.mas_bottom).offset(0);
            make.right.offset(-10);
            make.height.mas_equalTo(30);
        }];
        
        [self.cmn_maintenance_list_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cmn_maintenance_list_nameLabel.mas_left).offset(0);
            make.right.offset(-10);
            make.top.equalTo(self.cmn_maintenance_list_moneyLabel.mas_bottom).offset(0);
            make.height.mas_equalTo(self.cmn_maintenance_list_moneyLabel);
            make.bottom.offset(-10);
        }];
    
    }
    
    return self;
}

- (void)setItem_dict:(NSDictionary *)item_dict {
    _item_dict = item_dict;
    
    self.cmn_maintenance_list_typeLabel.text = [NSString stringWithFormat:@"%@",item_dict[@"type"] ? : @""];
    self.cmn_maintenance_list_nameLabel.text = [NSString stringWithFormat:@"车辆:%@", item_dict[@"car"] ? : @""];
    self.cmn_maintenance_list_moneyLabel.text = [NSString stringWithFormat:@"费用:%@",item_dict[@"money"] ? : @""];
    self.cmn_maintenance_list_dateLabel.text = [NSString stringWithFormat:@"日期:%@",item_dict[@"riqi"] ? : @""];
    
}


@end
