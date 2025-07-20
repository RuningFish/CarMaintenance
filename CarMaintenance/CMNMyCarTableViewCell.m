//
//  CMNMyCarTableViewCell.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "CMNMyCarTableViewCell.h"

@interface CMNMyCarTableViewCell ()
@property (nonatomic, strong) UIImageView *cmn_myCar_list_imageView;
@property (nonatomic, strong) UILabel *cmn_myCar_list_nameLabel;
@property (nonatomic, strong) UILabel *cmn_myCar_list_chepaiLabel;
@property (nonatomic, strong) UILabel *cmn_myCar_list_lichengLabel;
@property (nonatomic, strong) UILabel *cmn_myCar_list_deleteLabel;
@end

@implementation CMNMyCarTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    NSString *identifier = @"CMNMyCarTableViewCell";
    CMNMyCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CMNMyCarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
        
        self.cmn_myCar_list_imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [bottomView addSubview:self.cmn_myCar_list_imageView];
        self.cmn_myCar_list_imageView.image = [UIImage imageNamed:@"car"];
        self.cmn_myCar_list_imageView.layer.cornerRadius = 5;
        self.cmn_myCar_list_imageView.layer.masksToBounds = YES;
        self.cmn_myCar_list_imageView.backgroundColor = [UIColor clearColor];
        
        self.cmn_myCar_list_nameLabel = [[UILabel alloc] init];
        [bottomView addSubview:self.cmn_myCar_list_nameLabel];
        self.cmn_myCar_list_nameLabel.font = [UIFont systemFontOfSize:18];
        self.cmn_myCar_list_nameLabel.textColor = [UIColor blackColor];
        self.cmn_myCar_list_nameLabel.textAlignment = NSTextAlignmentLeft;
        
        self.cmn_myCar_list_chepaiLabel = [[UILabel alloc] init];
        [bottomView addSubview:self.cmn_myCar_list_chepaiLabel];
        self.cmn_myCar_list_chepaiLabel.font = [UIFont systemFontOfSize:15];
        self.cmn_myCar_list_chepaiLabel.textColor = [UIColor blackColor];
        self.cmn_myCar_list_chepaiLabel.textAlignment = NSTextAlignmentLeft;
        
        self.cmn_myCar_list_lichengLabel = [[UILabel alloc] init];
        [bottomView addSubview:self.cmn_myCar_list_lichengLabel];
        self.cmn_myCar_list_lichengLabel.font = [UIFont systemFontOfSize:15];
        self.cmn_myCar_list_lichengLabel.textColor = [UIColor blackColor];
        self.cmn_myCar_list_lichengLabel.textAlignment = NSTextAlignmentLeft;

        self.cmn_myCar_list_deleteLabel.font = [UIFont systemFontOfSize:15];
        self.cmn_myCar_list_deleteLabel.textColor = [UIColor redColor];
        self.cmn_myCar_list_deleteLabel.textAlignment = NSTextAlignmentCenter;
        self.cmn_myCar_list_deleteLabel.text = @"删除";
        
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(10);
            make.right.offset(-10);
            make.bottom.offset(0);
        }];
         
        [self.cmn_myCar_list_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(20);
            make.left.offset(10);
            make.width.height.mas_equalTo(50);
        }];
        
        [self.cmn_myCar_list_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.left.equalTo(self.cmn_myCar_list_imageView.mas_right).offset(15);
            make.right.offset(-10);
            make.height.mas_equalTo(30);
        }];
        
        [self.cmn_myCar_list_deleteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cmn_myCar_list_nameLabel.mas_bottom).offset(0);
            make.right.offset(-10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(30);
        }];
        
        [self.cmn_myCar_list_chepaiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cmn_myCar_list_nameLabel.mas_left).offset(0);
            make.top.equalTo(self.cmn_myCar_list_nameLabel.mas_bottom).offset(0);
            make.right.offset(-10);
            make.height.mas_equalTo(30);
        }];
        
        [self.cmn_myCar_list_lichengLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cmn_myCar_list_nameLabel.mas_left).offset(0);
            make.right.offset(-10);
            make.top.equalTo(self.cmn_myCar_list_chepaiLabel.mas_bottom).offset(0);
            make.height.mas_equalTo(self.cmn_myCar_list_chepaiLabel);
            make.bottom.offset(-10);
        }];
    
    }
    
    return self;
}

- (void)setItem_dict:(NSDictionary *)item_dict {
    _item_dict = item_dict;
    
    self.cmn_myCar_list_nameLabel.text = [NSString stringWithFormat:@"%@   %@", item_dict[@"pinpai"], item_dict[@"xinghao"]];
    self.cmn_myCar_list_chepaiLabel.text = [NSString stringWithFormat:@"车牌:%@",item_dict[@"chepai"]];
    self.cmn_myCar_list_lichengLabel.text = [NSString stringWithFormat:@"里程:%@",item_dict[@"licheng"]];
    
}

@end
