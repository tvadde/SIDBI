//
//  EquipmentListVC.m
//  SIDBI
//
//  Created by click2clinic3 on 02/10/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import "EquipmentListVC.h"
#import "RegistrationCell.h"


@interface EquipmentListVC ()
@property (nonatomic, strong) NSMutableArray *placeHolderTextArray;
@property (nonatomic, strong) NSMutableArray *constitutionOfMSMEList;
@property (nonatomic, strong) NSMutableArray *ClassOfMotorsList;
@property (nonatomic, strong) NSMutableArray *ConnectionsList;
@property (nonatomic, strong) NSMutableArray *InsulationClassList;
@property (nonatomic,strong) NSMutableArray *VFDList;
@property (nonatomic, strong) NSMutableArray *listOfCluster;
@property (nonatomic, strong) NSMutableArray *typeOfSectorList;
@property (nonatomic, strong) NSMutableArray *inputArray;
@property (nonatomic, strong) UITextField *selectedTextfield;
@end

@implementation EquipmentListVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.placeHolderTextArray = [[NSMutableArray alloc]initWithObjects:@"Name Of Manufacturer OF Motor",@"Year OF Manufacure",@"Rated Power Of Motor",@"Rated Voltage",@"Rated Current",@"Rated Speed",@"Read Efficeincy OF Motor",@"Efficeincy Class Of Motor",@"Insulation Class",@"Frame Size Of Motor", @"Connections",@"Operated With VFD", nil];
    self.ClassOfMotorsList = [[NSMutableArray alloc]initWithObjects:@"IE1",@"IE2",@"IE3",@"IE4",@"Others", nil];
    self.ConnectionsList = [[NSMutableArray alloc]initWithObjects:@"Delta",@"Star", nil];
    self.InsulationClassList = [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"F",@"H", nil];
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
    if (indexPath.row == 1 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 10 || indexPath.row == 11){
        cell.userTextField.inputView = self.listPickerView;
        cell.userTextField.inputAccessoryView = self.dissmissKeyBoardView;
    }
    return cell;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.selectedTextfield = textField;
    if (textField.tag == 1 || textField.tag == 16 || textField.tag == 18){
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
        return self.ClassOfMotorsList.count;
    }else if (self.selectedTextfield.tag == 7){
        return self.ClassOfMotorsList.count;
    }else if (self.selectedTextfield.tag == 8){
        return self.InsulationClassList.count;
    }
    else if (self.selectedTextfield.tag == 10)
    {
        return self.ConnectionsList.count;
    }
    else if (self.selectedTextfield.tag == 11)
    {
        return self.VFDList.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        return [self.ClassOfMotorsList objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 7){
        return [self.ClassOfMotorsList objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 8){
        return [self.InsulationClassList objectAtIndex:row];
    }
    else if (self.selectedTextfield.tag == 10)
    {
        return [self.ConnectionsList objectAtIndex:row];
    }
    else if(self.selectedTextfield.tag == 11)
    {
        return [self.VFDList objectAtIndex:row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        self.selectedTextfield.text = [self.ClassOfMotorsList objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 7){
        self.selectedTextfield.text = [self.ClassOfMotorsList objectAtIndex:row];
    }else if (self.selectedTextfield.tag == 8){
        self.selectedTextfield.text =  [self.InsulationClassList objectAtIndex:row];
    }
    else if (self.selectedTextfield.tag == 10)
    {
        self.selectedTextfield.text =  [self.ConnectionsList objectAtIndex:row];
    }
    else if(self.selectedTextfield.tag == 11)
    {
        self.selectedTextfield.text =  [self.VFDList objectAtIndex:row];
    }
}

-(IBAction)keyboardDoneBtnTapped:(id)sender{
    if(self.selectedTextfield.tag == 1){
        self.selectedTextfield.text = [self.ClassOfMotorsList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }else if (self.selectedTextfield.tag == 7){
        self.selectedTextfield.text = [self.ClassOfMotorsList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }else if (self.selectedTextfield.tag == 8){
        self.selectedTextfield.text =  [self.InsulationClassList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    else if (self.selectedTextfield.tag == 10)
    {
       self.selectedTextfield.text =  [self.ConnectionsList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    else if(self.selectedTextfield.tag == 11)
    {
        self.selectedTextfield.text =  [self.VFDList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
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
