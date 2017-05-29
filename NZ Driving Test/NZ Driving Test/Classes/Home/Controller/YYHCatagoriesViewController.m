//
//  YYHCatagoriesViewController.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/22.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHCatagoriesViewController.h"
#import "YYHQuestionItem.h"
#import "MJExtension.h"
#import "YYHQuestionsCollectionViewController.h"
#import "YYHCatagoriesCell.h"

@interface YYHCatagoriesViewController ()

@property (nonatomic, strong) NSMutableArray *allForEach;
/** behaviour*/
@property (nonatomic, strong) NSMutableArray *behaviour;
/** emergincies*/
@property (nonatomic, strong) NSMutableArray *emergincies;
/** sign*/
@property (nonatomic, strong) NSMutableArray *signs;
/** postition*/
@property (nonatomic, strong) NSMutableArray *position;
/** parking*/
@property (nonatomic, strong) NSMutableArray *parking;
/** intersection*/
@property (nonatomic, strong) NSMutableArray *intersection;
/** for core*/
@property (nonatomic, strong) NSMutableArray *core;
/** Class2*/
@property (nonatomic, strong) NSMutableArray *class2;
/** class3_5*/
@property (nonatomic, strong) NSMutableArray *class3_5;
/** bike*/
@property (nonatomic, strong) NSMutableArray *bikepSecific;

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

/** categories array*/
@property (nonatomic, strong) NSArray *categoreis;

@end

@implementation YYHCatagoriesViewController


static NSString * const cellID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    


    self.navigationItem.title = self.titleForNav;

    self.tableView.backgroundColor = [UIColor blackColor];



//
//    [self loadData];

    self.categoreis = @[@"模拟测试", @"核心问题", @"紧急情况问题", @"泊车问题", @"路标与路牌问题", @"道路位置问题", @"交叉路口的让路问题"];

//    [self.tableView registerNib:[UINib nibWithNibName:@"YYHCatagoriesCell" bundle:nil] forCellReuseIdentifier:cellID];


    
}
#pragma mark - -------tableView data sourse--------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    YYHCatagoriesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

//    cell.contents = 
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.categoreis[indexPath.row]];



    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
#pragma mark - -------tableView Delegate--------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    YYHQuestionsCollectionViewController *questionVC = [[YYHQuestionsCollectionViewController alloc] init];

    //for random test
    if (indexPath.row == 0) {

        //加载35道随机的问题
        NSMutableArray *randomArray = [NSMutableArray array];

        NSInteger count = randomArray.count;

//        for (NSInteger index = 0; index < 35; index++) {
//
//            uint32_t randomCount = (uint32_t)self.typesArray.count;
//
//            uint32_t randomIndex = arc4random_uniform(randomCount);
//            YYHQuestionItem *randonItem = self.typesArray[randomIndex];
//
//            //make sure that every item in array is unique
//            if ([randomArray containsObject:randonItem]) {
//                YYHLog(@"------%@", randomArray);
//                continue;
//
//            }
//            [randomArray addObject:randonItem];
//
//
//    }
        while (count < 35)
        {
            uint32_t randomCount = (uint32_t)self.typesArray.count;

            uint32_t randomIndex = arc4random_uniform(randomCount);
            YYHQuestionItem *randonItem = self.typesArray[randomIndex];

            //make sure that every items in array is unique
            if ([randomArray containsObject:randonItem]) {
                continue;
            }
            [randomArray addObject:randonItem];
            count++;
            YYHLog(@"%ld", count);
        }


        questionVC.questionArray = randomArray;
    }


    //for core questions
    if(indexPath.row == 1){
//        NSMutableArray *coreArray = [NSMutableArray array];
        
        questionVC.questionArray = self.coreC;
    }
    else if (indexPath.row == 2){
        questionVC.questionArray = self.emerginciesC;
    }
    else if (indexPath.row == 3){
        questionVC.questionArray = self.parkingC;
    }
    else if (indexPath.row == 4){
        questionVC.questionArray = self.signsC;
    }
    else if (indexPath.row == 5){
        questionVC.questionArray = self.positionC;
    }
    else if (indexPath.row == 6){
        questionVC.questionArray = self.intersectionC;
    }

    [self presentViewController:questionVC animated:YES completion:nil];



}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoreis.count;
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

