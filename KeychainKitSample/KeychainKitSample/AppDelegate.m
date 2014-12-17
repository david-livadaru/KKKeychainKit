//
//  AppDelegate.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "AppDelegate.h"
#import "KKSAddViewController.h"
#import "KKSUpdateViewController.h"
#import "KKSDeleteViewController.h"
#import "KKSSearchViewController.h"
#import "KKSFetchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    KKSAddViewController *addViewController = [[KKSAddViewController alloc] initWithNibName:nil bundle:nil];
    addViewController.view.backgroundColor = [UIColor greenColor];
    addViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                                 image:[UIImage imageNamed:@"add"]
                                                         selectedImage:nil];
    KKSUpdateViewController *updateViewController = [[KKSUpdateViewController alloc] initWithNibName:nil bundle:nil];
    updateViewController.view.backgroundColor = [UIColor cyanColor];
    updateViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                                    image:[UIImage imageNamed:@"refresh"]
                                                            selectedImage:nil];
    KKSDeleteViewController *deleteViewController = [[KKSDeleteViewController alloc] initWithNibName:nil bundle:nil];
    deleteViewController.view.backgroundColor = [UIColor redColor];
    deleteViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                                    image:[UIImage imageNamed:@"delete"]
                                                            selectedImage:nil];
    KKSSearchViewController *searchViewController = [[KKSSearchViewController alloc] initWithNibName:nil bundle:nil];
    searchViewController.view.backgroundColor = [UIColor magentaColor];
    searchViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                                    image:[UIImage imageNamed:@"search"]
                                                            selectedImage:nil];
    KKSFetchViewController *fetchViewController = [[KKSFetchViewController alloc] initWithNibName:nil bundle:nil];
    fetchViewController.view.backgroundColor = [UIColor purpleColor];
    fetchViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                                   image:[UIImage imageNamed:@"download"]
                                                           selectedImage:nil];
    tabBarController.viewControllers = @[addViewController, updateViewController, deleteViewController,
                                         searchViewController, fetchViewController];
    self.window.rootViewController = tabBarController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
