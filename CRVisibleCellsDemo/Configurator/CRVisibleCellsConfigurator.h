//
//  CRVisibleCellsConfigurator.h
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSInteger, CRVisibleCellType){
    CRVisibleCellTypeBanner = 0,
    CRVisibleCellTypeGoodsName,
    CRVisibleCellTypeGoodsDesc,
    CRVisibleCellTypeGoodsPrice,
    CRVisibleCellTypePromotion,
    CRVisibleCellTypeHasSelected,
    CRVisibleCellTypeCommentHeader,
    CRVisibleCellTypeComment,
    CRVisibleCellTypeStoreInfo,
    CRVisibleCellTypeRecommend
};

@interface CRVisibleCellsConfigurator : NSObject

@property (nonatomic, copy) NSArray *bannerPics;
@property (nonatomic, copy) NSString *goodsName;
@property (nonatomic, copy) NSString *goodsDesc;
@property (nonatomic, copy) NSString *goodsPrice;
@property (nonatomic, copy) NSArray *promotions;
@property (nonatomic, copy) NSArray *comments;
@property (nonatomic, copy) NSString *storeName;
@property (nonatomic, copy) NSArray *recommendGoods;

@property (nonatomic, assign) BOOL isBannerVisible;
@property (nonatomic, assign) BOOL isGoodsNameCellVisible;
@property (nonatomic, assign) BOOL isGoodsDescCellVisible;
@property (nonatomic, assign) BOOL isGoodsPriceCellVisible;
@property (nonatomic, assign) BOOL isPromotionCellVisible;
@property (nonatomic, assign) BOOL isHasSelectedCellVisible;
@property (nonatomic, assign) BOOL isCommentCellVisible;
@property (nonatomic, assign) BOOL isStoreInfoCellVisible;
@property (nonatomic, assign) BOOL isRecommendCellVisible;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (CGFloat)heightForHeaderInSection:(NSInteger)section;

//测试
- (void)didSelectedRowAtSection:(NSInteger)section;

@end
