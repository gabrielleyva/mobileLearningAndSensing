//
//  ViewController.m
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 8/30/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"

@interface ViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) UIImageView* imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) ImageModel* myImageModel;
@end

@implementation ViewController

-(ImageModel*)myImageModel{
    
    if(!_myImageModel)
        _myImageModel =[ImageModel sharedInstance];
    
    return _myImageModel;
}

-(NSString*)imageName{
    
    if(!_imageName)
        _imageName = @"Eric1";
    
    return _imageName;
}

-(UIImageView*)imageView{
    
    if(!_imageView)
        _imageView = [[UIImageView alloc] initWithImage:[[ImageModel sharedInstance] getImageAt:self.index]];
    return _imageView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.delegate = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

@end
