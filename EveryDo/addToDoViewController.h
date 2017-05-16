//
//  addToDoViewController.h
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol addToDoDelegate <NSObject>

- (void)saveToDo:(ToDo *)toDo;

@end

@interface addToDoViewController : UIViewController

@property (nonatomic) id <addToDoDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;



@end
