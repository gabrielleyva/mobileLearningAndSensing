//
//  SettingsViewModel.h
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 9/4/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SettingsViewModel : NSObject

@property (strong,nonatomic) NSArray* hours;
@property (strong, nonatomic) NSArray* minutes;
@property (strong, nonatomic) UIColor* themeColor;
@property (strong, nonatomic) NSNumber* numberOfImages;

@end
