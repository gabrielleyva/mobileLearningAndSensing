//
//  TableViewController.h
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 8/30/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewModel.h"
#import "SettingsViewController.h"
#import "CollectionViewController.h"

@interface TableViewController : UITableViewController
@property(weak, nonatomic) NSTimer * timer;
@property (strong, nonatomic) SettingsViewModel *settingModel;
@property (weak, nonatomic) IBOutlet UILabel *tableLabel;
-(void)countDown;
@end
