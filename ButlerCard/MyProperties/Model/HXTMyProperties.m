//
//  HXTMyProperties.m
//  ButlerCard
//
//  Created by johnny tang on 3/10/14.
//  Copyright (c) 2014 johnny tang. All rights reserved.
//

#import "HXTMyProperties.h"
#import "HXTPropertyCell.h"

static HXTMyProperties *myProprtyModel;

@implementation HXTMyProperties

- (id) init {
    self = [super init];
    if (self) {
        _properties = [[NSMutableArray alloc] initWithCapacity:0];
        _allHousingEstateNames = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

+ (HXTMyProperties *)sharedInstance {
    if (!myProprtyModel) {
        myProprtyModel = [[HXTMyProperties alloc] init];
        [myProprtyModel.allHousingEstateNames addObjectsFromArray:@[@"中铁八局", @"万科A小区", @"置信A区", @"华润AA",
<<<<<<< HEAD
                                                                    @"保利别墅A", @"恒大宅院", @"万达高层", @"置信B区",
                                                                    @"华润凤凰城", @"万科V地", @"保利商业", @"中铁Q区",
                                                                    @"小区13", @"小区14", @"小区15", @"小区16",
=======
                                                                   @"保利别墅A", @"恒大宅院", @"万达高层", @"置信B区",
                                                                   @"华润凤凰城", @"万科V地", @"保利商业", @"中铁Q区",
>>>>>>> FETCH_HEAD
                                                                    @"小区13", @"小区14", @"小区15", @"小区16"]];
        
        HXTPropertyCell * aProperty = [[HXTPropertyCell alloc] init];
        aProperty.house.housingEstatename = @"中铁八局";
        aProperty.house.imageName = @"house";
        aProperty.house.buildingNo = 1;
        aProperty.house.unitNo = 2;
<<<<<<< HEAD
        aProperty.house.houseNo = 301;
=======
        aProperty.house.roomNo = 301;
>>>>>>> FETCH_HEAD
        for (NSUInteger i = 0; i < 5; i++) {
            HXTPropertyFeeCell *aFeeCell = [[HXTPropertyFeeCell alloc] init];
            [aProperty.fees addObject:aFeeCell];
        }
        [myProprtyModel.properties addObject:aProperty];
        
        aProperty = [[HXTPropertyCell alloc] init];
        aProperty.house.housingEstatename = @"万科A小区";
        aProperty.house.imageName = @"house";
        aProperty.house.buildingNo = 2;
        aProperty.house.unitNo = 3;
<<<<<<< HEAD
        aProperty.house.houseNo = 302;
=======
        aProperty.house.roomNo = 302;
>>>>>>> FETCH_HEAD
        for (NSUInteger i = 0; i < 5; i++) {
            HXTPropertyFeeCell *aFeeCell = [[HXTPropertyFeeCell alloc] init];
            [aProperty.fees addObject:aFeeCell];
        }
        [myProprtyModel.properties addObject:aProperty];
        
        aProperty = [[HXTPropertyCell alloc] init];
        aProperty.house.housingEstatename = @"置信A区";
        aProperty.house.imageName = @"house";
        aProperty.house.buildingNo = 2;
        aProperty.house.unitNo = 3;
<<<<<<< HEAD
        aProperty.house.houseNo = 303;
=======
        aProperty.house.roomNo = 303;
>>>>>>> FETCH_HEAD
        for (NSUInteger i = 0; i < 5; i++) {
            HXTPropertyFeeCell *aFeeCell = [[HXTPropertyFeeCell alloc] init];
            [aProperty.fees addObject:aFeeCell];
        }
        [myProprtyModel.properties addObject:aProperty];
        
        aProperty = [[HXTPropertyCell alloc] init];
        aProperty.house.housingEstatename = @"华润AA";
        aProperty.house.imageName = @"house";
        aProperty.house.buildingNo = 2;
        aProperty.house.unitNo = 3;
<<<<<<< HEAD
        aProperty.house.houseNo = 304;
=======
        aProperty.house.roomNo = 304;
>>>>>>> FETCH_HEAD
        for (NSUInteger i = 0; i < 5; i++) {
            HXTPropertyFeeCell *aFeeCell = [[HXTPropertyFeeCell alloc] init];
            [aProperty.fees addObject:aFeeCell];
        }
        [myProprtyModel.properties addObject:aProperty];
    }
    
    return myProprtyModel;
}

@end
