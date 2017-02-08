//
//  CRGoodsDescTableViewCell.h
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kCRGoodsDescTableViewCellIdentifier;

@interface CRGoodsDescTableViewCell : UITableViewCell

- (void)configWithGoodsDesc:(NSString *)goodsDesc;

+ (CGFloat)cellHeightWithGoodsDesc:(NSString *)goodsDesc;

@end
