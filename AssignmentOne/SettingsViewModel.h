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

@property (strong, nonatomic) NSArray* timeArray;
@property (nonatomic) double themeColorValue;
@property (nonatomic) int numberOfImages;
@property (nonatomic) BOOL timerStatus;
@property (nonatomic) int hour;
@property (nonatomic) int minute;
@property (nonatomic) NSInteger typeOfImage; //0 = Cars -> 1 = Space -> 2 = Music
+(SettingsViewModel*) sharedInstance;

@end
