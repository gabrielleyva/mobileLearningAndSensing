//
//  SettingsViewController.m
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 8/30/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsViewModel.h"

@interface SettingsViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPicsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerOnOffLabel;
@property (weak, nonatomic) IBOutlet UITextField *timerTextField;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) SettingsViewModel *settingModel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self preparePickerView];
    [self prepareTimerTextField];
    [self prepareSaveButton];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(SettingsViewModel*)myImageModel{
    
    if(!_settingModel)
        _settingModel =[SettingsViewModel sharedInstance];
    
    return _settingModel;
}

- (void)preparePickerView{
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.timerTextField.inputView = self.pickerView;
}

- (void)prepareTimerTextField{
    self.timerTextField.allowsEditingTextAttributes = NO;
}

- (void)prepareSaveButton{
    self.saveButton.layer.borderWidth = 1;
    self.saveButton.layer.borderColor = [UIColor greenColor].CGColor;
    self.saveButton.tintColor = [UIColor greenColor];
}

- (IBAction)sliderMoved:(UISlider *)sender {
    
    UIColor *themeColor = [UIColor colorWithHue:self.slider.value saturation:1.f brightness:1.f alpha:1.f];
    
    self.colorLabel.textColor = themeColor;
    self.settingModel.themeColor = themeColor;
}

- (IBAction)stepperUsed:(UIStepper *)sender {
    int value = [sender value];
    NSString * fullString = [NSString stringWithFormat:@"Number of Images: %i", value];
    self.numberOfPicsLabel.text = fullString;
}

- (IBAction)switchUsed:(UISwitch *)sender {
    if (sender.isOn) {
        self.timerOnOffLabel.text = @"Timer: On";
    } else {
        self.timerOnOffLabel.text = @"Timer: Off";
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.timerTextField resignFirstResponder];
}

- (IBAction)saveButtonPressed:(id)sender {
}
#pragma mark - PcikerView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSLog(@"Called 2");
    return @"Hello";

}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    NSLog(@"Called");
    
    return [self.settingModel.hours count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
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
