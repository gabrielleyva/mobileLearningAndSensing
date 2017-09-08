//
//  ImageModel.m
//  AssignmentOne
//
//  Created by Mandar Phadate on 9/4/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()
@property (strong,nonatomic) NSArray* carNames;
@property (strong,nonatomic) NSArray* spaceNames;
@property (strong,nonatomic) NSArray* flowerNames;

//@property (strong, nonatomic) NSArray* images;
@end

// key = 4c5083a9cfabfb809008e3f99fc0bb85
// secret = ed1aabe32480a4d1

@implementation ImageModel
@synthesize carNames = _carNames;
//@synthesize images = _images;

-(NSArray*)carNames{
    
    if(!_carNames)
        _carNames = @[@"c1",@"c2",@"c3", @"c4", @"c5", @"c6",@"c7",@"c8",@"c9",@"c10",
                      @"c11",@"c12",@"c13",@"c14",@"c15",@"c16",@"c17",@"c18",@"c19",@"c20"];
    
    return _carNames;
}
-(NSArray*)flowerNames{
    
    if(!_flowerNames)
        _flowerNames = @[@"f1",@"f2",@"f3", @"f4", @"f5", @"f6",@"f7",@"f8",@"f9",@"f10"
                         ,@"f11",@"f12",@"f13",@"f14",@"f15",@"f16",@"f17",@"f18",@"f19",@"f20"];
    
    return _flowerNames;
}
-(NSArray*)spaceNames{
    
    if(!_spaceNames)
        _spaceNames = @[@"s1",@"s2",@"s3", @"s4", @"s5", @"s6",@"s7",@"s8",@"s9",@"s10",
                        @"s11",@"s12",@"s13",@"s14",@"s15",@"s16",@"s17",@"s18",@"s19",@"s20"];
    
    return _spaceNames;
}

/*
-(NSArray*)images{
    if(!_images){
        UIImage *image1 = [UIImage imageNamed:@"Eric1"];
        UIImage *image2 = [UIImage imageNamed:@"Eric2"];
        UIImage *image3 = [UIImage imageNamed:@"Eric3"];
        UIImage *image4 = [UIImage imageNamed:@"Test1"];
        UIImage *image5 = [UIImage imageNamed:@"Test2"];
        UIImage *image6 = [UIImage imageNamed:@"Test3"];
        
        _images = @[image1,image2,image3,image4,image5,image6];
    }
    
    return _images;
}
*/


+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(UIImage*)getImageWithName:(NSString *)name{
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}

-(UIImage*)getImageAt:(NSInteger) index ofKind:(NSString *) kind{
    if ([kind  isEqualToString:@"car"]){
        return [UIImage imageNamed:self.carNames[index]];
    } else if ([kind isEqualToString:@"space"]) {
        return [UIImage imageNamed:self.spaceNames[index]];
    } else {
        return [UIImage imageNamed:self.flowerNames[index]];
    }
}

-(NSString*)getImageNameAt:(NSInteger) index ofKind: (NSString *) kind {
    
    if ([kind  isEqualToString:@"car"]){
        return [NSString stringWithFormat:@"Car-%@",self.carNames[index]];
    } else if ([kind isEqualToString:@"space"]) {
        return [NSString stringWithFormat:@"Space-%@",self.spaceNames[index]];
    } else {
        return [NSString stringWithFormat:@"Flower-%@",self.flowerNames[index]];
    }

}

-(NSUInteger)getImageCount{
    return 10;
}



@end
