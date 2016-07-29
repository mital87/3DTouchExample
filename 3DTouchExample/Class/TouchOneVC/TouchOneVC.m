//
//  TouchOneVC.m
//  3DTouchExample
//
//  Created by Mital Solanki on 27/07/16.
//  Copyright © 2016 Mital Solanki. All rights reserved.
//

#import "TouchOneVC.h"
#import "TouchTwoVC.h"
#import "TouchThreeVC.h"
#import "TouchFourVC.h"
#import "AMSlideMenuMainViewController.h"

@interface TouchOneVC ()

@end

@implementation TouchOneVC

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self isForceTouchAvailable])
        self.previewingContext = [self registerForPreviewingWithDelegate:self sourceView:aTableView];
}

#pragma mark - UIButton Click Event

- (IBAction)MenuBtnClick:(UIButton *)sender
{
    AMSlideMenuMainViewController *mainVC = [AMSlideMenuMainViewController getInstanceForVC:self];
    [mainVC openLeftMenu];
}

#pragma mark - UITableView DataSource / Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    UILabel *lblRow = (UILabel *)[aCell viewWithTag:100];
    [lblRow setText:[NSString stringWithFormat:@"Row Index : %ld", indexPath.row+1]];
    return aCell;
}

#pragma mark - UIViewControllerPreviewing Delegate Methods

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    if ([self.presentedViewController isKindOfClass:[TouchTwoVC class]])
        return nil;
    
    CGPoint cellPostion = [aTableView convertPoint:location fromView:aTableView];
    NSIndexPath *aIndexPath = [aTableView indexPathForRowAtPoint:cellPostion];
    
    if (aIndexPath)
    {
        if (aIndexPath.row % 3 == 0)
        {
            TouchTwoVC *touchTwoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TouchTwoVC"];
            return touchTwoVC;
        }
        else if (aIndexPath.row % 3 == 1)
        {
            TouchThreeVC *touchThreeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TouchThreeVC"];
            return touchThreeVC;
        }
        else
        {
            TouchFourVC *touchFourVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TouchFourVC"];
            return touchFourVC;
        }
    }
    return nil;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showDetailViewController:viewControllerToCommit sender:self];
}

#pragma mark - Custom Methods

- (BOOL)isForceTouchAvailable
{
    BOOL isForceTouchAvailable = NO;
    
    if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)])
        isForceTouchAvailable = self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable;
    
    return isForceTouchAvailable;
}

#pragma mark - UITraitEnvironment Methods

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    
    if ([self isForceTouchAvailable])
    {
        if (!self.previewingContext)
            self.previewingContext = [self registerForPreviewingWithDelegate:self sourceView:aTableView];
    }
    else
    {
        if (self.previewingContext)
        {
            [self unregisterForPreviewingWithContext:self.previewingContext];
            self.previewingContext = nil;
        }
    }
}

@end
