//
//  YYHQuestionsCollectionViewController.h
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/23.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYHQuestionItem;

@interface YYHQuestionsCollectionViewController : UIViewController

/** <#comments#>*/
@property (nonatomic, strong) YYHQuestionItem *questionItem;
/** question array*/
@property (nonatomic, strong) NSArray *questionArray;
@end
