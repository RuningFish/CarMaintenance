//
//  CMNMaintenanceRecordCell.h
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMNMaintenanceRecordCell : UITableViewCell
@property (nonatomic,strong) NSDictionary *item_dict;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
