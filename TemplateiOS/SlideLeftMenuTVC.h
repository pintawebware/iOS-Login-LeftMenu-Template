//
//  SlideLeftMenuTVC.h
//  jobLocal
//
//  Created by PInta on 6/8/16.
//  Copyright © 2016 PInta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface SlideLeftMenuTVC : UIViewController <UITableViewDelegate, UITableViewDataSource, SlideNavigationControllerDelegate>

@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@property (nonatomic, weak) IBOutlet UITableView *tableViews;

@end