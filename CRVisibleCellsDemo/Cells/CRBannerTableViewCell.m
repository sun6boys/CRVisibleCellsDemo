//
//  CRBannerTableViewCell.m
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import "CRBannerTableViewCell.h"

NSString * const kCRBannerTableViewCellIdentifier = @"kCRBannerTableViewCellIdentifier";

@implementation CRBannerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (CGFloat)cellHeight
{
    return 160;
}

@end
