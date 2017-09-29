//
//  ViewController.m
//  SIDBI
//
//  Created by Thukaram Vadde on 29/09/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.registrationScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1007);
    self.registrationSupportView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1007);
    self.re
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
