//
//  RegistrationCell.h
//  SIDBI
//
//  Created by Thukaram Vadde on 29/09/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *placeHolderLbl;
@property (nonatomic, weak) IBOutlet UIView *borderView;
@property (nonatomic, weak) IBOutlet UITextField *userTextField;

@end
