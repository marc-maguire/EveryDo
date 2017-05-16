//
//  ToDo.h
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *toDoDescription;
@property (nonatomic) NSUInteger *priorityLevel;
@property (nonatomic) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title andDescription:(NSString *)description andPriorityNumber:(NSUInteger *)priorityNumber;

@end
