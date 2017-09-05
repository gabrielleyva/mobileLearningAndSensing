//
//  ImageModel.m
//  AssignmentOne
//
//  Created by Mandar Phadate on 9/4/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()
@property (strong,nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSArray* images;
@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize images = _images;

-(NSArray*)imageNames{
    
    if(!_imageNames)
        _imageNames = @[@"Eric1",@"Eric2",@"Eric3", @"Test1", @"Test2", @"Test3"];
    
    return _imageNames;
}

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

-(UIImage*)getImageAt:(NSInteger) index {
    return self.images[index];
}

-(NSString*)getImageNameAt:(NSInteger) index {
    return self.imageNames[index];
}

-(NSUInteger)getImageCount{
    return self.images.count;
}



@end
