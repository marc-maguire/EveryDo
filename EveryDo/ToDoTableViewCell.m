//
//  ToDoTableViewCell.m
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell

-(void)updateDisplay {
    
    self.title = self.toDo.title;
    self.descriptionPreview = self.toDo.description;
    self.priorityLevel = self.toDo.priorityLevel;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
