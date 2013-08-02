//
//  TVArrayDataSource.m
//  TVDataSource
//
//  Created by iNghia on 7/30/13.
//  Copyright (c) 2013 nghialv. All rights reserved.
//

#import "TVArrayDataSource.h"
#import <objc/message.h>

@interface TVArrayDataSource()

@property (strong, nonatomic) NSArray *items;
@property (copy, nonatomic) NSString *cellIdentifier;
@property (copy, nonatomic) NSString *cellName;

@property (assign, nonatomic) BOOL isCellFromXib;
@property (assign, nonatomic) BOOL isConfigByBlock;

@property (copy, nonatomic) TVCellConfigureBlock configureBlock;
@property (weak, nonatomic) id target;
@property (assign, nonatomic) SEL configureSelector;

@end

@implementation TVArrayDataSource

/**
 *	init datasource with block
 *
 *	@param	items
 *	@param	cellIdentifier
 *	@param	configureBlock
 *
 *	@return	datasource
 */
- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 cellConfigureBlock:(TVCellConfigureBlock)configureBlock
{
    self = [super init];
    if(self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureBlock = configureBlock;
        self.isConfigByBlock = YES;
    }
    return self;
}

/**
 *	init datasource with selector
 *
 *	@param	items
 *	@param	cellIdentifier
 *	@param	target
 *	@param	configureSelector
 *
 *	@return	datasource
 */
- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
             target:(id)target
   cellConfigureSel:(SEL)configureSelector
{
    self = [super init];
    if(self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.target = target;
        self.configureSelector = configureSelector;
        self.isConfigByBlock = NO;
    }
    return self;
}

/**
 *	set Xib file for cell
 *
 *	@param	xibFileName
 */
- (void)setXibFileName:(NSString *)xibFileName
{
    self.cellName = xibFileName;
    self.isCellFromXib = YES;
}

/**
 *	set cell class name
 *
 *	@param	cellClassName
 */
- (void)setCellClassName:(NSString *)cellClassName
{
    self.cellName = cellClassName;
    self.isCellFromXib = NO;
}

#pragma mark - UITableViewDataSource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // get cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        if (self.isCellFromXib) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:self.cellName
                                                         owner:self
                                                       options:nil];
            cell = [nib objectAtIndex:0];
        } else {
            cell = [[NSClassFromString(self.cellName) alloc] initWithStyle:UITableViewCellStyleDefault
                                                           reuseIdentifier:self.cellIdentifier];
        }
    }
    
    // get item
    id item = [self.items objectAtIndex:indexPath.row];
    
    // configure cell
    if (self.isConfigByBlock) {
        self.configureBlock(cell, item);
    } else {
        objc_msgSend(self.target, self.configureSelector, cell, item);
    }
    return cell;
}

@end