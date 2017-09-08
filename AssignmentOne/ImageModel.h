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

-(UIImage*)getImageAt:(NSInteger) index ofKind:(NSInteger) kind;

-(NSString*)getImageNameAt:(NSInteger) index ofKind:(NSInteger) kind;

-(NSUInteger)getImageCount;

@end
