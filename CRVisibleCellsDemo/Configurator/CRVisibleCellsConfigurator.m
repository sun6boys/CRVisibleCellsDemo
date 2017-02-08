//
//  CRVisibleCellsConfigurator.m
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import "CRVisibleCellsConfigurator.h"

@implementation CRVisibleCellsConfigurator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bannerPics = @[@1];
        _goodsName = @"三星(SAMSUNG) 750 EVO 250G SATA3 固态硬盘";
        _goodsDesc = @"价格亲民，高速犹存！读写给力，意想不到的惊喜！更快速的增强版SSD>>>";
        _goodsPrice = @"2993.5";
        _promotions = @[@"满500减20"];
        _comments = @[@"东西不错，正品",@"这是个demo，这是个demo，这是个demo，这是个demo，这是个demo，这是个demo"];
        _storeName = @"三星官方旗舰店";
        _recommendGoods = @[@"1",@"2"];
    }
    return self;
}

#pragma mark - public methods
- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case CRVisibleCellTypeBanner:
            return self.isBannerVisible;
        case CRVisibleCellTypeGoodsName:
            return self.isGoodsNameCellVisible;
        case CRVisibleCellTypeGoodsDesc:
            return self.isGoodsDescCellVisible;
        case CRVisibleCellTypeGoodsPrice:
            return self.isGoodsPriceCellVisible;
        case CRVisibleCellTypePromotion:
            return self.isPromotionCellVisible;
        case CRVisibleCellTypeHasSelected:
            return self.isHasSelectedCellVisible;
        case CRVisibleCellTypeCommentHeader:
            return self.isCommentCellVisible;
        case CRVisibleCellTypeComment:
            return self.comments.count;
        case CRVisibleCellTypeStoreInfo:
            return self.isStoreInfoCellVisible;
        case CRVisibleCellTypeRecommend:
            return self.isRecommendCellVisible;
        default:
            break;
    }
    return 0;
}

- (CGFloat)heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case CRVisibleCellTypeHasSelected:
            return self.isHasSelectedCellVisible ? 10.f : CGFLOAT_MIN;
        case CRVisibleCellTypeCommentHeader:
            return self.isCommentCellVisible ? 10.f : CGFLOAT_MIN;
        case CRVisibleCellTypeStoreInfo:
            return self.isStoreInfoCellVisible ? 10.f : CGFLOAT_MIN;
        case CRVisibleCellTypeRecommend:
            return self.isRecommendCellVisible ? 10.f : CGFLOAT_MIN;
        default:
            break;
    }
    return CGFLOAT_MIN;
}

- (void)didSelectedRowAtSection:(NSInteger)section
{
    switch (section) {
        case CRVisibleCellTypeBanner:
            self.bannerPics = @[];
            break;
        case CRVisibleCellTypeGoodsName:
            self.goodsName = nil;
            break;
        case CRVisibleCellTypeGoodsDesc:
            self.goodsDesc = nil;
            break;
        case CRVisibleCellTypeGoodsPrice:
            self.goodsPrice = nil;
            break;
        case CRVisibleCellTypePromotion:
            self.promotions = nil;
            break;
        case CRVisibleCellTypeCommentHeader:
            self.comments = nil;
            break;
        case CRVisibleCellTypeComment:
        {
            NSMutableArray *tempArray = self.comments.mutableCopy;
            [tempArray removeLastObject];
            self.comments = tempArray;
        }
            break;
        case CRVisibleCellTypeStoreInfo:
            self.storeName = nil;
            break;
        case CRVisibleCellTypeRecommend:
            self.recommendGoods = nil;
            break;
        default:
            break;
    }

}

#pragma mark - getters
- (BOOL)isBannerVisible
{
    return self.bannerPics.count;
}

- (BOOL)isGoodsNameCellVisible
{
    return self.goodsName.length > 0;
}

- (BOOL)isGoodsDescCellVisible
{
    return self.goodsDesc.length > 0;
}

- (BOOL)isGoodsPriceCellVisible
{
    return self.goodsPrice.length > 0;
}

- (BOOL)isPromotionCellVisible
{
    return self.promotions.count;
}

- (BOOL)isHasSelectedCellVisible
{
    return YES;
}

- (BOOL)isCommentCellVisible
{
    return self.comments.count;
}

- (BOOL)isStoreInfoCellVisible
{
    return self.storeName > 0;
}

- (BOOL)isRecommendCellVisible
{
    return self.recommendGoods.count;
}

@end
