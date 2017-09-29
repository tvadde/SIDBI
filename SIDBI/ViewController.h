//
//  ViewController.h
//  SIDBI
//
//  Created by Thukaram Vadde on 29/09/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *registrationScrollView;
@property (weak, nonatomic) IBOutlet UIView *registrationSupportView;

@end

