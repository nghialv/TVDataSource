//
//  TVArrayDataSource.h
//  TVDataSource
//
//  Created by iNghia on 7/30/13.
//  Copyright (c) 2013 nghialv. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TVCellConfigureBlock)(id, id);

@interface TVArrayDataSource : NSObject <UITableViewDataSource>

/* init with block */
- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 cellConfigureBlock:(TVCellConfigureBlock) configureBlock;

/* init with selector */
- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
             target:(id)target
   cellConfigureSel:(SEL)configureSelector;

/* set Xib filename */
- (void)setXibFileName:(NSString *)xibFileName;

/* set Cell Classname */
- (void)setCellClassName:(NSString *)cellClassName;

@end
