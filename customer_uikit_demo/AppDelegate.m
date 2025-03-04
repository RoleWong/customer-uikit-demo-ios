//
//  AppDelegate.m
//  customer_uikit_demo
//
//  Created by Role Wong on 8/5/24.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Private/GenerateTestUserSig.h"
#import "TencentCloudAIDeskCustomer/TencentCloudCustomerManager.h"
#import "TUILogin.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *userID = test_userID;
    NSString *userSig = [GenerateTestUserSig genTestUserSig:userID];
    
    [self login:userID userSig:(NSString *)userSig];
    
    return YES;
}

- (void)login:(NSString *)userID userSig:(NSString *)sig {
//    [[V2TIMManager sharedInstance] callExperimentalAPI:@"setTestEnvironment" param:@(true) succ:^(NSObject *result) {
//        [TUILogin login:public_SDKAPPID userID:userID userSig:sig succ:^{
//                NSLog(@"登录成功");
//            } fail:^(int code, NSString *msg) {
//                NSLog(@"登录失败");
//            }];
//        
//        [[TencentCloudCustomerManager sharedManager] loginWithSdkAppID:public_SDKAPPID userID:userID userSig:sig completion:^(NSError *error) {
//            [[TencentCloudCustomerManager sharedManager] setCustomerServiceUserID: customer_service_id];
//        }];
//    } fail:^(int code, NSString *desc) {
//
//    }];
    
    [TUILogin login:public_SDKAPPID userID:userID userSig:sig succ:^{
            NSLog(@"登录成功");
        } fail:^(int code, NSString *msg) {
            NSLog(@"登录失败");
        }];
    
    [[TencentCloudCustomerManager sharedManager] loginWithSdkAppID:public_SDKAPPID userID:userID userSig:sig completion:^(NSError *error) {
        [[TencentCloudCustomerManager sharedManager] setCustomerServiceUserID: customer_service_id];
    }];
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end

