# TVArrayDataSource
This class will help you implement TableView faster.

### Instalation
TADataSource can be installed via CocoaPods.
```
  pod 'TVArrayDataSource'
```
or simply download and import TVArrayDataSource.h, TVArrayDataSource.m in your project manually.

### Usage

#### configure datasource by using block
```
  // create block
  TVCellConfigureBlock configureCell = ^(TVCellByXib *cell, NSString *name) {
    [cell.title setText:name];
  };

  self.dataSource = [[TVArrayDataSource alloc] initWithItems:items
                                              cellIdentifier:@"MYCELL"
                                          cellConfigureBlock:configureCell];
  [self.dataSource setXibFileName:@"TVSimpleCell"];
  tableView.dataSource = self.dataSource;
```
#### or by selector
```
  // create datasource and set selector
  self.dataSource = [[TVArrayDataSource alloc] initWithItems:items
                                              cellIdentifier:@"MYCELL"
                                                      target:self
                                            cellConfigureSel:@selector(configureCell:andItem:)];
  [self.dataSource setCellClassName:@"TVCellByCode"];
```
```
  -(void)configureCell:(UITableViewCell *)cell andItem:(NSString *)item
  {
    [cell.textLabel setText:item];
  }
```
