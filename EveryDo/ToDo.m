//
//  ToDo.m
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString *)title andDescription:(NSString *)description andPriorityNumber:(NSUInteger *)priorityNumber {
    
    if (self = [super init]) {
        _title = title;
        _toDoDescription = description;
        _priorityNumber = priorityNumber;
        _isCompleted = NO;
        
        
    }
    return self;
}

- (instancetype)init {
    
    return [self initWithTitle:@"" andDescription:@"" andPriorityNumber:0];

}

@end
