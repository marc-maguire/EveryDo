//
//  ToDoTableViewCell.h
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface ToDoTableViewCell : UITableViewCell

@property (nonatomic) ToDo *toDo;
@property (nonatomic) IBOutlet UILabel *title;
@property (nonatomic) IBOutlet UILabel *descriptionPreview;
@property (nonatomic) IBOutlet UILabel *priorityLevel;

-(void)updateDisplayTaskNotComplete;
-(void)updateDisplayTaskComplete;



@end
