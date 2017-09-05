//
//  SettingsViewModel.m
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 9/4/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "SettingsViewModel.h"

@interface SettingsViewModel ()

@end

@implementation SettingsViewModel

-(NSArray*)hours{
    
    if(!_hours)
        _hours = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", @"21",@"22",@"23"];
    
    return _hours;
}

-(NSArray*)minutes{
    
    if(!_minutes)
        _minutes = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", @"21",@"22",@"23"];
    
    return _minutes;
}

+(SettingsViewModel*)sharedInstance{
    static SettingsViewModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[SettingsViewModel alloc] init];
    });
    
    return _sharedInstance;
}

-(void)preparePickerArrays{
//    NSMutableArray * tempHours = [NSMutableArray array];
//    NSMutableArray * tempMinutes = [NSMutableArray array];
//    
//    for (int i = 0; i < 24; i++) {
//        [tempHours addObject:[NSNumber numberWithInt:i]];
//        NSLog(@"%@", [tempHours objectAtIndex:i]);
//    }
//    for (int i = 0; i < 59; i++) {
//        [tempMinutes addObject:[NSNumber numberWithInt:i]];
//    }
//    
//    _hours = tempHours;
//    _minutes = tempMinutes;
}

@end
