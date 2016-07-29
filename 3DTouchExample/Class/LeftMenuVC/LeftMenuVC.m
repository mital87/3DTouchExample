//
//  LeftMenuVC.m
//  3DTouchExample
//
//  Created by Mital Solanki on 29/07/16.
//  Copyright © 2016 Mital Solanki. All rights reserved.
//

#import "LeftMenuVC.h"

@interface LeftMenuVC ()

@end

@implementation LeftMenuVC

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.aMutLeftMenuArray = [NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Touch One VC", @"MenuName", nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Touch Two VC", @"MenuName", nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Touch Three VC", @"MenuName", nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Touch Four VC", @"MenuName", nil], nil];
}

#pragma mark - UITableView DataSource / Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (([[UIScreen mainScreen] bounds].size.height - 420) / 2);
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect aRect = [[UIScreen mainScreen] bounds];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, aRect.size.width, ((aRect.size.height - 420) / 2))];
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.aMutLeftMenuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"LeftMenuCell" forIndexPath:indexPath];
    UILabel *lblMenuName = (UILabel *)[aCell viewWithTag:101];
    [lblMenuName setText:self.aMutLeftMenuArray[indexPath.row][@"MenuName"]];
    return aCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.mainVC respondsToSelector:@selector(navigationControllerForIndexPathInLeftMenu:)])
    {
        UINavigationController *navController = [self.mainVC navigationControllerForIndexPathInLeftMenu:indexPath];
        AMSlideMenuContentSegue *segue = [[AMSlideMenuContentSegue alloc] initWithIdentifier:@"ContentSugue" source:self destination:navController];
        [segue perform];
    }
    else
    {
        NSString *segueIdentifier = [self.mainVC segueIdentifierForIndexPathInLeftMenu:indexPath];
        if (segueIdentifier && segueIdentifier.length > 0)
            [self performSegueWithIdentifier:segueIdentifier sender:self];
    }
}

@end
