//
//  YYHHomeViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHHomeViewController.h"
#import "MJExtension.h"
#import "YYHQuestionItem.h"


#import "YYHChooseTypeView.h"
#import "YYHButtonOnChooseTyepView.h"

#import "YYHCatagoriesViewController.h"

@interface YYHHomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *MiddlePlaceHolder;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distanceToTop;



//Chinese proterty
@property (nonatomic, strong) NSMutableArray *allForEachC;
/** behaviour*/
@property (nonatomic, strong) NSMutableArray *behaviourC;
/** emergincies*/
@property (nonatomic, strong) NSMutableArray *emerginciesC;
/** sign*/
@property (nonatomic, strong) NSMutableArray *signsC;
/** postition*/
@property (nonatomic, strong) NSMutableArray *positionC;
/** parking*/
@property (nonatomic, strong) NSMutableArray *parkingC;
/** intersection*/
@property (nonatomic, strong) NSMutableArray *intersectionC;
/** for core*/
@property (nonatomic, strong) NSMutableArray *coreC;
/** Class2*/
@property (nonatomic, strong) NSMutableArray *class2C;
/** class3_5*/
@property (nonatomic, strong) NSMutableArray *class3_5C;
/** bike*/
@property (nonatomic, strong) NSMutableArray *bikepSecificC;


/** all */
@property (nonatomic, strong) NSArray *allQuestionsCN;
/** <#comments#>*/
@property (nonatomic, strong) NSArray *allQuestionEN;

/** carType*/
@property (nonatomic, strong) NSMutableArray *carTypeArray;

/** motorcycleType*/
@property (nonatomic, strong) NSMutableArray *motorcycleTypeArray;
/** heavyVehicle*/
@property (nonatomic, strong) NSMutableArray *heavyTpyeArray;
/** <#comments#>*/
@property (nonatomic, copy) void(^seperateItems)(id, NSUInteger, BOOL *);

@property (nonatomic, strong) NSMutableArray *heavy3_5TpyeArray;


/** array of all qustions*/
@property (nonatomic, strong) NSArray *allQuestionArray;
@end


@implementation YYHHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureBlock];
    [self loadData];
    YYHChooseTypeView *view = [YYHChooseTypeView creatViewFromNib];

    [self.MiddlePlaceHolder addSubview:view];


    self.navigationItem.title = @"首页";

    YYHLog(@"%f", YYHScreenH);

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(typeButtonDidClicked:) name:YYHTypeButtonDidClicked object:nil];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YYHTypeButtonDidClicked object:nil];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

//    //for different devices
    if (iphone4) {
        self.distanceToTop.constant = -5;

    }
    else if (iphone5) {
        self.distanceToTop.constant = 20;

    }
    else if (iphone6P || iphone7P)
    {
        self.distanceToTop.constant = 100;
    }

    
    YYHChooseTypeView *chooseView = self.MiddlePlaceHolder.subviews.firstObject;
    chooseView.frame = CGRectMake(0, 0, self.MiddlePlaceHolder.yyh_width, self.MiddlePlaceHolder.yyh_height);

}
#pragma mark - -------configure--------------
- (void)configureBlock{

    __weak typeof(self) weakSelf = self;
    self.seperateItems = ^(YYHQuestionItem * questionItem, NSUInteger idx, BOOL * _Nonnull stop){

        if (questionItem.Category == YYHCategoryBehaviour)
        {
            [weakSelf.behaviourC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryCore)
        {

            [weakSelf.coreC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryParking)
        {

            [weakSelf.parkingC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryRoadposition)
        {

            [weakSelf.positionC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategorySigns)
        {

            [weakSelf.signsC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryBikeSpecific)
        {

            [weakSelf.bikepSecificC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryEmergencies)
        {

            [weakSelf.emerginciesC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryIntersection)
        {

            [weakSelf.intersectionC addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryClass2)
        {

            [weakSelf.class2C addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryClass3To5)
        {

            [weakSelf.class3_5C addObject:questionItem];
        }
        
        
        
    };
}
#pragma mark - -------load data--------------


- (void)loadData{

    self.allQuestionsCN = [YYHQuestionItem mj_objectArrayWithFilename: @"中文版问题.plist"];

    self.allQuestionEN = [YYHQuestionItem mj_objectArrayWithFilename: @"正确.plist"];


#warning 在此可修改中文或英文版

    [self.allQuestionsCN enumerateObjectsUsingBlock:^(YYHQuestionItem * questionItem, NSUInteger idx, BOOL * _Nonnull stop) {
        if (questionItem.Category == YYHCategoryClass3To5) {
            [self.heavy3_5TpyeArray addObject:questionItem];
        }

        //
        if (questionItem.Type == YYHTypeCar) {
            [self.carTypeArray addObject:questionItem];
        }
        else if (questionItem.Type == YYHTypeMotorcycle){
            [self.motorcycleTypeArray addObject:questionItem];
        }
        else if (questionItem.Type == YYHTypeHeavyVehicle){
            [self.heavyTpyeArray addObject:questionItem];
        }
        else if (questionItem.Category == YYHCategoryClass3To5) {

        }
    }];

    //从每个类型中分离出不同的类别


    [self.carTypeArray enumerateObjectsUsingBlock:self.seperateItems];
    [self.motorcycleTypeArray enumerateObjectsUsingBlock:self.seperateItems];
    [self.heavyTpyeArray enumerateObjectsUsingBlock:self.seperateItems];


    
}
#pragma mark - -------addTargetForButton--------------
- (void)typeButtonDidClicked: (NSNotification *)notification{


    YYHButtonOnChooseTyepView *button = notification.object;
    NSLog(@"%ld", (long)button.tag);

    YYHCatagoriesViewController *catagory = [[YYHCatagoriesViewController alloc
                                              ] init];

    NSString *title = [button currentTitle];
    catagory.titleForNav = title;


    //应该在之前传入数组.
    //passing data depends on tag
    if(button.tag == 1){
        ///loading data for car type
        catagory.typesArray = self.carTypeArray;
        
    }

    if (button.tag == 2) {
        catagory.typesArray = self.motorcycleTypeArray;

    }

    if (button.tag == 3) {
        catagory.typesArray = self.heavy3_5TpyeArray;
    }
    //heavy
    if (button.tag == 4) {
        catagory.typesArray = self.heavyTpyeArray;
    }


    [self.navigationController pushViewController:catagory animated:YES];
}

#pragma mark - -------lazy loading--------------
- (NSMutableArray *)motorcycleTypeArray{
    if (!_motorcycleTypeArray) {
        _motorcycleTypeArray = [NSMutableArray array];
    }
    return _motorcycleTypeArray;
}

- (NSMutableArray *)heavyTpyeArray{
    if (!_heavyTpyeArray) {
        _heavyTpyeArray = [NSMutableArray array];
    }
    return  _heavyTpyeArray;
}
- (NSMutableArray *)carTypeArray{
    if (!_carTypeArray) {
        _carTypeArray = [NSMutableArray array];
    }
    return _carTypeArray;
}
- (NSMutableArray *)heavy3_5TpyeArray{
    if (!_heavy3_5TpyeArray) {
        _heavy3_5TpyeArray = [NSMutableArray array];
    }
    return _heavy3_5TpyeArray;
}
@end
