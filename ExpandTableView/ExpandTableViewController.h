//
//  ExpandTableViewController.h
//  ExpandTableView
//
//  Created by andyzhang on 13-7-15.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionHeaderView.h"
@interface ExpandTableViewController : UITableViewController<SectionHeaderViewProtocol>

@property (nonatomic,strong)NSArray *playsArray;
@property (nonatomic,strong)NSMutableArray *sectionInfoArray;

@end
