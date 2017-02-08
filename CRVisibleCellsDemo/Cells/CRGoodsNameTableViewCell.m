//
//  CRGoodsNameTableViewCell.m
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import "CRGoodsNameTableViewCell.h"
#import "NSString+Size.h"

NSString * const kCRGoodsNameTableViewCellIdentifier = @"kCRGoodsNameTableViewCellIdentifier";

@interface CRGoodsNameTableViewCell()

@property (nonatomic, weak) IBOutlet UILabel *goodsNameLabel;
@end

@implementation CRGoodsNameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configWithGoodsName:(NSString *)goodsName
{
    self.goodsNameLabel.text = goodsName;
}

+ (CGFloat)cellHeightWithGoodsName:(NSString *)goodsName
{
    CGSize size = [goodsName stringSizeWithContentSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 30, MAXFLOAT) font:[UIFont systemFontOfSize:16.f]];
    return ceil(size.height) + 23;
}

@end
