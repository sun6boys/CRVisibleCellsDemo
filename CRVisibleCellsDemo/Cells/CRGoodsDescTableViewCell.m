//
//  CRGoodsDescTableViewCell.m
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import "CRGoodsDescTableViewCell.h"
#import "NSString+Size.h"

NSString * const kCRGoodsDescTableViewCellIdentifier = @"kCRGoodsDescTableViewCellIdentifier";

@interface CRGoodsDescTableViewCell()

@property (nonatomic, weak) IBOutlet UILabel *goodsDescLabel;
@end

@implementation CRGoodsDescTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configWithGoodsDesc:(NSString *)goodsDesc
{
    self.goodsDescLabel.text = goodsDesc;
}

+ (CGFloat)cellHeightWithGoodsDesc:(NSString *)goodsDesc
{
    CGSize size = [goodsDesc stringSizeWithContentSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 30, MAXFLOAT) font:[UIFont systemFontOfSize:13.f]];
    return ceil(size.height) + 16;
}

@end
