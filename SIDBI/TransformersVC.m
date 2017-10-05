//
//  TransformersVC.m
//  SIDBI
//
//  Created by click2clinic3 on 02/10/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import "TransformersVC.h"
#import "RegistrationCell.h"

@interface TransformersVC()
@property (nonatomic, strong) NSMutableArray *placeHolderTextArray;
@property (nonatomic, strong) NSMutableArray *ClassOfMotorsList;
@property (nonatomic, strong) NSMutableArray *ConnectionsList;
@property (nonatomic, strong) NSMutableArray *InsulationClassList;
@property (nonatomic,strong) NSMutableArray *VFDList;
@property (nonatomic, strong) NSMutableArray *SideRatedVoltageArray;
@property (nonatomic, strong) NSMutableArray *numberOfPhases;
@property(nonatomic, strong) NSMutableArray *numberOfTapPositions;
@property (nonatomic, strong) NSMutableArray *inputArray;
@property (nonatomic, strong) UITextField *selectedTextfield;
@end

@implementation TransformersVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.placeHolderTextArray = [[NSMutableArray alloc]initWithObjects:@"Name Of Manufacturer OF Transformer",@"Year OF Installation",@"Serial Number Of Transformer",@"Type OF Cooling",@"Rated KVA",@"Rated Frequnecy",@"HT Side Read Voltage",@"Rated No Load Voltage LT Side",@"Rated AMP HT Side",@"Rated AMP LT Side", @"HT Side Number Of Phases",@"HT Side Number Of Phases", @"Rated Impedence",@"Number of Tap Positions",@"Availabilty Of the Transfomerstest Certificate",nil];
    self.SideRatedVoltageArray = [[NSMutableArray alloc]initWithObjects:@"400 kv",@"200 kv",@"110 kv",@"66 kv",@"33 kv",@"11 kv",@"6.6 kv",@"3.3 kv",@"440 v",@"Other", nil];
    self.numberOfPhases = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    self.numberOfTapPositions = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
   self.VFDList = [[NSMutableArray alloc]initWithObjects:@"YES",@"NO", nil];
    self.inputArray = [[NSMutableArray alloc]init];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _placeHolderTextArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RegistrationCell *cell = (RegistrationCell *)[tableView dequeueReusableCellWithIdentifier:@"UserRegisterIdentity"];
    cell.userTextField.placeholder = [_placeHolderTextArray objectAtIndex:indexPath.row];
    cell.userTextField.delegate = (id<UITextFieldDelegate>)self;
    cell.userTextField.tag = indexPath.row;
    if (indexPath.row == 1 || indexPath.row == 8 || indexPath.row == 12 || indexPath.row == 13 || indexPath.row == 15 || indexPath.row == 16){
        cell.userTextField.inputView = self.listPickerView;
        cell.userTextField.inputAccessoryView = self.dissmissKeyBoardView;
    }
    return cell;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.selectedTextfield = textField;
    if (textField.tag == 1 || textField.tag == 8 || textField.tag == 12 || textField.tag == 13 || textField.tag == 15 || textField.tag == 16){
        [self.listPickerView reloadAllComponents];
        [self.listPickerView selectRow:0 inComponent:0 animated:YES];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        return self.SideRatedVoltageArray.count;
    }else if (self.selectedTextfield.tag == 8){
        return self.SideRatedVoltageArray.count;
    }else if (self.selectedTextfield.tag == 12){
        return self.numberOfPhases.count;
    }
    else if (self.selectedTextfield.tag == 13)
    {
        return self.numberOfPhases.count;
    }
    else if (self.selectedTextfield.tag == 15)
    {
        return self.numberOfTapPositions.count;
    }
    else if (self.selectedTextfield.tag == 16)
    {
        return self.VFDList.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        return [self.SideRatedVoltageArray objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 8){
        return [self.SideRatedVoltageArray objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 12){
        return [self.numberOfPhases objectAtIndex:row];
    }
    else if (self.selectedTextfield.tag == 13)
    {
        return [self.numberOfPhases objectAtIndex:row];
    }
    else if(self.selectedTextfield.tag == 15)
    {
        return [self.numberOfTapPositions objectAtIndex:row];
    }
    else if(self.selectedTextfield.tag == 16)
    {
        return [self.VFDList objectAtIndex:row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        self.selectedTextfield.text = [self.SideRatedVoltageArray objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 8){
        self.selectedTextfield.text = [self.SideRatedVoltageArray objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 12){
        self.selectedTextfield.text =  [self.numberOfPhases objectAtIndex:row];
    }
    else if (self.selectedTextfield.tag == 13)
    {
        self.selectedTextfield.text =  [self.numberOfPhases objectAtIndex:row];
    }
    else if(self.selectedTextfield.tag == 15)
    {
        self.selectedTextfield.text =  [self.numberOfTapPositions objectAtIndex:row];
    }
    else if (self.selectedTextfield.tag == 16)
    {
        self.selectedTextfield.text = [self.VFDList objectAtIndex:row];
    }
}

-(IBAction)keyboardDoneBtnTapped:(id)sender{
    if(self.selectedTextfield.tag == 1){
        self.selectedTextfield.text = [self.SideRatedVoltageArray objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }else if (self.selectedTextfield.tag == 8){
        self.selectedTextfield.text = [self.SideRatedVoltageArray objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }else if (self.selectedTextfield.tag == 12){
        self.selectedTextfield.text =  [self.numberOfPhases objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    else if (self.selectedTextfield.tag == 13)
    {
        self.selectedTextfield.text =  [self.numberOfPhases objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    else if(self.selectedTextfield.tag == 15)
    {
        self.selectedTextfield.text =  [self.numberOfTapPositions objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    else if(self.selectedTextfield.tag == 16)
    {
        self.selectedTextfield.text = [self.VFDList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    [self.selectedTextfield resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SaveRecord:(id)sender {
    NSLog(@"Values are :%@", self.inputArray);
}



@end
