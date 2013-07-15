//
//  QuoteCell.h
//  ExpandTableView
//
//  Created by andyzhang on 13-7-15.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quotation.h"
#import "HighlightingTextView.h"

@interface QuoteCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *characterLabel;
@property (nonatomic, weak) IBOutlet UILabel *actAndSceneLabel;
@property (weak, nonatomic) IBOutlet UITextView *quotationTextView;
@property (nonatomic, strong) Quotation *quotation;


@end
