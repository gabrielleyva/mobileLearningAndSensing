//
//  TableViewController.m
//  AssignmentOne
//
//  Created by Gabriel I Leyva Merino on 8/30/17.
//  Copyright © 2017 Leyva_Phadate. All rights reserved.
//

#import "TableViewController.h"
#import "ImageModel.h"
#import "ViewController.h"

@interface TableViewController ()

@property (strong,nonatomic) ImageModel* myImageModel;

@property (nonatomic) NSInteger indexCell;

@end

@implementation TableViewController

-(ImageModel*)myImageModel{
    
    if(!_myImageModel)
        _myImageModel =[ImageModel sharedInstance];
    
    return _myImageModel;
}


-(SettingsViewModel*)settingModel{
    
    if(!_settingModel)
        _settingModel =[SettingsViewModel sharedInstance];
    
    return _settingModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Number Of Images, %i", self.settingModel.numberOfImages);
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // TODO: Check for number of images to load in settings
    return self.settingModel.numberOfImages;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if(indexPath.section==0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
        // TODO: check settings for kind
        cell.textLabel.text = [self.myImageModel getImageNameAt:indexPath.row ofKind:self.settingModel.typeOfImage];
        cell.detailTextLabel.text = @">";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ModalView"];
    vc.index = indexPath.row;
    vc.settingModel = self.settingModel;
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"settings"]) {
        SettingsViewController *vc = [segue destinationViewController];
        vc.settingModel  = self.settingModel;
    }
}


@end
