//
//  MenuPageVC.m
//  3DTouchExample
//
//  Created by Mital Solanki on 29/07/16.
//  Copyright © 2016 Mital Solanki. All rights reserved.
//

#import "MenuPageVC.h"

@interface MenuPageVC ()

@end

@implementation MenuPageVC

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Override Methods

- (NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    
    switch (indexPath.row)
    {
        case 0:
            identifier = @"TouchOneSegue";
            break;
            
        case 1:
            identifier = @"TouchTwoSegue";
            break;
            
        case 2:
            identifier = @"TouchThreeSegue";
            break;
            
        case 3:
            identifier = @"TouchFourSegue";
            break;
    }
    
    return identifier;
}

- (CGFloat)leftMenuWidth
{
    return ([[UIScreen mainScreen] bounds].size.width - 80);
}

- (UIViewAnimationOptions) openAnimationCurve
{
    return UIViewAnimationOptionCurveEaseOut;
}

- (UIViewAnimationOptions) closeAnimationCurve
{
    return UIViewAnimationOptionCurveEaseOut;
}

- (AMPrimaryMenu)primaryMenu
{
    return AMPrimaryMenuLeft;
}

// Enabling Deepnes on left menu
- (BOOL)deepnessForLeftMenu
{
    return NO;
}

// Enabling darkness while left menu is opening
- (CGFloat)maxDarknessWhileLeftMenu
{
    return 0.0;
}

@end
