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
@property (weak, nonatomic) NSMutableArray *hours;
@property (weak, nonatomic) NSMutableArray *minutes;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self preparePickerArrays];
    [self preparePickerView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)preparePickerView{
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    [self.pickerView setDataSource: self];
    [self.pickerView setDelegate: self];
    self.pickerView.showsSelectionIndicator = YES;
    self.timerTextField.inputView = self.pickerView;
}

- (void) preparePickerArrays{
    NSMutableArray * tempHours = [NSMutableArray array];
    NSMutableArray * tempMinutes = [NSMutableArray array];
    
    for (int i = 0; i < 24; i++) {
        [tempHours addObject:[NSNumber numberWithInt:i]];
        NSLog(@"%@", [tempHours objectAtIndex:i]);
    }
    for (int i = 0; i < 59; i++) {
        [tempMinutes addObject:[NSNumber numberWithInt:i]];
    }
    
    _hours = tempHours;
    _minutes= tempMinutes;
    
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

#pragma mark - PcikerView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0 && pickerView == self.pickerView){
        return [self.hours objectAtIndex:row] ;
    } else if (component == 1 && pickerView == self.pickerView) {
        return [self.minutes objectAtIndex:row];
    }
    
    return @"";

}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if(component == 0 && pickerView == self.pickerView){
        return [self.hours count];
    } else if (component == 1 && pickerView == self.pickerView) {
        return [self.minutes count];
    }

    return 0;
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
