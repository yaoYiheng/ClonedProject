//
//  YYHQuestionItem.m
//  NZ Driving Test
//
//  Created by 姚懿恒 on 2017/5/19.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import "YYHQuestionItem.h"


@implementation YYHQuestionItem : NSObject 

- (void)encodeWithCoder:(NSCoder *)aCoder{
    

    [aCoder encodeObject:self.A forKey:@"A"];
    [aCoder encodeObject:self.B forKey:@"B"];
    [aCoder encodeObject:self.C forKey:@"C"];
    [aCoder encodeObject:self.D forKey:@"D"];

    [aCoder encodeObject:self.CorrectAnswer forKey:@"CorrectAnswer"];
    [aCoder encodeObject:self.Image forKey:@"Image"];
    [aCoder encodeObject:self.Question forKey:@"Question"];


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
