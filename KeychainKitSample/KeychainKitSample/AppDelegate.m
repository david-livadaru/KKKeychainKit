//
//  AppDelegate.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

#import "AppDelegate.h"
#import "KKSDataModel.h"
#import "KKSViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupRootViewController];
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

#pragma mark - Private Interface

- (void)setupRootViewController {
    UITabBarController *tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    tabBarController.viewControllers = [self tabBarViewControllers];
    self.window.rootViewController = tabBarController;
}

- (NSArray *)tabBarViewControllers {
    UINavigationController *addNavigationViewController =
    [self navigationViewControllerForOperationType:KKKeychainOperationTypeAdd];
    UINavigationController *updateNavigationViewController =
    [self navigationViewControllerForOperationType:KKKeychainOperationTypeUpdate];
    UINavigationController *deleteNavigationViewController =
    [self navigationViewControllerForOperationType:KKKeychainOperationTypeDelete];
    UINavigationController *searchNavigationViewController =
    [self navigationViewControllerForOperationType:KKKeychainOperationTypeSearch];
    return @[addNavigationViewController, updateNavigationViewController, deleteNavigationViewController,
             searchNavigationViewController];
}

- (UINavigationController *)navigationViewControllerForOperationType:(KKKeychainOperationType)operationType {
    NSArray *model = [self modelForOperationType:operationType];
    KKSViewController *viewController = [[KKSViewController alloc] initWithModel:model];
    UINavigationController *navigationViewController =
    [[UINavigationController alloc] initWithRootViewController:viewController];
    UIImage *tabBarItemImage = [UIImage imageNamed:[self imageNameForOperationType:operationType]];
    navigationViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                                        image:tabBarItemImage
                                                                selectedImage:nil];
    return navigationViewController;
}

- (NSArray *)modelForOperationType:(KKKeychainOperationType)operationType {
    KKSDataModel *accountModel = [[KKSDataModel alloc] initWithOperationType:operationType
                                                                    dataType:KKKeychainSampleDataTypeAccount];
    KKSDataModel *stringModel = [[KKSDataModel alloc] initWithOperationType:operationType
                                                                   dataType:KKKeychainSampleDataTypeString];
    KKSDataModel *dictionaryModel =
    [[KKSDataModel alloc] initWithOperationType:operationType
                                       dataType:KKKeychainSampleDataTypeDictionary];
    KKSDataModel *imageModel = [[KKSDataModel alloc] initWithOperationType:operationType
                                                                  dataType:KKKeychainSampleDataTypeImage];
    return @[accountModel, stringModel, dictionaryModel, imageModel];
}

- (NSString *)imageNameForOperationType:(KKKeychainOperationType)operationType {
    switch (operationType) {
        case KKKeychainOperationTypeAdd:
            return @"add";
        case KKKeychainOperationTypeUpdate:
            return @"refresh";
        case KKKeychainOperationTypeDelete:
            return @"delete";
        case KKKeychainOperationTypeSearch:
            return @"search";
        default:
            return @"";
    }
}

@end
