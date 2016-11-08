//
//  ViewController.m
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SlideNavigationController

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
}

@end
