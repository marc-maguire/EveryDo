//
//  ToDoTableViewCell.m
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell

-(void)updateDisplayTaskNotComplete {
    
    self.title.text = self.toDo.title;
    self.descriptionPreview.text = self.toDo.toDoDescription;
    self.priorityLevel.text = [NSString stringWithFormat:@"%lu",self.toDo.priorityLevel];
}

-(void)updateDisplayTaskComplete {
    
    
    NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    //if wanted colour strikethrough : NSStrikethroughColorAttributeName: [UIColor redColor]
    
    NSAttributedString* attributedTitle = [[NSAttributedString alloc] initWithString:self.toDo.title attributes:attributes];
    NSAttributedString* attributedDescription = [[NSAttributedString alloc] initWithString:self.toDo.description attributes:attributes];
    NSAttributedString* attributedPriorityLevel = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%lu",self.toDo.priorityLevel] attributes:attributes];

    self.title.attributedText = attributedTitle;
    self.descriptionPreview.attributedText = attributedDescription;
    self.priorityLevel.attributedText = attributedPriorityLevel;


    
    
    
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
