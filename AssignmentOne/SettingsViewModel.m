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

-(NSArray*)timeArray{
    
    if(!_timeArray)
        _timeArray = @[@[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", @"21",@"22",@"23"],@[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", @"21",@"22",@"23", @"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32", @"33",@"34",@"34", @"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43", @"44",@"45",@"46", @"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55", @"56",@"57",@"58", @"59"],@[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", @"21",@"22",@"23", @"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32", @"33",@"34",@"34", @"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43", @"44",@"45",@"46", @"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55", @"56",@"57",@"58", @"59"]];
    
    return _timeArray;
}

-(double)themeColorValue{
    
    if(!_themeColorValue)
        _themeColorValue = 1.0;
    
    return _themeColorValue;
}

-(int)numberOfImages{
    
    if(!_numberOfImages)
        _numberOfImages = 5;
    
    return _numberOfImages;
}

-(int)hour{
    
    if(!_hour)
        _hour = 0;
    
    return _hour;
}

-(int)minute{
    
    if(!_minute)
        _minute = 0;
    
    return _minute;
        
}

-(int)second{
    
    if(!_second)
        _second = 10;
    
    return _second;
}

-(int)counts{
    
    if(!_counts)
        _counts = [self calculateTimerTime];
    
    return _counts;
}

-(NSInteger)typeOfImage{
    
    if(!_typeOfImage)
        _typeOfImage = 0;
    
    return _typeOfImage;
}

-(int)calculateTimerTime{
    
    int h = self.hour * 60 * 60;
    int m = self.minute * 60;
    int s = self.second;
    return h + m + s;
}


+(SettingsViewModel*)sharedInstance{
    static SettingsViewModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[SettingsViewModel alloc] init];
    });
    
    return _sharedInstance;
}


@end
