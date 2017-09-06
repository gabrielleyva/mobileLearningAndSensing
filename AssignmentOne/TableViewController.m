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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
    
    return [self.myImageModel getImageCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if(indexPath.section==0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
        
        cell.textLabel.text = [self.myImageModel getImageNameAt:indexPath.row];
        cell.detailTextLabel.text = @">";
    }
    
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[ViewController class]];
    
    if(isVC){
        UITableViewCell* cell = (UITableViewCell*)sender;
        ViewController *vc = [segue destinationViewController];
        
        //vc.imageName = cell.textLabel.text;
        vc.index = [self.tableView indexPathForCell:cell].row;
    }
    
}




@end
