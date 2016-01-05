//
//  TestTableViewController.h
//  Test22
//
//  Created by Владимир Мельников on 03/01/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestTableViewControllerDelegate;

@interface TestTableViewController : UITableViewController

@property (weak, nonatomic)id <TestTableViewControllerDelegate> testDelegate;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end




@protocol TestTableViewControllerDelegate <NSObject>

- (void)viewDidScrollOnDelta:(CGFloat)delta;

@end
