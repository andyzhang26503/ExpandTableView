//
//  SectionHeaderView.h
//  ExpandTableView
//
//  Created by andyzhang on 13-7-15.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SectionHeaderView;
@protocol SectionHeaderViewProtocol <NSObject>

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section;
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section;

@end

@interface SectionHeaderView : UITableViewHeaderFooterView


@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *disclosureButton;

@property (nonatomic, assign)NSInteger section;

@property (nonatomic, weak)id<SectionHeaderViewProtocol> delegate;
@end
