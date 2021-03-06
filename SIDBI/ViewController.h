//
//  ViewController.h
//  SIDBI
//
//  Created by Thukaram Vadde on 29/09/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TPKeyboardAvoiding/TPKeyboardAvoidingTableView.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *roundCornerView;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingTableView *registrationTableView;
@property (weak, nonatomic) IBOutlet UIPickerView *listPickerView;
@property (weak, nonatomic) IBOutlet UIToolbar *dissmissKeyBoardView;

-(IBAction)keyboardDoneBtnTapped:(id)sender;
@end

