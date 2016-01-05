//
//  TestView.m
//  Test22
//
//  Created by Владимир Мельников on 05/01/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

#import "TestView.h"
#import "TestTableViewController.h"

@interface TestView () <TestTableViewControllerDelegate>

@property (strong, nonatomic)UIView *header;
@property (assign, nonatomic)CGFloat delta;
@property (assign, nonatomic)CGFloat offset;
@property (assign, nonatomic)CGFloat lastContentOffset;

@end

@implementation TestView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:self.tableHeaderView.frame];
        [view addSubview:self.tableHeaderView];
        view.backgroundColor = [UIColor whiteColor];
        self.header = view;
        self.delta = 0;
        [self addSubview:view];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat yCoordinate = self.offset + self.delta;
    
    if (self.offset == 0) {
        yCoordinate = 0;
    }
    self.header.frame = CGRectMake(0, yCoordinate, 320, 44);
}

#pragma mark - TestTableViewControllerDelegate

- (void)viewDidScrollOnDelta:(CGFloat)delta {
    
    CGFloat headerHeight = self.header.frame.size.height;
    
    self.offset = self.contentOffset.y <= 0 ? 0 : self.contentOffset.y;
    
    if (delta < 0 && self.delta > - headerHeight*2) {
        
        self.delta += delta;
        
    } else if (delta > 0) {
        
        CGFloat tmp = self.delta + delta;
        if (tmp > - headerHeight && self.offset > headerHeight) {
            self.delta = - headerHeight;
        } else if (tmp > 0 && self.offset <= headerHeight) {
            self.delta = 0;
        } else {
            self.delta += delta;
        }
        
    }
}

@end
