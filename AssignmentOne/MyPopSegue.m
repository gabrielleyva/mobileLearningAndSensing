//
//  CustomSegue.m
//  AssignmentOne
//
//  Created by Mandar Phadate on 9/5/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "MyPopSegue.h"

@implementation MyPopSegue

// reference https://github.com/jordanhudgens/modalios

- (void)perform{
    UIViewController *source = (UIViewController *)self.sourceViewController;
    [source.presentingViewController dismissViewControllerAnimated:true completion:nil];
}

@end
