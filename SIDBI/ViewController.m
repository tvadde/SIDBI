//
//  ViewController.m
//  SIDBI
//
//  Created by Thukaram Vadde on 29/09/17.
//  Copyright © 2017 Thukaram. All rights reserved.
//

#import "ViewController.h"
#import "RegistrationCell.h"
#import <AFNetworking/AFNetworking.h>
#import "ClusterModel.h"
#import "MSMEModel.h"

#define BaseUrl             @"http://click2clinicapp.azurewebsites.net/"
#define ClustersListUrl     BaseUrl@"Master/GetListOfClusters"
#define MSMEListUrl         BaseUrl@"Master/ConstitutionofMSME"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *placeHolderTextArray;
@property (nonatomic, strong) NSMutableArray *constitutionOfMSMEList;
@property (nonatomic, strong) NSMutableArray *listOfCluster;
@property (nonatomic, strong) NSMutableArray *typeOfSectorList;
@property (nonatomic, strong) NSMutableArray *inputArray;
@property (nonatomic, strong) UITextField *selectedTextfield;
@property (nonatomic, strong) NSMutableDictionary *userValueDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.userValueDic = [NSMutableDictionary new];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager GET:ClustersListUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        
        if([[responseObject objectForKey:@"Status"] boolValue] || [[responseObject objectForKey:@"State"] boolValue]){
            
            _listOfCluster = [ClusterModel arrayOfModelsFromDictionaries:[responseObject objectForKey:@"ClusterInfo"] error: nil];
            
        }else{
          
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    AFHTTPSessionManager *manager1 = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager1.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager1.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager1 GET:MSMEListUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        
        if([[responseObject objectForKey:@"Status"] boolValue] || [[responseObject objectForKey:@"State"] boolValue]){
            
            _constitutionOfMSMEList = [MSMEModel arrayOfModelsFromDictionaries:[responseObject objectForKey:@"ConstitutionInfo"] error: nil];
        
        }else{
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    _placeHolderTextArray = [[NSMutableArray alloc] initWithObjects:@"Name of the Unit",
                                                                    @"Constitution of MSME",
                                                                    @"Registration number of MSME",
                                                                    @"Date of Incorporation",
                                                                    @"Date of commencement of Business",
                                                                    @"Address Line-1",
                                                                    @"Address Line-2",
                                                                    @"Address Line-3",
                                                                    @"Nearest Landmark",
                                                                    @"City",
                                                                    @"Pincode",
                                                                    @"District",
                                                                    @"State",
                                                                    @"Name of The Unit Owner/MD/Properiter",
                                                                    @"Mobile Number of Owner/MD/Properiter (For OTP)",
                                                                    @"Email ID of Owner/MD/Properiter (For OTP)",
                                                                    @"Cluster (To be entered by Auditor)",
                                                                    @"Enter name of Cluster (if selected \"Other\" in above field)",
                                                                    @"Type of Sector or Cluster",
                                                                    @"Enter details for type of cluster (if selected \"Other\" in above field)",
                                                                    @"MSME Unique Registration Number, if available",nil];
    
    _typeOfSectorList = [[NSMutableArray alloc] initWithObjects:@"Agro",
                         @"Automotive",
                         @"Ceramic",
                         @"Chemical",
                         @"Cold Storages",
                         @"Consumer Appliances",
                         @"Engineering",
                         @"Food Processing",
                         @"Forging",
                         @"Foundry",
                         @"Paper",
                         @"Pharma", nil];
    
    self.roundCornerView.layer.cornerRadius = 10.0f;
    self.roundCornerView.layer.masksToBounds = YES;
    
    self.registerBtn.layer.cornerRadius = 5.0f;
    self.registerBtn.layer.masksToBounds = YES;
    
//    UserRegisterIdentity
    self.inputArray = [[NSMutableArray alloc]init];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _placeHolderTextArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RegistrationCell *cell = (RegistrationCell *)[tableView dequeueReusableCellWithIdentifier:@"UserRegisterIdentity"];
    
    cell.placeHolderLbl.text = [_placeHolderTextArray objectAtIndex:indexPath.row];
    cell.userTextField.placeholder = [_placeHolderTextArray objectAtIndex:indexPath.row];
    cell.userTextField.delegate = (id<UITextFieldDelegate>)self;
    cell.userTextField.tag = indexPath.row;
    cell.userTextField.text = @"";
    cell.borderView.layer.borderWidth = 1;
    cell.borderView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    NSString *userStr = [self.userValueDic objectForKey:cell.placeHolderLbl.text];
    
    if (userStr && userStr.length > 0) {
        cell.userTextField.text = userStr;
    }
    
    if (indexPath.row == 1 || indexPath.row == 16 || indexPath.row == 18){
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self.userValueDic setObject:newString forKey:textField.placeholder];
    return YES;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        return self.constitutionOfMSMEList.count;
    }else if (self.selectedTextfield.tag == 16){
        return self.listOfCluster.count;
    }else if (self.selectedTextfield.tag == 18){
        return self.typeOfSectorList.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        return [[self.constitutionOfMSMEList objectAtIndex:row] ConstitutionName];
    }else if (self.selectedTextfield.tag == 16){
        return [[self.listOfCluster objectAtIndex:row] ClusterName];
    }else if (self.selectedTextfield.tag == 18){
        return [self.typeOfSectorList objectAtIndex:row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(self.selectedTextfield.tag == 1){
        self.selectedTextfield.text = [[self.constitutionOfMSMEList objectAtIndex:row] ConstitutionName];
    }else if (self.selectedTextfield.tag == 16){
        self.selectedTextfield.text = [[self.listOfCluster objectAtIndex:row] ClusterName];
    }else if (self.selectedTextfield.tag == 18){
        self.selectedTextfield.text =  [self.typeOfSectorList objectAtIndex:row];
    }
}

-(IBAction)keyboardDoneBtnTapped:(id)sender{
    
    NSString *selectedStr = @"";
    
    if(self.selectedTextfield.tag == 1){
        selectedStr = [[self.constitutionOfMSMEList objectAtIndex:[self.listPickerView selectedRowInComponent:0]] ConstitutionName];
    }else if (self.selectedTextfield.tag == 16){
        selectedStr = [[self.listOfCluster objectAtIndex:[self.listPickerView selectedRowInComponent:0]] ClusterName];
    }else if (self.selectedTextfield.tag == 18){
        selectedStr =  [self.typeOfSectorList objectAtIndex:[self.listPickerView selectedRowInComponent:0]];
    }
    
    self.selectedTextfield.text = selectedStr;
    [self.userValueDic setObject:selectedStr forKey:self.selectedTextfield.placeholder];
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
