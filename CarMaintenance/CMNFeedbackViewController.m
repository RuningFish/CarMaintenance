//
//  CMNFeedbackViewController.m
//  CarMaintenance
//
//  Created by runingfish on 2025/7/20.
//

#import "CMNFeedbackViewController.h"

@implementation CMNFeedbackViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    
    UILabel *cmn_feedback_title_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, [UIScreen mainScreen].bounds.size.width - 20, 30)];
    [self.view addSubview:cmn_feedback_title_label];
    cmn_feedback_title_label.text = @"请填写您的意见或建议";
    cmn_feedback_title_label.textColor = [UIColor blackColor];
    cmn_feedback_title_label.textAlignment = NSTextAlignmentLeft;
    cmn_feedback_title_label.font = [UIFont systemFontOfSize:16];
    
    UITextView *cmn_feedback_textView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(cmn_feedback_title_label.frame) + 24, self.view.frame.size.width - 20, 198)];
    [self.view addSubview:cmn_feedback_textView];
    cmn_feedback_textView.layer.borderWidth = 1;
    cmn_feedback_textView.layer.borderColor = [UIColor whiteColor].CGColor;
    cmn_feedback_textView.layer.cornerRadius = 5;
    cmn_feedback_textView.layer.masksToBounds = YES;
    
    UIButton *cmn_feedback_confirm_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:cmn_feedback_confirm_button];
    cmn_feedback_confirm_button.frame = CGRectMake(10, CGRectGetMaxY(cmn_feedback_textView.frame)+41, [UIScreen mainScreen].bounds.size.width - 20, 44);
    [cmn_feedback_confirm_button setTitle:@"确认反馈" forState:UIControlStateNormal];
    [cmn_feedback_confirm_button setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    cmn_feedback_confirm_button.titleLabel.font = [UIFont systemFontOfSize:20];
    [cmn_feedback_confirm_button addTarget:self action:@selector(cmn_feedback_confirm_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    cmn_feedback_confirm_button.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    cmn_feedback_confirm_button.layer.cornerRadius = 10;cmn_feedback_confirm_button.layer.masksToBounds = YES;
}

- (void)cmn_feedback_confirm_buttonClick:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
