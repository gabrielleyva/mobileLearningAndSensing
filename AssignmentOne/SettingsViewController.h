//
//  SettingsViewController.h
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 8/30/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewModel.h"
#import "TableViewController.h"

@interface SettingsViewController : UIViewController
@property(weak, nonatomic) NSTimer * timer;
@property (strong, nonatomic) SettingsViewModel *settingModel;
@end
