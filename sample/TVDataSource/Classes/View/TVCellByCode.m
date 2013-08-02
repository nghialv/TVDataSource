//
//  TVCellByCode.m
//  TVDataSource
//
//  Created by iNghia on 7/30/13.
//  Copyright (c) 2013 nghialv. All rights reserved.
//

#import "TVCellByCode.h"

@implementation TVCellByCode

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 200, 30)];
        self.toggle = [[UISwitch alloc] initWithFrame:CGRectMake(220, 10, 70, 30)];
        self.toggle.on = YES;
        [self addSubview:self.title];
        [self addSubview:self.toggle];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
