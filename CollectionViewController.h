//
//  CollectionViewController.h
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 8/30/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewModel.h"

@interface CollectionViewController : UICollectionViewController <UICollectionViewDelegate>
@property (strong, nonatomic) SettingsViewModel *settingModel;
@end
