//
//  SlideLeftMenuTVC.m
//  jobLocal
//
//  Created by PInta on 6/8/16.
//  Copyright © 2016 PInta. All rights reserved.
//

#import "SlideLeftMenuTVC.h"

#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

#define CELL_IDENTIFIER @"leftMenuCellId"

@interface SlideLeftMenuTVC ()
{
    NSInteger currentSection;
}

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation SlideLeftMenuTVC

#pragma Setters/Getters

- (NSArray *)dataSource
{
    switch (currentSection) {
        case 0:
            return [[NSArray alloc] initWithObjects:@"Profile", @"Select categories", @"History", nil];//[LeftMenuDataSource leftMenuTitlesFirstSection];
            break;
            
        case 1:
            return [[NSArray alloc] initWithObjects:@"Statistics", @"Settings", nil];
            break;
            
        case 2:
            return [[NSArray alloc] initWithObjects:@"Sign Out", nil];
            break;
            
        default:
            return nil;
            break;
    }
}

#pragma mark viewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.slideOutAnimationEnabled = YES;
    currentSection = 0;
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}

- (void)setupView{
    [[SlideNavigationController sharedInstance] setEnableShadow:YES];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    currentSection = section;
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    currentSection = indexPath.section;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
    }
    
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc;
    
    switch (indexPath.section) {
        case 0:
            //if (indexPath.row == 0) vc = [self.storyboard instantiateViewControllerWithIdentifier: @"INDF"];
            break;
            
        case 1:
            //if (indexPath.row == 0) vc = [self.storyboard instantiateViewControllerWithIdentifier: @"INDF"];
            break;
            
        case 3:
            //if (indexPath.row == 0) vc = [self.storyboard instantiateViewControllerWithIdentifier: @"INDF"];
            break;
            
        default:
            break;
    }
    
    if (vc) {
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                                 withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 65;
    }
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 60;
    return height;
}

@end
