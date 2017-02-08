//
//  ViewController.m
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import "ViewController.h"
#import "CRVisibleCellsConfigurator.h"

#import "CRBannerTableViewCell.h"
#import "CRGoodsNameTableViewCell.h"
#import "CRGoodsDescTableViewCell.h"
#import "CRGoodsPriceTableViewCell.h"
#import "CRPromotionTableViewCell.h"
#import "CRHasSelectedTableViewCell.h"
#import "CRCommentTableViewCell.h"
#import "CRCommentHeaderTableViewCell.h"
#import "CRStoreInfoTableViewCell.h"
#import "CRRecommendTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CRVisibleCellsConfigurator *cellConfigurator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellConfigurator numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case CRVisibleCellTypeBanner:
        {
            CRBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRBannerTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        case CRVisibleCellTypeGoodsName:
        {
            CRGoodsNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRGoodsNameTableViewCellIdentifier forIndexPath:indexPath];
            [cell configWithGoodsName:self.cellConfigurator.goodsName];
            return cell;
        }
        case CRVisibleCellTypeGoodsDesc:
        {
            CRGoodsDescTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRGoodsDescTableViewCellIdentifier forIndexPath:indexPath];
            [cell configWithGoodsDesc:self.cellConfigurator.goodsDesc];
            return cell;
        }
        case CRVisibleCellTypeGoodsPrice:
        {
            CRGoodsPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRGoodsPriceTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        case CRVisibleCellTypePromotion:
        {
            CRPromotionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRPromotionTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        case CRVisibleCellTypeHasSelected:
        {
            CRHasSelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRHasSelectedTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        case CRVisibleCellTypeCommentHeader:
        {
            CRCommentHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CRCommentHeaderTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        case CRVisibleCellTypeComment:
        {
            CRCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRCommentTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        case CRVisibleCellTypeStoreInfo:
        {
            CRStoreInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRStoreInfoTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        case CRVisibleCellTypeRecommend:
        {
            CRRecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCRRecommendTableViewCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        default:
            break;
    }
    return [[UITableViewCell alloc] init];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case CRVisibleCellTypeBanner:
        {
            return [CRBannerTableViewCell cellHeight];
        }
        case CRVisibleCellTypeGoodsName:
        {
            return [CRGoodsNameTableViewCell cellHeightWithGoodsName:self.cellConfigurator.goodsName];
        }
        case CRVisibleCellTypeGoodsDesc:
        {
            return [CRGoodsDescTableViewCell cellHeightWithGoodsDesc:self.cellConfigurator.goodsDesc];
        }
        case CRVisibleCellTypeGoodsPrice:
        {
            return 44.f;
        }
        case CRVisibleCellTypePromotion:
        {
            return 44.f; //该高度需要根据有多少条促销信息计算，我暂且写死，可以拿到数据后在CRVisibleCellsConfigurator中缓存高度
        }
        case CRVisibleCellTypeHasSelected:
        {
            return 44.f;
        }
        case CRVisibleCellTypeCommentHeader:
        {
            return 44.f;
        }
        case CRVisibleCellTypeComment:
        {
            return 80.f;  //需要根据评论内容计算高度缓存
        }
        case CRVisibleCellTypeStoreInfo:
        {
            return 85.f;
        }
        case CRVisibleCellTypeRecommend:
        {
            return 110.f;
        }
        default:
            break;
    }
    return CGFLOAT_MIN;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self.cellConfigurator heightForHeaderInSection:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.cellConfigurator didSelectedRowAtSection:indexPath.section];
    [tableView reloadData];
}

#pragma mark - getters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        
        [_tableView registerNib:[UINib nibWithNibName:@"CRBannerTableViewCell" bundle:nil] forCellReuseIdentifier:kCRBannerTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRGoodsNameTableViewCell" bundle:nil] forCellReuseIdentifier:kCRGoodsNameTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRGoodsDescTableViewCell" bundle:nil] forCellReuseIdentifier:kCRGoodsDescTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRGoodsPriceTableViewCell" bundle:nil] forCellReuseIdentifier:kCRGoodsPriceTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRPromotionTableViewCell" bundle:nil] forCellReuseIdentifier:kCRPromotionTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRHasSelectedTableViewCell" bundle:nil] forCellReuseIdentifier:kCRHasSelectedTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRCommentTableViewCell" bundle:nil] forCellReuseIdentifier:kCRCommentTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRCommentHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:CRCommentHeaderTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRStoreInfoTableViewCell" bundle:nil] forCellReuseIdentifier:kCRStoreInfoTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CRRecommendTableViewCell" bundle:nil] forCellReuseIdentifier:kCRRecommendTableViewCellIdentifier];
    }
    return _tableView;
}

- (CRVisibleCellsConfigurator *)cellConfigurator
{
    if (_cellConfigurator == nil) {
        _cellConfigurator = [[CRVisibleCellsConfigurator alloc] init];
    }
    return _cellConfigurator;
}

@end
