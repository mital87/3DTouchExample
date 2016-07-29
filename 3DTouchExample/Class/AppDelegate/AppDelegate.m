//
//  AppDelegate.m
//  3DTouchExample
//
//  Created by Mital Solanki on 27/07/16.
//  Copyright © 2016 Mital Solanki. All rights reserved.
//

#import "AppDelegate.h"
#import "TouchOneVC.h"
#import "TouchTwoVC.h"
#import "TouchThreeVC.h"
#import "TouchFourVC.h"
#import "MenuPageVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    BOOL shouldPerformAdditionalDelegateHandling = YES;
    
    // Check API availiability
    // UIApplicationShortcutItem is available in iOS 9 or later.
    if([[UIApplicationShortcutItem class] respondsToSelector:@selector(new)])
    {
        [self configureDynamicShortcutItems];
        
        // If a shortcut was launched, display its information and take the appropriate action
        UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKeyedSubscript:UIApplicationLaunchOptionsShortcutItemKey];
        
        if(shortcutItem)
        {
            // When the app launch at first time, this block can not called.
            [self handleShortCutItem:shortcutItem];
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
            shouldPerformAdditionalDelegateHandling = NO;
        }
        else
        {
            // normal app launch process without quick action
        }
    }
    else
    {
        // Less than iOS9 or later
    }
    
    return shouldPerformAdditionalDelegateHandling;
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

/*
 Called when the user activates your application by selecting a shortcut on the home screen, except when
 application(_:,willFinishLaunchingWithOptions:) or application(_:didFinishLaunchingWithOptions) returns `false`.
 You should handle the shortcut in those callbacks and return `false` if possible. In that case, this
 callback is used if your application is already launched in the background.
 */

#pragma mark - perform action for shortcut item

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    BOOL handledShortCutItem = [self handleShortCutItem:shortcutItem];
    completionHandler(handledShortCutItem);
}

#pragma mark - Custom Methods

- (void)configureDynamicShortcutItems
{
    /**
     *  after first launch, users can see dynamic shortcutItems
     */
    
    UIApplicationShortcutItem *shortcutFavourite = [[UIApplicationShortcutItem alloc] initWithType:[NSString stringWithFormat:@"%@.favourite", [[NSBundle mainBundle] bundleIdentifier]] localizedTitle:@"Favourite" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"Shortcut_Menu_Favourite"] userInfo:@{@"Name":@"Brian Smith"}];
    
    UIApplicationShortcutItem *shortcutRemove = [[UIApplicationShortcutItem alloc] initWithType:[NSString stringWithFormat:@"%@.remove", [[NSBundle mainBundle] bundleIdentifier]] localizedTitle:@"Remove" localizedSubtitle:nil icon:nil userInfo:nil];
    
    // add all items to an array
    NSArray *arrShortcutItems = @[shortcutFavourite, shortcutRemove];
    
    // add the array to our app
    [UIApplication sharedApplication].shortcutItems = arrShortcutItems;
}

- (BOOL)handleShortCutItem : (UIApplicationShortcutItem *)shortcutItem
{
    /**
     *  perform quick action for selected shortcut items
     */
    
    BOOL handled = NO;
    
    MenuPageVC *menuPageVC = (MenuPageVC *)[((UINavigationController *)_window.rootViewController).viewControllers lastObject];
    
    if ([shortcutItem.type isEqualToString:[NSString stringWithFormat:@"%@.add", [[NSBundle mainBundle] bundleIdentifier]]])
    {
        handled = YES;
        [menuPageVC openContentViewControllerForMenu:AMSlideMenuLeft atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    }
    else if ([shortcutItem.type isEqualToString:[NSString stringWithFormat:@"%@.like", [[NSBundle mainBundle] bundleIdentifier]]])
    {
        handled = YES;
        [menuPageVC openContentViewControllerForMenu:AMSlideMenuLeft atIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    }
    else if ([shortcutItem.type isEqualToString:[NSString stringWithFormat:@"%@.favourite", [[NSBundle mainBundle] bundleIdentifier]]])
    {
        handled = YES;
        [menuPageVC openContentViewControllerForMenu:AMSlideMenuLeft atIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    }
    else if ([shortcutItem.type isEqualToString:[NSString stringWithFormat:@"%@.remove", [[NSBundle mainBundle] bundleIdentifier]]])
    {
        handled = YES;
        [menuPageVC openContentViewControllerForMenu:AMSlideMenuLeft atIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    }
    
    return handled;
}

@end
