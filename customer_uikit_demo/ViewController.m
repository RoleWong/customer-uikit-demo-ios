//
//  ViewController.m
//  customer_uikit_demo
//
//  Created by Role Wong on 8/5/24.
//

#import "ViewController.h"
#import "TUIC2CChatViewController.h"
#import <TencentCloudAIDeskCustomer/TencentCloudCustomerManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:0.94 green:0.97 blue:1.0 alpha:1.0].CGColor,
                             (__bridge id)[UIColor colorWithRed:0.89 green:0.93 blue:1.0 alpha:1.0].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer insertSublayer:gradientLayer atIndex:0];

    // 介绍文本
    UILabel *introLabel = [[UILabel alloc] init];
    introLabel.text = @"AI-driven customer service UIKit for Tencent Cloud Desk (customer-side), providing efficient and seamless communication with both AI and human agents.";
    introLabel.textColor = [UIColor darkGrayColor];
    introLabel.font = [UIFont systemFontOfSize:14];
    introLabel.numberOfLines = 0;
    introLabel.textAlignment = NSTextAlignmentCenter;
    introLabel.frame = CGRectMake(30, 200, self.view.bounds.size.width - 60, 100);
    [self.view addSubview:introLabel];
    
    // 图标
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
    iconView.frame = CGRectMake(30, 200, 50, 40);
    iconView.center = CGPointMake(self.view.center.x, 120);
    [self.view addSubview:iconView];

    // "Customer Service Chat" 按钮
    UIButton *customerServiceButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [customerServiceButton setTitle:@"Customer Service Chat" forState:UIControlStateNormal];
    customerServiceButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [customerServiceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    customerServiceButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
    customerServiceButton.layer.cornerRadius = 10;
    customerServiceButton.layer.shadowColor = [UIColor blackColor].CGColor;
    customerServiceButton.layer.shadowOffset = CGSizeMake(0, 2);
    customerServiceButton.layer.shadowOpacity = 0.3;
    customerServiceButton.layer.shadowRadius = 5;
    customerServiceButton.frame = CGRectMake(0, 0, 250, 50);
    customerServiceButton.center = CGPointMake(self.view.center.x, self.view.bounds.size.height - 280);
    [customerServiceButton addTarget:self action:@selector(chatButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customerServiceButton];
    

    // "Normal Chat" 按钮
    UIButton *normalChatButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [normalChatButton setTitle:@"Normal Chat" forState:UIControlStateNormal];
    normalChatButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [normalChatButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal]; // 深灰色文字
    normalChatButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]; // 浅灰色背景
    normalChatButton.layer.cornerRadius = 10;
    normalChatButton.layer.shadowColor = [UIColor blackColor].CGColor;
    normalChatButton.layer.shadowOffset = CGSizeMake(0, 2);
    normalChatButton.layer.shadowOpacity = 0.1; // 轻微阴影，符合二级按钮风格
    normalChatButton.layer.shadowRadius = 3;
    normalChatButton.frame = CGRectMake(0, 0, 250, 50);
    normalChatButton.center = CGPointMake(self.view.center.x, self.view.bounds.size.height - 120);
    [normalChatButton addTarget:self action:@selector(normalChatButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:normalChatButton];
    
    // 说明 Label
    UILabel *normalChatDescriptionLabel = [[UILabel alloc] init];
    normalChatDescriptionLabel.text = @"Normal Chat is a pure Tencent Cloud Chat component.";
    normalChatDescriptionLabel.textColor = [UIColor darkGrayColor];
    normalChatDescriptionLabel.font = [UIFont systemFontOfSize:14];
    normalChatDescriptionLabel.numberOfLines = 0;
    normalChatDescriptionLabel.textAlignment = NSTextAlignmentCenter;
    normalChatDescriptionLabel.frame = CGRectMake(30, normalChatButton.frame.origin.y - 40, self.view.bounds.size.width - 60, 50);
    [self.view addSubview:normalChatDescriptionLabel];

}

// 客服聊天按钮点击事件
- (void)chatButtonTapped {
    [[TencentCloudCustomerManager sharedManager] pushToCustomerServiceViewControllerFromController:self];
}

// 普通聊天按钮点击事件
- (void)normalChatButtonTapped {
    TUIChatConversationModel *conversationData = [[TUIChatConversationModel alloc] init];
    conversationData.userID = @"admin";
    
    TUIBaseChatViewController *chatVC = nil;
    chatVC = [[TUIC2CChatViewController alloc] init];
    chatVC.conversationData = conversationData;
    
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end

