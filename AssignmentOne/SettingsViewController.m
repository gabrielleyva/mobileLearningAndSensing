//
//  SettingsViewController.m
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 8/30/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPicsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerOnOffLabel;
@property (weak, nonatomic) IBOutlet UITextField *timerTextField;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UISwitch *timerSwitch;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareTimerTextField];
    [self prepareSlider];
    [self prepareStepper];
    [self prepareTimerSwitch];
    [self prepareSegmentControl];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(SettingsViewModel*)settingModel{
    
    if(!_settingModel)
        _settingModel =[SettingsViewModel sharedInstance];
    
    return _settingModel;
}

- (void)prepareSegmentControl{
    [self.segmentControl setSelectedSegmentIndex:self.settingModel.typeOfImage];
}

- (void)prepareTimerSwitch{
    [self.timerSwitch setOn:self.settingModel.timerStatus];
}

- (void)prepareTimerTextField{
    self.timerTextField.delegate = self;
    self.timerTextField.placeholder = [NSString stringWithFormat:@"Set Timer -- Defuault Values: Hours: %i, Minutes: %i", self.settingModel.hour, self.settingModel.minute];
}

- (void)prepareSlider{
    [self.slider setValue: self.settingModel.themeColorValue];
    
    UIColor *themeColor = [UIColor colorWithHue:self.slider.value saturation:1.f brightness:1.f alpha:1.f];
    self.colorLabel.textColor = themeColor;
}

- (void)prepareStepper{
    self.numberOfPicsLabel.text = [NSString stringWithFormat:@"Number of Images: %i", self.settingModel.numberOfImages];
    [self.stepper setValue:self.settingModel.numberOfImages];
}

- (IBAction)sliderMoved:(UISlider *)sender {
    
    UIColor *themeColor = [UIColor colorWithHue:self.slider.value saturation:1.f brightness:1.f alpha:1.f];
    self.colorLabel.textColor = themeColor;
}

- (IBAction)stepperUsed:(UIStepper *)sender {
    int value = [sender value];
    NSString * fullString = [NSString stringWithFormat:@"Number of Images: %i", value];
    self.numberOfPicsLabel.text = fullString;
}
- (IBAction)segmentControlToggled:(id)sender {
    self.settingModel.typeOfImage = self.segmentControl.selectedSegmentIndex;
}

- (IBAction)switchUsed:(UISwitch *)sender {
    if (sender.isOn) {
        self.timerOnOffLabel.text = @"Timer: On";
        self.timerTextField.placeholder = [NSString stringWithFormat:@"Set Timer -- Defuault Values: Hours: %i, Minutes: %i", self.settingModel.hour, self.settingModel.minute];
        self.settingModel.timerStatus = YES;
        [self.timerTextField setUserInteractionEnabled:YES];
        
        self.settingModel.hour = 0;
        self.settingModel.minute = 1;
    } else {
        self.timerOnOffLabel.text = @"Timer: Off";
        self.timerTextField.placeholder = @"Timer is off. Turn on the timer to set timer time";
        self.settingModel.timerStatus = NO;
        [self.timerTextField setUserInteractionEnabled:NO];
        
        self.settingModel.hour = 0;
        self.settingModel.minute = 0;
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.timerTextField resignFirstResponder];
}

#pragma mark - PcikerView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.settingModel.timeArray[component] objectAtIndex:row];

}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    

    return [self.settingModel.timeArray[component] count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.timerTextField.text = [NSString stringWithFormat:@"Hours: %@, Minutes: %@", [self.settingModel.timeArray[0] objectAtIndex:[self.pickerView selectedRowInComponent:0]], [self.settingModel.timeArray[1] objectAtIndex:[self.pickerView selectedRowInComponent:1]]];
    
    NSString *tempHour = [NSString stringWithFormat:@"%@", [self.settingModel.timeArray[0] objectAtIndex:[self.pickerView selectedRowInComponent:0]]];
    NSString *tempMinute = [NSString stringWithFormat:@"%@", [self.settingModel.timeArray[1] objectAtIndex:[self.pickerView selectedRowInComponent:1]]];
    
    self.settingModel.hour = [tempHour integerValue];
    self.settingModel.minute = [tempMinute integerValue];
}

#pragma marke - TextField 
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.timerTextField.text = [NSString stringWithFormat:@"Hours: %i, Minutes: %i", self.settingModel.hour, self.settingModel.minute];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.timerTextField.inputView = self.pickerView;
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
