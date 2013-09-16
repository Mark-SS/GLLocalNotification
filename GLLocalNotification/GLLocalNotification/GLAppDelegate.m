//
//  GLAppDelegate.m
//  GLLocalNotification
//
//  Created by gongliang on 13-9-10.
//  Copyright (c) 2013年 gongliang. All rights reserved.
//


#import "GLAppDelegate.h"

NSString *didReceiveLocalNotification = @"didReceiveLocalNotification";


@implementation GLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self createLocalNotification];
    return YES;
}

//创建一个本地推送
- (void)createLocalNotification {
    UILocalNotification *notification = [UILocalNotification new];
    
    if (!notification) {
        return;
    }
    
    
    //获取当前日期
    NSInteger time = [[NSDate date]timeIntervalSince1970];
    time = time + 5;
    
    
    NSDate *pushDate = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSLog(@"pushDate = %@",pushDate);
    //设置推送时间
    notification.fireDate = pushDate;
    //设置时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    //设置重复间隔
    notification.repeatInterval = kCFCalendarUnitDay;
    //设置推送声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    //推送内容
    notification.alertBody = @"爱台球，逛论坛";
    //显示在icon上得红色圈子的数字
    notification.applicationIconBadgeNumber ++;
    //设置userInfo 方便在之后需要撤销的时候使用
    NSDictionary *info = @{@"key":@"name"};
    notification.userInfo = info;
    //添加推送到UIApplication
    UIApplication *app = [UIApplication sharedApplication];
    [app scheduleLocalNotification:notification];
    
    
    
}

//第三步：解除本地推送
//- (void) removeLocalNotication {
//    // 获得 UIApplication
//
//    UIApplication *app = [UIApplication sharedApplication];
//
//    //获取本地推送数组
//
//    NSArray *localArray = [app scheduledLocalNotifications];
//
//    //声明本地通知对象
//
//    UILocalNotification *localNotification;
//
//    if (localArray) {
//
//
//        for (UILocalNotification *noti in localArray) {
//
//
//            NSDictionary *dict = noti.userInfo;
//
//
//            if (dict) {
//
//
//                NSString *inKey = [dict objectForKey:@"key"];
//
//
//                if ([inKey isEqualToString:@"name"]) {
//
//
//                    if (localNotification){
//                       localNotification = nil;
//                        localNotification.applicationIconBadgeNumber =0;
//
//
//                    }
//                    break;
//
//
//                }
//
//
//            }
//
//
//        }
//
//
//        //判断是否找到已经存在的相同key的推送
//
//
//        if (!localNotification) {
//
//
//            //不存在初始化
//            localNotification = [[UILocalNotification alloc] init];
//
//
//        }if (localNotification) {
//
//
//            //不推送 取消推送
//            [app cancelLocalNotification:localNotification];
//            return;
//
//
//        }
//
//    }
//}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"not = %@",notification.userInfo);
    application.applicationIconBadgeNumber --;
    [[NSNotificationCenter defaultCenter]postNotificationName:didReceiveLocalNotification
                                                       object:nil
                                                     userInfo:nil];
}

@end
