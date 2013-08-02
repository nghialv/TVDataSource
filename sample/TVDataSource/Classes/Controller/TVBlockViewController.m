//
//  TVBlockViewController.m
//  TVDataSource
//
//  Created by iNghia on 7/30/13.
//  Copyright (c) 2013 nghialv. All rights reserved.
//

#import "TVBlockViewController.h"
#import "TVArrayDataSource.h"
#import "TVCellByXib.h"

@interface TVBlockViewController () {
    NSMutableArray *items;
}

@property (strong, nonatomic) TVArrayDataSource *dataSource;

@end

@implementation TVBlockViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i++) {
        [items addObject:[NSString stringWithFormat:@"Cell %d", i]];
    }
    
    // create tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                          style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    // configure block
    TVCellConfigureBlock configureCell = ^(TVCellByXib *cell, NSString *name) {
        [cell.title setText:name];
    };
    
    self.dataSource = [[TVArrayDataSource alloc] initWithItems:items
                                                cellIdentifier:@"MYCELL"
                                            cellConfigureBlock:configureCell];
    [self.dataSource setXibFileName:@"TVSimpleCell"];
    
    tableView.dataSource = self.dataSource;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
