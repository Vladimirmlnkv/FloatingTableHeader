//
//  TestTableViewController.m
//  Test22
//
//  Created by Владимир Мельников on 03/01/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

#import "TestTableViewController.h"

@interface TestTableViewController ()

@property (assign, nonatomic)CGFloat lastContentOffset;

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testDelegate = (id <TestTableViewControllerDelegate>) self.tableView;
    
    self.navigationItem.title = @"Test Table";
    self.navigationController.navigationBar.backgroundColor = [self randomColor];
    self.navigationController.navigationBar.translucent = NO;
    self.tableView.scrollsToTop = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat delta;
    
    if (!(self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height) | self.tableView.contentOffset.y <= 0)) {
        delta = self.lastContentOffset - scrollView.contentOffset.y;
    } else {
        delta = 0;
    }
    
    self.lastContentOffset = scrollView.contentOffset.y;
    [self.testDelegate viewDidScrollOnDelta:delta];
}

#pragma mark - Support Methods

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [self randomColor];
    
    return cell;
}
@end
