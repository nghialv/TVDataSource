//
//  TVSelectorViewController.m
//  TVDataSource
//
//  Created by iNghia on 7/30/13.
//  Copyright (c) 2013 nghialv. All rights reserved.
//

#import "TVSelectorViewController.h"
#import "TVArrayDataSource.h"
#import "TVCellByCode.h"

@interface TVSelectorViewController () {
    NSMutableArray *items;
}

@property (strong, nonatomic) TVArrayDataSource *dataSource;

- (void)configureCell:(TVCellByCode *)cell andItem:(NSString *)item;

@end

@implementation TVSelectorViewController

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
    
    // create datasource
    self.dataSource = [[TVArrayDataSource alloc] initWithItems:items
                                                cellIdentifier:@"MYCELL"
                                                        target:self
                                              cellConfigureSel:@selector(configureCell:andItem:)];
    [self.dataSource setCellClassName:@"TVCellByCode"];
    
    tableView.dataSource = self.dataSource;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureCell:(TVCellByCode *)cell andItem:(NSString *)item
{
    [cell.title setText:item];
}

@end
