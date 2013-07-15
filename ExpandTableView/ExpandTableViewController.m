//
//  ExpandTableViewController.m
//  ExpandTableView
//
//  Created by andyzhang on 13-7-15.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import "ExpandTableViewController.h"
#import "Play.h"
#import "SectionHeaderView.h"
#import "SectionInfo.h"
#import "QuoteCell.h"

#define HeaderViewReuseId @"HeaderViewReuseId"

#define DEFAULT_ROW_HEIGHT 88
#define HEADER_HEIGHT 48
@interface ExpandTableViewController ()

@end

@implementation ExpandTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UINib *headerNib = [UINib nibWithNibName:@"SectionHeaderView" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:headerNib forHeaderFooterViewReuseIdentifier: HeaderViewReuseId];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ((self.sectionInfoArray==nil)||(self.sectionInfoArray.count != [self numberOfSectionsInTableView:self.tableView])) {
        NSMutableArray *infoArray = [[NSMutableArray alloc] init];
        
        for (Play *play in self.playsArray) {
            SectionInfo *sectionInfo = [[SectionInfo alloc] init];
            sectionInfo.play = play;
            sectionInfo.open = NO;
            
            NSNumber *defaultRowHeight = @(DEFAULT_ROW_HEIGHT);
            NSInteger countOfQuotation = [[sectionInfo.play quotations] count];
            for (NSInteger i=0; i<countOfQuotation; i++) {
                [sectionInfo insertObject:defaultRowHeight inRowHeightsAtIndex:i];
            }
            
            [infoArray addObject:sectionInfo];
        }
        
        self.sectionInfoArray = infoArray;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    SectionInfo *sectionInfo = self.sectionInfoArray[section];
    NSInteger numStoriesInSection = [[sectionInfo.play quotations] count];
    
    
    return sectionInfo.open?numStoriesInSection:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    QuoteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //Play *play = self.playsArray[indexPath.row];
    
    Play *play = [(self.sectionInfoArray[indexPath.section]) play];
    cell.quotation = play.quotations[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    
    SectionHeaderView *sectionHeaderView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderViewReuseId];
    
//    APLSectionInfo *sectionInfo = (self.sectionInfoArray)[section];
//    
//    sectionHeaderView.titleLabel.text = sectionInfo.play.name;
//    sectionHeaderView.section = section;
//    sectionHeaderView.delegate = self;
    
    return sectionHeaderView;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
