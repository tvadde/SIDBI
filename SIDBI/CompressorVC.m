//
//  CompressorVC.m
//  SIDBI
//
//  Created by click2clinic3 on 02/10/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import "CompressorVC.h"
#import "RegistrationCell.h"

@interface CompressorVC()
@property (nonatomic, strong) NSMutableArray *placeHolderTextArray;
@property (nonatomic,strong) NSMutableArray *VFDList;
@property (nonatomic, strong) NSMutableArray *SideRatedVoltageArray;
@property (nonatomic, strong) NSMutableArray *numberOfPhases;
@property(nonatomic, strong) NSMutableArray *numberOfTapPositions;
@property (nonatomic, strong) NSMutableArray *inputArray;
@property (nonatomic, strong) UITextField *selectedTextfield;
@property (nonatomic, strong) NSMutableArray *stagesOfCompression;
@property (nonatomic, strong) NSMutableArray *typeOfCooling;
@property (nonatomic, strong) NSMutableArray *typeOfDrierInstalled;

@end


@implementation CompressorVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.placeHolderTextArray = [[NSMutableArray alloc]initWithObjects:@"Name Of Manufacturer OF Compressor",@"Year OF Manufacturing",@"Type Of Compressor",@"Number Of Stages Of Compressor",@"Type OF Cooling",@"Maximun Operating Pressure",@"Compressor Capacity",@"Dryer Installed Or Not",@"Type OF Dryer Installed",@"Rated Current",@"Rated Speed", @"Rated kW",@"Rated Voltage", @"Rated Efficiency oF Motor",@"Efficiency Class of Motor",@"Insulation Class",@"Frame Size Of Motor NEEMA",@"Connection",@"Operated with VFD",nil];
    
    
    self.stagesOfCompression = [[NSMutableArray alloc]initWithObjects:@"Single Stage",@"Double Stage",@"Triple Stage",@"Others",nil];
    self.typeOfCooling = [[NSMutableArray alloc]initWithObjects:@"Water Cooled",@"Air Cooled", nil];
    self.typeOfDrierInstalled = [[NSMutableArray alloc]initWithObjects:@"Refrigerant",@"HOC",@"Adsorption", nil];
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
    if (indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 7 || indexPath.row == 8){
        cell.userTextField.inputView = self.listPickerView;
        cell.userTextField.inputAccessoryView = self.dissmissKeyBoardView;
    }
    return cell;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.selectedTextfield = textField;
    if (textField.tag == 1 || textField.tag == 3 || textField.tag == 4 || textField.tag == 7 || textField.tag == 8 ){
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
        return self.stagesOfCompression.count;
    }
    else if (self.selectedTextfield.tag == 3){
        return self.stagesOfCompression.count;
    }
    else if (self.selectedTextfield.tag == 4){
        return self.typeOfCooling.count;
    }
    else if (self.selectedTextfield.tag == 7)
    {
        return self.VFDList.count;
    }
    else if (self.selectedTextfield.tag == 8)
    {
        return self.typeOfDrierInstalled.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        return [self.stagesOfCompression objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 3){
        return [self.stagesOfCompression objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 4){
        return [self.typeOfCooling objectAtIndex:row];
    }
    else if (self.selectedTextfield.tag == 7)
    {
        return [self.VFDList objectAtIndex:row];
    }
    else if(self.selectedTextfield.tag == 8)
    {
        return [self.typeOfDrierInstalled objectAtIndex:row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        self.selectedTextfield.text = [self.stagesOfCompression objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 3){
        self.selectedTextfield.text = [self.stagesOfCompression objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 4){
        self.selectedTextfield.text =  [self.typeOfCooling objectAtIndex:row];
    }
    else if (self.selectedTextfield.tag == 7)
    {
        self.selectedTextfield.text =  [self.VFDList objectAtIndex:row];
    }
    else if(self.selectedTextfield.tag == 8)
    {
        self.selectedTextfield.text =  [self.typeOfDrierInstalled objectAtIndex:row];
    }
}

-(IBAction)keyboardDoneBtnTapped:(id)sender{
    if(self.selectedTextfield.tag == 1){
        self.selectedTextfield.text = [self.stagesOfCompression objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }else if (self.selectedTextfield.tag == 3){
        self.selectedTextfield.text = [self.stagesOfCompression objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }else if (self.selectedTextfield.tag == 4){
        self.selectedTextfield.text =  [self.typeOfCooling objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    else if (self.selectedTextfield.tag == 7)
    {
        self.selectedTextfield.text =  [self.VFDList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    else if(self.selectedTextfield.tag == 8)
    {
        self.selectedTextfield.text =  [self.typeOfDrierInstalled objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
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
