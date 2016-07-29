//
//  TouchOneVC.h
//  3DTouchExample
//
//  Created by Mital Solanki on 27/07/16.
//  Copyright © 2016 Mital Solanki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchOneVC : UIViewController <UIViewControllerPreviewingDelegate>
{
    __weak IBOutlet UITableView *aTableView;
}

@property (nonatomic, strong) id previewingContext;

@end
