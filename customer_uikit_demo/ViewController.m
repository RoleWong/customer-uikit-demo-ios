//
//  ViewController.m
//  customer_uikit_demo
//
//  Created by Role Wong on 8/5/24.
//

#import "ViewController.h"
#import <TencentCloudCustomer/TencentCloudCustomerManager.h>

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up background gradient to match chat page style
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:0.94 green:0.97 blue:1.0 alpha:1.0].CGColor,
                             (__bridge id)[UIColor colorWithRed:0.89 green:0.93 blue:1.0 alpha:1.0].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer insertSublayer:gradientLayer atIndex:0];

    // Set up introduction text with icon
    UILabel *introLabel = [[UILabel alloc] init];
    introLabel.text = @"腾讯云即时通信 IM 智能客服，凭借腾讯多年在即时通信领域和人工智能领域的深厚积累，为企业提供了一站式的客户服务解决方案。您可以简单的将智能客服集成到企业网站、移动应用和小程序等平台中，为您的用户提供高效的客户服务。";
    introLabel.textColor = [UIColor darkGrayColor];
    introLabel.font = [UIFont systemFontOfSize:14];
    introLabel.numberOfLines = 0;
    introLabel.textAlignment = NSTextAlignmentCenter;
    introLabel.frame = CGRectMake(30, 200, self.view.bounds.size.width - 60, 100);
    [self.view addSubview:introLabel];
    
    // Add icon to the left of the intro text
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
    iconView.frame = CGRectMake(30, 200, 50, 40);
    iconView.center = CGPointMake(self.view.center.x, 120);
    [self.view addSubview:iconView];

    // Create the button for "立即体验" (Experience Now)
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
    button.layer.cornerRadius = 10;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOffset = CGSizeMake(0, 2);
    button.layer.shadowOpacity = 0.3;
    button.layer.shadowRadius = 5;

    // Set button size and position
    button.frame = CGRectMake(0, 0, 200, 50);
    button.center = CGPointMake(self.view.center.x, self.view.bounds.size.height - 150); // Slightly below center
    [button addTarget:self action:@selector(chatButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)chatButtonTapped {
    [[TencentCloudCustomerManager sharedManager] pushToCustomerServiceViewControllerFromController:self];
}

@end
