//
//  YYHQuestionItem.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHQuestionItem.h"
/*
 @property (nonatomic, strong) NSString *A;
 @property (nonatomic, strong) NSString *B;
 @property (nonatomic, strong) NSString *C;
 @property (nonatomic, strong) NSString *D;


 @property (nonatomic, strong) NSString *CorrectAnswer;
 @property (nonatomic, strong) NSString *Image;

@property (nonatomic, strong) NSString *Question;
 
 @property (nonatomic, assign) YYHType Type;


@property (nonatomic, assign) YYHCategory Category;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, strong) NSIndexPath *current;
 */

@implementation YYHQuestionItem : NSObject 

- (void)encodeWithCoder:(NSCoder *)aCoder{
    

    [aCoder encodeObject:self.A forKey:@"A"];
    [aCoder encodeObject:self.B forKey:@"B"];
    [aCoder encodeObject:self.C forKey:@"C"];
    [aCoder encodeObject:self.D forKey:@"D"];

    [aCoder encodeObject:self.CorrectAnswer forKey:@"CorrectAnswer"];
    [aCoder encodeObject:self.Image forKey:@"Image"];
    [aCoder encodeObject:self.Question forKey:@"Question"];

    /*
     self.Category = [aDecoder decodeIntegerForKey:@"Category"];
     self.Type = [aDecoder decodeIntegerForKey:@"Type"];
     self.total = [aDecoder decodeIntegerForKey:@"total"];

     self.current = [aDecoder decodeObjectForKey:@"current"];
     */
    [aCoder encodeInteger:self.Category forKey:@"Category"];
    [aCoder encodeInteger:self.Type forKey:@"Type"];
    [aCoder encodeObject:self.current forKey:@"current"];


}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.A = [aDecoder decodeObjectForKey:@"A"];
        self.B = [aDecoder decodeObjectForKey:@"B"];
        self.C = [aDecoder decodeObjectForKey:@"C"];
        self.D = [aDecoder decodeObjectForKey:@"D"];

        self.CorrectAnswer = [aDecoder decodeObjectForKey:@"CorrectAnswer"];
        self.Image = [aDecoder decodeObjectForKey:@"Image"];
        self.Question = [aDecoder decodeObjectForKey:@"Question"];

        self.Category = [aDecoder decodeIntegerForKey:@"Category"];
        self.Type = [aDecoder decodeIntegerForKey:@"Type"];
        self.total = [aDecoder decodeIntegerForKey:@"total"];
        
        self.current = [aDecoder decodeObjectForKey:@"current"];
        

    }

    return self;
}
@end
