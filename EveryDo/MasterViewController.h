//
//  MasterViewController.h
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addToDoViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <addToDoDelegate>


-(void)saveToDo:(ToDo *)toDo;

@end

