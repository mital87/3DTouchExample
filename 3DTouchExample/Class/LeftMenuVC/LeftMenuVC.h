//
//  LeftMenuVC.h
//  3DTouchExample
//
//  Created by Mital Solanki on 29/07/16.
//  Copyright © 2016 Mital Solanki. All rights reserved.
//

#import "AMSlideMenuLeftTableViewController.h"
#import "AMSlideMenuMainViewController.h"
#import "AMSlideMenuContentSegue.h"

@interface LeftMenuVC : AMSlideMenuLeftTableViewController

@property (strong, nonatomic) IBOutlet UITableView *tblLeftMenu;
@property (nonatomic, strong)NSMutableArray *aMutLeftMenuArray;

@end
