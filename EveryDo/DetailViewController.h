//
//  DetailViewController.h
//  EveryDo
//
//  Created by Marc Maguire on 2017-05-16.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"



@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo  *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;




@end

