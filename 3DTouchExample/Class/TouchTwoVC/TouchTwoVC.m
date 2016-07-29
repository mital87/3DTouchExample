//
//  TouchTwoVC.m
//  3DTouchExample
//
//  Created by Mital Solanki on 27/07/16.
//  Copyright © 2016 Mital Solanki. All rights reserved.
//

#import "TouchTwoVC.h"
#import "AMSlideMenuMainViewController.h"

@interface TouchTwoVC ()

@end

@implementation TouchTwoVC

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UIButton Click Event

- (IBAction)MenuBtnClick:(UIButton *)sender
{
    AMSlideMenuMainViewController *mainVC = [AMSlideMenuMainViewController getInstanceForVC:self];
    [mainVC openLeftMenu];
}

#pragma mark - UIPreviewActionItem Handler

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
//    __weak TouchTwoVC *weakSelf = self;
    
    UIPreviewAction *addAction = [UIPreviewAction actionWithTitle:@"Add" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction *action, UIViewController *previewViewController)
    {
        NSLog(@"UIPreviewActionItem - Add");
    }];
    
    UIPreviewAction *likeAction = [UIPreviewAction actionWithTitle:@"Like" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction *action, UIViewController *previewViewController)
    {
         NSLog(@"UIPreviewActionItem - Like");
    }];
    
    UIPreviewAction *favouriteAction = [UIPreviewAction actionWithTitle:@"Favourite" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction *action, UIViewController *previewViewController)
    {
         NSLog(@"UIPreviewActionItem - Favourite");
    }];
    
    UIPreviewAction *removeAction = [UIPreviewAction actionWithTitle:@"Remove" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction *action, UIViewController *previewViewController)
    {
         NSLog(@"UIPreviewActionItem - Remove");
    }];
    
    return @[addAction, likeAction, favouriteAction, removeAction];
}

@end
