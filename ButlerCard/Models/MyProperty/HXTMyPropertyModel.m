//
//  HXTMyPropertyModel.m
//  ButlerCard
//
//  Created by johnny tang on 3/10/14.
//  Copyright (c) 2014 johnny tang. All rights reserved.
//

#import "HXTMyPropertyModel.h"

@implementation HXTMyPropertyModel

+ (HXTMyPropertyModel *)sharedInstance {
    static HXTMyPropertyModel *myProprtyModel;
    if (!myProprtyModel) {
        myProprtyModel = [[HXTMyPropertyModel alloc] init];
        myProprtyModel.housingEstateNames = @[@"中铁八局", @"万科A小区", @"置信A区", @"华润AA",
                                              @"保利别墅A", @"恒大宅院", @"万达高层", @"置信B区",
                                              @"华润凤凰城", @"万科V地", @"保利商业", @"中铁Q区",
                                              @"小区13", @"小区14", @"小区15", @"小区16"];
    }
    
    return myProprtyModel;
}

@end
