//
//  NSString+Size.h
//  CRVisibleCellsDemo
//
//  Created by Charon on 17/2/8.
//  Copyright © 2017年 Charon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGSize)stringSizeWithContentSize:(CGSize)contentSize font:(UIFont *)font;

@end