- (void)setTypesArray:(NSMutableArray *)typesArray{
    _typesArray = typesArray;

    YYHFunc
    [self configureBlock];

    [self.typesArray enumerateObjectsUsingBlock:self.seperateItems];

//    [self.typesArray enumerateObjectsUsingBlock:self.seperateItems];

}
//- (void)loadData{
//
//    self.allQuestionsCN = [YYHQuestionItem mj_objectArrayWithFilename: @"中文版问题.plist"];
//
//    self.allQuestionEN = [YYHQuestionItem mj_objectArrayWithFilename: @"正确.plist"];
//
//
//
//    [self.allQuestionsCN enumerateObjectsUsingBlock:^(YYHQuestionItem * questionItem, NSUInteger idx, BOOL * _Nonnull stop) {
//        //
//        if (questionItem.Type == YYHTypeCar) {
//            [self.carTypeArray addObject:questionItem];
//        }
//        else if (questionItem.Type == YYHTypeMotorcycle){
//            [self.motorcycleTypeArray addObject:questionItem];
//        }
//        else if (questionItem.Type == YYHTypeHeavyVehicle){
//            [self.heavyTpyeArray addObject:questionItem];
//        }
//    }];
//
//    //从每个类型中分离出不同的类别
//    
//
//    [self.carTypeArray enumerateObjectsUsingBlock:self.seperateItems];
//    [self.motorcycleTypeArray enumerateObjectsUsingBlock:self.seperateItems];
//    [self.heavyTpyeArray enumerateObjectsUsingBlock:self.seperateItems];
//
//    YYHLog(@"%ld--%ld--%ld", self.carTypeArray.count, self.motorcycleTypeArray.count, self.heavyTpyeArray.count);
//}


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

- (NSMutableArray *)allForEach{
    if (!_allForEach) {
        _allForEach = [NSMutableArray array];
    }
    return _allForEach;
}
- (NSMutableArray *)behaviour{
    if (!_behaviour) {
        _behaviour = [NSMutableArray array];
    }
    return _behaviour;
}
- (NSMutableArray *)core{
    if (!_core) {
        _core = [NSMutableArray array];
    }
    return _core;
}
- (NSMutableArray *)class3_5{
    if (!_class3_5) {
        _class3_5 = [NSMutableArray array];
    }
    return _class3_5;
}
- (NSMutableArray *)class2{
    if (!_class2) {
        _class2 = [NSMutableArray array];
    }
    return _class2;
}
- (NSMutableArray *)parking{
    if (!_parking) {
        _parking = [NSMutableArray array];
    }
    return _parking;
}
- (NSMutableArray *)position{
    if (!_position) {
        _position = [NSMutableArray array];
    }
    return _position;
}
- (NSMutableArray *)intersection{
    if (!_intersection) {
        _intersection = [NSMutableArray array];
    }
    return _intersection;
}
- (NSMutableArray *)emergincies{
    if (!_emergincies) {
        _emergincies = [NSMutableArray array];
    }
    return _emergincies;
}
- (NSMutableArray *)bikepSecific{
    if (!_bikepSecific) {
        _bikepSecific = [NSMutableArray array];
    }
    return _bikepSecific;
}
- (NSMutableArray *)signs{
    if (!_signs) {
        _signs = [NSMutableArray array];
    }
    return _signs;
}

- (NSMutableArray *)allForEachC{
    if (!_allForEachC) {
        _allForEachC = [NSMutableArray array];
    }
    return _allForEachC;
}
- (NSMutableArray *)behaviourC{
    if (!_behaviourC) {
        _behaviourC = [NSMutableArray array];
    }
    return _behaviourC;
}
- (NSMutableArray *)coreC{
    if (!_coreC) {
        _coreC = [NSMutableArray array];
    }
    return _coreC;
}
- (NSMutableArray *)class3_5C{
    if (!_class3_5C) {
        _class3_5C = [NSMutableArray array];
    }
    return _class3_5C;
}
- (NSMutableArray *)class2C{
    if (!_class2C) {
        _class2C = [NSMutableArray array];
    }
    return _class2C;
}
- (NSMutableArray *)parkingC
{
    if (!_parkingC) {
        _parkingC = [NSMutableArray array];
    }
    return _parkingC;
}
- (NSMutableArray *)positionC{
    if (!_positionC) {
        _positionC = [NSMutableArray array];
    }
    return _positionC;
}
- (NSMutableArray *)intersectionC{
    if (!_intersectionC) {
        _intersectionC = [NSMutableArray array];
    }
    return _intersectionC;
}
- (NSMutableArray *)emerginciesC{
    if (!_emerginciesC) {
        _emerginciesC = [NSMutableArray array];
    }
    return _emerginciesC;
}
- (NSMutableArray *)bikepSecificC{
    if (!_bikepSecificC) {
        _bikepSecificC = [NSMutableArray array];
    }
    return _bikepSecificC;
}
- (NSMutableArray *)signsC{
    if (!_signsC) {
        _signsC = [NSMutableArray array];
    }
    return _signsC;
}

@end
