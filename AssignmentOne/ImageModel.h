//
//  ImageModel.h
//  AssignmentOne
//
//  Created by Mandar Phadate on 9/4/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageModel : NSObject

+(ImageModel*) sharedInstance;

-(UIImage*)getImageWithName:(NSString*)name;

-(UIImage*)getImageAt:(NSInteger) index;

-(NSString*)getImageNameAt:(NSInteger) index;

-(NSUInteger)getImageCount;

@end
