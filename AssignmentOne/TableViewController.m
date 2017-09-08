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
@property(nonatomic) int counts;
@property(strong,nonatomic) NSMutableArray *randomOrder;
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
    UIColor *themeColor = [UIColor colorWithHue:self.settingModel.themeColorValue saturation:1.f brightness:1.f alpha:1.f];
    self.navigationController.navigationBar.barTintColor = themeColor;
        
    self.randomOrder = [[NSMutableArray alloc] init];
    [self.randomOrder removeAllObjects];
    
    if (self.settingModel.timerStatus == YES){
        [self prepareTimer];
    }
    
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
        int randomNumber = arc4random_uniform(20);
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
        // TODO: check settings for kind
        cell.textLabel.text = [self.myImageModel getImageNameAt:randomNumber ofKind:self.settingModel.typeOfImage];
        cell.detailTextLabel.text = @">";
        [self.randomOrder addObject:[NSNumber numberWithInt:randomNumber]];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ModalView"];
    vc.index = [[self.randomOrder objectAtIndex:indexPath.row] integerValue];
    NSLog(@"%@", self.randomOrder);
    vc.settingModel = self.settingModel;
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"settings"]) {
        SettingsViewController *vc = [segue destinationViewController];
        vc.settingModel  = self.settingModel;
        vc.timer = self.timer;
        vc.tvc = self;
    }
    if ([[segue identifier] isEqualToString:@"CollectionView"]) {
        CollectionViewController *vc = [segue destinationViewController];
        vc.settingModel  = self.settingModel;
        vc.randomOrder = self.randomOrder;
    }
    
}

- (void)prepareTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(countDown)
                                           userInfo:nil
                                            repeats:YES];
}

-(void)countDown {
    self.tableLabel.text = [NSString stringWithFormat:@"%i",self.settingModel.counts];
    NSLog(@"Inside Tableview controller %i",self.settingModel.counts);
    if (--self.settingModel.counts == 0) {
        [self.randomOrder removeAllObjects];
        [self.tableView  reloadData];
        self.settingModel.counts = [self.settingModel calculateTimerTime];
    }
}


@end
