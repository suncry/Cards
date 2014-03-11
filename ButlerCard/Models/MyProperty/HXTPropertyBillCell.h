//
//  HXTPropertyBillCell.h
//  ButlerCard
//
//  Created by johnny tang on 3/10/14.
//  Copyright (c) 2014 johnny tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HXTPropertyBillDetailCell;

@interface HXTPropertyBillCell : NSObject
@property (assign, nonatomic) float     money;
@property (assign, nonatomic) BOOL      bindCard;
@property (strong, nonatomic) NSMutableArray *billDetails;
@end
