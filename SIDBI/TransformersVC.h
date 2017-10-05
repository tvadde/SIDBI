//
//  TransformersVC.h
//  SIDBI
//
//  Created by click2clinic3 on 02/10/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TPKeyboardAvoiding/TPKeyboardAvoidingTableView.h>

@interface TransformersVC :  UIViewController <UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingTableView *registrationTableView;
@property (weak, nonatomic) IBOutlet UIPickerView *listPickerView;
@property (weak, nonatomic) IBOutlet UIToolbar *dissmissKeyBoardView;
-(IBAction)keyboardDoneBtnTapped:(id)sender;

@end
