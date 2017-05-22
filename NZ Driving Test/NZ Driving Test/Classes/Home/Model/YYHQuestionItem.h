//
//  YYHQuestionItem.h
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//



typedef NS_ENUM(NSInteger, YYHType) {
    YYHTypeCar = 0,
    YYHTypeMotorcycle = 1,
    YYHTypeHeavyVehicle = 2,

};
typedef NS_ENUM(NSInteger, YYHCategory) {
    YYHCategoryAll = 0,
    YYHCategoryBehaviour = 1,
    YYHCategoryCore = 2,
    YYHCategoryEmergencies = 3,
    YYHCategoryIntersection = 4,
    YYHCategoryParking = 5,
    YYHCategoryRoadposition = 6,
    YYHCategorySigns = 7,
    YYHCategoryClass2 = 8,
    YYHCategoryClass3To5 = 9,
    YYHCategoryBikeSpecific = 10,
};
#import <Foundation/Foundation.h>

@interface YYHQuestionItem : NSObject
/** <#comments#>*/
@property (nonatomic, strong) NSString *A;
@property (nonatomic, strong) NSString *B;
@property (nonatomic, strong) NSString *C;
@property (nonatomic, strong) NSString *D;


@property (nonatomic, strong) NSString *CorrectAnswer;
@property (nonatomic, strong) NSString *Image;
/** <#comments#>*/
@property (nonatomic, strong) NSString *Question;
/** type*/
@property (nonatomic, assign) YYHType Type;

/** catagories*/
@property (nonatomic, assign) YYHCategory Category;
/** totla*/
@property (nonatomic, assign) NSInteger total;
/** current*/
@property (nonatomic, strong) NSIndexPath *current;


@end
